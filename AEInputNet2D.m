classdef AEInputNet2D < MLPInputNet2D

    properties
    end

    methods
        function net = AEInputNet2D()

            net = net@MLPInputNet2D();

        end


        function [net, X, Y, Bi, Bo, XI, C, Sx, Sy, k_ob] = TrainTensors(net, M, l_sess, n_sess, norm_fli, norm_flo)

            [X, Xc, Xr, Xs, Ys, Y, Bi, Bo, XI, C, Sx, Sy, k_ob, t_inp] = generic_train_ae_base_tensors2D(M, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, l_sess, n_sess, norm_fli, norm_flo, net.x_in, net.k_inject);
            net.mb_size = 2^floor(log2(k_ob*net.t_in)-4);
            if net.mb_size < 32
                net.mb_size = floor((k_ob*net.t_in)/4);
            end

            net.t_inp = t_inp;

            net = net.Create();
                 
        end

        function [X2, Y2, Yh2, Yhs2, Bti, Bto, XI2, Sx2, Sy2, k_tob] = TestTensors(net, M, l_sess, l_test, t_sess, sess_off, offset, norm_fli, norm_flo, Bi, Bo, k_tob)
            [X2, Xc2, Xr2, Xs2, Ys2, Ysh2, Yshs2, Y2, Yh2, Yhs2, Bti, Bto, XI2, Sx2, Sy2, k_tob] = generic_test_ae_base_tensors2D(M, net.x_off, net.x_in, net.t_in, net.y_off, net.y_out, net.t_out, l_sess, l_test, t_sess, sess_off, offset, norm_fli, norm_flo, Bi, Bo, k_tob, net.x_in, [], net.k_inject);
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

                    %for k = 1:net.t_in
                    %    predictedScores = predict(regNet, X2(:, (j-1)*net.t_in+k, i)');
                    %    Y2(:, (j-1)*net.t_in+k, i) = predictedScores';
                    %end
                    predictedScores = predict(regNet, X2(:, (j-1)*net.t_in+1:j*net.t_in, i)');
                    Y2(:, (j-1)*net.t_in+1:j*net.t_in, i) = predictedScores';

                end

                % GPU off
                delete(gcp('nocreate'));
                gpuDevice([]);

            end
        end

        
    end
end