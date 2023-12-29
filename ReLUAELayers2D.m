classdef ReLUAELayers2D
    properties
    end

    methods

        function net = ReLUAELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in+net.k_inject)

                %%MultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                %?LrMultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                fullyConnectedLayer(net.k_prod,'Name','inputFeatureExt')

                %cosPeTransformerLayer(net.k_prod, "bt_k_prod")


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 

                %LrReLULayer('LrReLU1', net.k_bottle, 1)
                reluLayer

                fullyConnectedLayer(net.k_hid2)
                
                %LrReLULayer('LrReLU2', net.k_hid2, 1)
                reluLayer

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