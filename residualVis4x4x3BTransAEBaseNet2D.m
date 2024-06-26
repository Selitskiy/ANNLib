classdef residualVis4x4x3BTransAEBaseNet2D < residualVis4x4x3BTransAEBaseLayers2D & BaseNet2D & MLPInputNet2D

    properties
        k_bottle0
        k_bottle0bw
        k_bottle
        k_bottle1a
        k_bottle1b
        k_bottle1c
        k_bottle2
        k_inject
        k_patchV
        k_patchH

        l_patchV 
        l_patchH
    end

    methods
        function net = residualVis4x4x3BTransAEBaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, ini_rate, max_epoch,...
                bottle_coeff, bottle_coeff1a, bottle_coeff1b, bottle_coeff2, l_patchV, l_patchH, k_inject, hid2_coeff)

            net = net@BaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, ini_rate, max_epoch);
            net = net@MLPInputNet2D();
            net = net@residualVis4x4x3BTransAEBaseLayers2D();

            net.k_patchV = 4;
            net.k_patchH = 4;

            net.l_patchV = l_patchV;
            net.l_patchH = l_patchH;

            net.k_inject = k_inject;

            m_in_int = l_patchV*net.k_patchV * l_patchH*net.k_patchH * 3;
            net.k_bottle0 = floor(net.m_in / m_in_int) * m_in_int;

            m_in_int_bw = l_patchV*3 * l_patchH*3;
            net.k_bottle0bw = m_in_int_bw;

            net.k_bottle = floor(net.k_bottle0bw * bottle_coeff);

            net.k_bottle1a = floor(net.k_bottle * bottle_coeff1a);
            net.k_bottle1b = floor(net.k_bottle1a * bottle_coeff1b);
            net.k_bottle1c = floor(net.k_bottle1b * bottle_coeff2);

            %net.k_bottle2 = floor(net.k_bottle1b * bottle_coeff2);
            net.k_bottle2 = floor(net.k_inject);

            net.k_hid1 = net.k_bottle2*net.n_out;
            %net.k_hid2 = floor(2*net.n_out*net.k_bottle2*hid2_coeff + 1);
            net.k_hid2 = floor((2*net.n_out*net.k_bottle2*hid2_coeff + 1)/16) * 16;

            net.name = "residualVis4x4x3bTransAeBase2d";

        end


        function [net, X, Y, Bi, Bo, XI, C, Sx, Sy, k_ob] = TrainTensors(net, M, l_sess, n_sess, norm_fli, norm_flo)

            [X, Xc, Xr, Xs, Ys, Y, Bi, Bo, XI, C, Sx, Sy, k_ob, t_inp] = generic_train_ae_base_tensors2D(M, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, l_sess, n_sess, norm_fli, norm_flo, net.x_in);
            net.mb_size = 2^floor(log2(k_ob*net.t_in)-4);
            if net.mb_size < 32
                net.mb_size = floor((k_ob*net.t_in)/4);
            end

            net.t_inp = t_inp;

            net = Create(net);
                 
        end

        function [X2, Y2, Yh2, Yhs2, Bti, Bto, XI2, Sx2, Sy2, k_tob] = TestTensors(net, M, l_sess, l_test, t_sess, sess_off, offset, norm_fli, norm_flo, Bi, Bo, k_tob)
            [X2, Xc2, Xr2, Xs2, Ys2, Ysh2, Yshs2, Y2, Yh2, Yhs2, Bti, Bto, XI2, Sx2, Sy2, k_tob] = generic_test_ae_base_tensors2D(M, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, l_sess, l_test, t_sess, sess_off, offset, norm_fli, norm_flo, Bi, Bo, k_tob, net.x_in, []);
        end



        function net = Train(net, i, X, Y)
            fprintf('Training %s Reg net %d\n', net.name, i); 

            net = Train@MLPInputNet2D(net, i, X, Y);
        end


        function [X2, Y2] = Predict(net, X2, Y2, regNets, XI2, identNets, t_sess, sess_off, k_tob)
            for i = 1:t_sess-sess_off

                % GPU on
                gpuDevice(1);
                reset(gpuDevice(1));

                for j = 1:k_tob
                    if size(identNets{1}) == 0
                        fprintf('IdentityClass Session:%d, Observation:%d\n', i, j);
                        regNet = regNets{i}.trainedNet;
                    else
                        i_idx = (i-1)*k_tob + j;
                        predictClass = classify(identNets{i+sess_off}.trainedNet, XI2(:, i_idx)'); %X2(:, j, i)');
                        prClNum = double(predictClass);
                        fprintf('IdentityClass Session:%d, Observation:%d, IdentClNum:%d\n', i, j, prClNum);

                        regNet = resetState(regNets{prClNum}.trainedNet);
                    end

                    for k = 0:net.t_in
                        predictedScores = predict(regNet, X2(:, j + k*k_tob, i)');
                        Y2(:, j + k*k_tob, i) = predictedScores';
                    end
                end

                % GPU off
                delete(gcp('nocreate'));
                gpuDevice([]);

            end
        end


        function [Y, Y2, Yhs2] = ReScaleOut(net, Y, Y2, Yhs2, Bo, Bto, n_sess, t_sess, sess_off, k_ob, k_tob)

            for i = 1:n_sess
                % bounds over session
                MeanSess = Bo(3,:,i);
                StdSess = Bo(4,:,i);

                for j = 1:k_ob
                    for k = 0:net.t_inp

                    % extract and scale observation sequence
                    Myw = reshape( Y(:, j + k*k_ob, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSess, StdSess);

                    My = reshape( Myw', [net.n_out,1] );
                    Y(:, j + k*k_ob, i) = My(:);

                    end
                end
            end


            for i = 1:t_sess-sess_off
                for j = 1:k_tob
                    for k = 0:net.t_in

                    MeanSesst = Bto(3,:,j,i);
                    StdSesst = Bto(4,:,j,i);

                    Myw = reshape( Y2(:, j + k*k_tob, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSesst, StdSesst);

                    My = reshape( Myw', [net.n_out,1] );
                    Y2(:, j + k*k_tob, i) = My(:);


                    Myw = reshape( Yhs2(:, j + k*k_tob, i), [net.y_out, net.t_out])';

                    Myw = generic_mean_std_rescale2D(Myw, MeanSesst, StdSesst);

                    My = reshape( Myw', [net.n_out,1] );
                    Yhs2(:, j + k*k_tob, i) = My(:);

                    end
                end
            end
        end

        function Err_graph(net, M, Em, Er, l_whole_ex, Y2, Sy2, l_whole, l_sess, k_tob, t_sess, sess_off, offset, l_marg, modelName, yLab)
            generic_err_ae_graph2D(M, Em, Er, l_whole_ex, Y2, Sy2, l_whole, l_sess, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, k_tob, t_sess, sess_off, offset, l_marg, modelName, yLab);
        end
        
    end
end