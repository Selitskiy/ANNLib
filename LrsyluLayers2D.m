classdef LrsyluLayers2D
    properties
    end

    methods

        function net = LrsyluLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')
                %LrMultiplyLayer('inputFeatureExt', net.m_in, net.n_out)

                LrSyLULayer('LrSyLU1', net.k_hid1, 0)
                fullyConnectedLayer(net.k_hid2)

                LrSyLULayer('LrSyLU2', net.k_hid2, 0)
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