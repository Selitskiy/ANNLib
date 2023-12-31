classdef ReluLayers2Cl
    properties
    end

    methods

        function net = ReluLayers2Cl()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')
                %LrMultiplyLayer('inputFeatureExt', net.m_in, net.n_out)

                reluLayer
                %fullyConnectedLayer(net.k_hid1)               
                fullyConnectedLayer(net.k_hid2)
                reluLayer
                %fullyConnectedLayer(net.k_hid2)
                %reluLayer
                
                fullyConnectedLayer(net.n_out)
                softmaxLayer
                classificationLayer
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