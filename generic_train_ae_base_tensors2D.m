function [X, Xc, Xr, Xs, Ys, Y, Bi, Bo, XI, C, Sx, Sy, k_ob, t_inp, Vit, Xp, Xcp, Xrp, Xsp, PcaSc] = generic_train_ae_base_tensors2D(M, x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, l_sess, n_sess, norm_fli, norm_flo, x_pca, k_inj)
    %t_inp - training overflow to give stability
    t_inp = floor(t_out_ae * 1.2);

    % Number of observations in a session
    k_ob = l_sess - t_in - t_inp + 1 - t_in - t_out_ae;

    m_in = x_in * t_in;
    n_out = y_out * t_out;

    m_pca = x_pca * t_in;

    % Re-format input into session tensor
    % ('ones' (not 'zeros') for X are for bias 'trick'
    X = zeros([m_in+k_inj, k_ob*(t_inp+1), n_sess]);

    Xc = zeros([x_in, t_in, 1, k_ob, n_sess]);
    Xr = ones([m_in+1, k_ob, n_sess]);
    Xs = zeros([x_in, t_in, k_ob, n_sess]);
    Ys = zeros([y_out, t_out, k_ob, n_sess]);
    %Ys = zeros([n_in, k_ob, n_sess]);

    %Y = zeros([n_out+1, k_ob*t_in, n_sess]);
    Y = zeros([n_out, k_ob*(t_inp+1), n_sess]);

    Bi = zeros([4, x_in, n_sess]);
    Bo = zeros([4, y_out, n_sess]);


    %Segment boundaries
    Sx = zeros([2, k_ob, n_sess]);
    %Sys = zeros([2, k_ob, n_sess]);
    Sy = zeros([2, k_ob, n_sess]);

    %PCA
    V = zeros([x_in, x_in, n_sess]);
    Vi = zeros([x_in, x_in, n_sess]);
    Vit = zeros([x_pca, x_in, n_sess]);
    It = zeros([x_in, n_sess]);
    PcaSc = zeros([x_in, n_sess]);

    Xp  = zeros([m_pca, k_ob, n_sess]);
    Xcp = zeros([x_pca, t_in, 1, k_ob, n_sess]);
    Xrp = ones([m_pca+1, k_ob, n_sess]);
    Xsp = zeros([x_pca, t_in, k_ob, n_sess]);


    k_iob = k_ob * n_sess;
    XI = zeros([m_in, k_iob]);
    I = zeros([k_iob, 1]);


    for i = 1:n_sess
        for j = 1:k_ob
            for k = 0:t_inp
            % extract and scale observation sequence
            idx = (i-1)*l_sess + j;

            st_idx = idx;
            end_idx = idx+t_in-1;
            Sx(1,j,i) = st_idx;
            Sx(2,j,i) = end_idx;

            Mxw = M(st_idx:end_idx, x_off+1:x_off+x_in);

            Mx = reshape( Mxw', [m_in,1] );
            %X(1:m_in, j + k*k_ob, i) = Mx(:);
            %X(m_in+1, j + k*k_ob, i) = k+1;
            %X(m_in+2, j + k*k_ob, i) = log(k+1);
            X(1:m_in, (j-1)*(t_inp+1) + k + 1, i) = Mx(:);
            X(m_in+1, (j-1)*(t_inp+1) + k + 1, i) = k;
            X(m_in+2, (j-1)*(t_inp+1) + k + 1, i) = log(k+1);

            Xr(1:m_in, j, i) = Mx(:);
            Xc(:, :, 1, j, i) = Mxw';
            Xs(:,:,j,i) = Mxw';


            st_idx = idx+t_in+k;
            end_idx = idx+t_in+k+t_out-1;
            Sy(1,j,i) = st_idx;
            Sy(2,j,i) = end_idx;

            Myw = M(st_idx:end_idx, y_off+1:y_off+y_out);

            My = reshape( Myw', [n_out,1] );
            Y(1:n_out, (j-1)*(t_inp+1) + k + 1, i) = My(:);
            %%Y(n_out+1, j + k*k_ob, i) = k;

            Ys(:,:, j, i) = Myw';


            i_idx = (i-1)*k_ob + j;
            XI(1:m_in, i_idx) = Mx(:);
            I(i_idx) = i;

            end
        end


        idx = (i-1)*l_sess;

        %Normalize input and output on the same training-only input interval
        st_idx = idx+1;
        end_idx = idx+k_ob+t_out-1;

        Mxw = M(st_idx:end_idx, x_off+1:x_off+x_in);
        % scale bounds over observation span
        [Bi(1,:,i), Bi(2,:,i)] = bounds(Mxw,1);
        Bi(3,:,i) = mean(Mxw,1);
        Bi(4,:,i) = std(Mxw,0,1);


        %PCA
        if norm_fli
            MeanSessi = Bi(3,:,i);
            StdSessi = Bi(4,:,i);
            Mxw = generic_mean_std_scale2D(Mxw, MeanSessi, StdSessi);
        end
        [~, Vit(:,:,i), Vi(:,:,i), V(:,:,i), It(:,i), PcaSc(:,i)] = pca_create(Mxw', x_pca, 0);
         


        Myw = M(st_idx:end_idx, y_off+1:y_off+y_out);
        [Bo(1,:,i), Bo(2,:,i)] = bounds(Myw,1);
        Bo(3,:,i) = mean(Myw,1);
        Bo(4,:,i) = std(Myw,0,1);


        if(norm_fli)
            for j = 1:k_ob
                for k = 0:t_inp
                % extract and scale observation sequence
                idx = (i-1)*l_sess + j;
            
                Mxw = M(idx:idx+t_in-1, x_off+1:x_off+x_in);
                % bounds over session
                MeanSessi = Bi(3,:,i);
                StdSessi = Bi(4,:,i);

                Mxw = generic_mean_std_scale2D(Mxw, MeanSessi, StdSessi);

                Mx = reshape( Mxw', [m_in,1] );
                X(1:m_in, (j-1)*(t_inp+1) + k + 1, i) = Mx(:);
                %X(m_in+1, (j-1)*(t_inp+1) + k + 1, i) = (k)/t_in;
                %X(m_in+2, (j-1)*(t_inp+1) + k + 1, i) = log(k+1)/log(t_in);

                Xr(1:m_in, j, i) = Mx(:);
                Xc(:, :, 1, j, i) = Mxw';
                Xs(:,:,j,i) = Mxw';


                %PCA
                Mxwp = pca_map(Mxw', Vit(:,:,i));
                Mxp = reshape( Mxwp, [m_pca,1] );
                Xp(1:m_pca, j, i) = Mxp;
                Xrp(1:m_pca, j, i) = Mxp;
                Xcp(:, :, 1, j, i) = Mxwp;
                Xsp(:,:,j,i) = Mxwp;


                i_idx = (i-1)*k_ob + j;
                XI(1:m_in, i_idx) = Mx(:);
                I(i_idx) = i;

                end
            end
        else
            for j = 1:k_ob
                % extract and scale observation sequence
                idx = (i-1)*l_sess + j;
            
                Mxw = M(idx:idx+t_in-1, x_off+1:x_off+x_in);

                %PCA
                Mxwp = pca_map(Mxw', Vit(:,:,i));
                Mxp = reshape( Mxwp, [m_pca,1] );
                Xp(1:m_pca, j, i) = Mxp;
                Xrp(1:m_pca, j, i) = Mxp;
                Xcp(:, :, 1, j, i) = Mxwp;
                Xsp(:,:,j,i) = Mxwp;

            end
        end

        if(norm_flo)
            for j = 1:k_ob
                for k = 0:t_inp
                % extract and scale observation sequence
                idx = (i-1)*l_sess + j;
                
                st_idx = idx+t_in+k;
                end_idx = idx+t_in+k+t_out-1;

                Myw = M(st_idx:end_idx, y_off+1:y_off+y_out);
                % bounds over session
                MeanSesso = Bo(3,:,i);
                StdSesso = Bo(4,:,i);

                Myw = generic_mean_std_scale2D(Myw, MeanSesso, StdSesso);

                My = reshape( Myw', [n_out,1] );
                Y(1:n_out, (j-1)*(t_inp+1) + k + 1, i) = My(:);
                %%Y(n_out+1, (j-1)*(t_inp+1) + k + 1, i) = (k+1)/t_in;

                Ys(:,:, j, i) = Myw';

                end
            end
        end
    end

    C = categorical(I);
end