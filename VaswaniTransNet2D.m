classdef VaswaniTransNet2D < VaswaniTransLayers2D & AEBaseNet2D & AEInputNet2D

    properties
    end

    methods
        function net = VaswaniTransNet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff)

            net = net@AEBaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff);
            net = net@AEInputNet2D();
            net = net@VaswaniTransLayers2D();

            net.name = "vasTransAe2d";

        end


        %function [net, X, Y, Bi, Bo, XI, C, Sx, Sy, k_ob] = TrainTensors(net, M, l_sess, n_sess, norm_fli, norm_flo)

        %    [net, X, Y, Bi, Bo, XI, C, Sx, Sy, k_ob] = TrainTensors@MLPInputNet2D(net, M, l_sess, n_sess, norm_fli, norm_flo);

        %    net = Create(net);
                 
        %end



        %function net = Train(net, i, X, Y)
        %    fprintf('Training %s Reg net %d\n', net.name, i); 

        %    net = Train@MLPInputNet2D(net, i, X, Y);
        %end

        
    end
end