classdef AEBaseNet2D < BaseNet2D

    properties
        k_inject
        k_bottle
        k_prod
        t_out_ae
        t_inp
    end

    methods
        function net = AEBaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff)

            net = net@BaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, ini_rate, max_epoch);

            net.t_out_ae = t_out_ae;

            net.k_inject = k_inject;
            net.k_prod = floor(net.m_in * net.n_out);
            net.k_bottle = floor(net.m_in * bottle_coeff);

            net.k_hid1 = floor(net.k_bottle * net.n_out);
            net.k_hid2 = floor(2 * net.k_bottle * net.n_out) + 1;

        end


        function [Y, Y2, Yhs2, Ya2, Yha2, Sa] = ReScaleOut(net, Y, Y2, Yhs2, Bo, Bto, n_sess, t_sess, sess_off, k_ob, k_tob, Yh2)

            for i = 1:n_sess
                % bounds over session
                MeanSess = Bo(3,:,i);
                StdSess = Bo(4,:,i);

                for j = 1:k_ob
                    for k = 0:net.t_inp

                    % extract and scale observation sequence
                    Myw = reshape( Y(:, (j-1)*(net.t_inp+1) + k + 1, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSess, StdSess);

                    My = reshape( Myw', [net.n_out,1] );
                    Y(:, (j-1)*(net.t_inp+1) + k + 1, i) = My(:);

                    end
                end
            end


            for i = 1:t_sess-sess_off
                for j = 1:k_tob
                    for k = 1:net.t_in

                    MeanSesst = Bto(3,:,j,i);
                    StdSesst = Bto(4,:,j,i);

                    Myw = reshape( Y2(:, (j-1)*net.t_in + k, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSesst, StdSesst);

                    My = reshape( Myw', [net.n_out,1] );
                    Y2(:, (j-1)*net.t_in + k, i) = My(:);


                    Myw = reshape( Yhs2(:, (j-1)*net.t_in + k, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSesst, StdSesst);

                    My = reshape( Myw', [net.n_out,1] );
                    Yhs2(:, (j-1)*net.t_in + k, i) = My(:);

                    end
                end
            end


            %Ya2 = zeros([net.n_out, k_tob-net.t_in-net.t_out_ae+1, t_sess-sess_off]);
            Ya2 = zeros([net.n_out, k_tob-net.t_in+1, t_sess-sess_off]);
            Yha2 = zeros([net.n_out, k_tob-net.t_in+1, t_sess-sess_off]);
            Sa = zeros([2,t_sess-sess_off]);

            for i = 1:t_sess-sess_off
                for j = net.t_in+net.t_out_ae-1:net.t_out_ae:k_tob

                    st_idx = j-net.t_in-net.t_out_ae+2;
                    end_idx = j-net.t_in+1;

                    if (end_idx) <= (k_tob-net.t_in+1)

                        Yha2(:, st_idx:end_idx, i) = Y2(:, (j-1)*net.t_out_ae+1:j*net.t_out_ae, i);

                        if (Sa(1,i) > st_idx) || (Sa(1,i) == 0)
                           Sa(1,i) = st_idx; 
                        end

                        if (Sa(2,i) < end_idx)
                            Sa(2,i) = end_idx; 
                        end

                    end


                    for k = 0:net.t_out_ae-1

                        if (j-net.t_in-k+1) > (k_tob-net.t_in+1)
                            continue;
                        end

                        Ya2(:, j-net.t_in-net.t_out_ae+2:j-net.t_in-k+1, i) =...
                        Ya2(:, j-net.t_in-net.t_out_ae+2:j-net.t_in-k+1, i) + Y2(:, (j-1-k)*net.t_out_ae+k+1:(j-k)*net.t_out_ae, i); 

                    end
                end

                for j = net.t_in+net.t_out_ae-1:net.t_out_ae:k_tob
                    for k = 0:net.t_out_ae-1

                        if (j-net.t_in-k+1) > (k_tob-net.t_in+1)
                            continue;
                        end

                        Ya2(:, j-net.t_in-k+1, i) = Ya2(:, j-net.t_in-k+1, i)/(k+1); 

                    end
                end

            end

        end


        function [Ec, S2Q, S2MeanQ, S2StdQ, S2sQ, ma_errQ, sess_ma_idxQ, ob_ma_idxQ, mi_errQ, sess_mi_idxQ, ob_mi_idxQ] = Calc_cont_rmse(net, Y2, Yh2, k_tob) 
            [Ec, S2Q, S2MeanQ, S2StdQ, S2sQ, ma_errQ, sess_ma_idxQ, ob_ma_idxQ, mi_errQ, sess_mi_idxQ, ob_mi_idxQ] = generic_calc_ae_base_cont_rmse2D(Y2, Yh2, net.n_out, net.y_out, k_tob, net.t_in);
        end

        function Err_graph(net, M, Em, Er, l_whole_ex, Y2, Sy2, l_whole, l_sess, k_tob, t_sess, sess_off, offset, l_marg, modelName, yLab, Ya2, Sa)
            generic_err_ae_base_graph2D(M, Em, Er, l_whole_ex, Y2, Sy2, l_whole, l_sess, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, k_tob, t_sess, sess_off, offset, l_marg, modelName, yLab, Ya2, Sa);
        end
        
    end
end