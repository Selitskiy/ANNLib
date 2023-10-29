classdef vis3x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = vis3x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                %%MultiplyLayer("Multiply", net.m_in, floor(net.k_hid1/net.m_in)) 
                %?LrMultiplyLayer("Multiply", net.m_in, floor(net.k_hid1/net.m_in)) 
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt') %6*6

                vis3x3BatchTransformerLayer(9, "v_k_9") %6


                %fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 

                %dpBatchTransformerLayer(net.k_bottle, "b_k_hid1")
                dpBatchTransformerLayer(net.k_hid1, "b_k_hid1")

                fullyConnectedLayer(net.k_bottle2,'Name','FeatureBottle2') 

                LrReLULayer('LrReLU1', net.k_bottle2, 1)


                fullyConnectedLayer(2*net.n_out*net.k_bottle2+1)

                LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle2+1, 1)
                

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