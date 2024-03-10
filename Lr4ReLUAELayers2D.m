classdef Lr4ReLUAELayers2D
    properties
    end

    methods

        function net = Lr4ReLUAELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in+net.k_inject)

                LrReLULayer('LrReLU-1', net.m_in+net.k_inject, 1)
                %%MultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                %?LrMultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                fullyConnectedLayer(net.k_prod,'Name','inputFeatureExt')

                %cosPcTransformerLayer(net.k_prod, "bt_k_prod")
                LrReLULayer('LrReLU0', net.k_prod, 1)


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 

                LrReLULayer('LrReLU1', net.k_bottle, 1)
                

                fullyConnectedLayer(net.k_hid2)
                
                LrReLULayer('LrReLU2', net.k_hid2, 1)
                

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
