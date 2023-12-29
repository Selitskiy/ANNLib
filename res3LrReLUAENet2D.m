classdef resLrReLUAENet2D < resLrReLUAELayers2D & AEBaseNet2D & AEInputNet2D

    properties
    end

    methods
        function net = resLrReLUAENet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff)

            net = net@AEBaseNet2D(x_off, x_in, t_in, y_off, y_out, t_out, t_out_ae, ini_rate, max_epoch, k_inject, bottle_coeff);
            net = net@AEInputNet2D();
            net = net@resLrReLUAELayers2D();

            net.name = "resLrReluAe2d";

        end

        
    end
end