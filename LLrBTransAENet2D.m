classdef LLrBTransAENet2D < LLrBTransAELayers2D & AEBaseNet2D & AEInputNet2D

    properties
    end

    methods
        function net = LLrBTransAENet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff)

            net = net@AEBaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff);
            net = net@AEInputNet2D();
            net = net@LLrBTransAELayers2D();

            net.name = "llrBTransAe2d";

        end

    end
end