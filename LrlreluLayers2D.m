classdef LrlreluLayers2D
    properties
    end

    methods

        function net = LrlreluLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')
                LrLReLULayer("LrLReLU1", net.k_hid1, 1, 0.1)

                %LrMultiplyLayer('inputFeatureExt', net.m_in, net.n_out)
                %leakyReluLayer(0.1)
                %LrLReLULayer("LrLReLU1", net.k_hid1, 1, 0.1)

                fullyConnectedLayer(net.k_hid2)
                LrLReLULayer('LrLReLU2', net.k_hid2, 1, 0.1)
                %fullyConnectedLayer(net.k_hid2)

                fullyConnectedLayer(net.n_out)
                regressionLayer
            ];

            net.lGraph = layerGraph(layers);

            net.options = trainingOptions('adam', ...
                'ExecutionEnvironment','auto',...
                'Shuffle', 'every-epoch',...
                'MiniBatchSize', net.mb_size, ...
                'InitialLearnRate', net.ini_rate, ...
                'MaxEpochs',net.max_epoch);

                 %'Plots', 'training-progress',...
        end

        
    end
end