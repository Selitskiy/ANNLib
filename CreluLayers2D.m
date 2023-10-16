classdef CreluLayers2D
    properties
    end

    methods

        function net = CreluLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')

                CReLULayer("CReLU1")
                fullyConnectedLayer(net.k_hid2)

                CReLULayer("CReLU2")
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