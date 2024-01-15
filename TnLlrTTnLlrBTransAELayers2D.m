classdef TnLlrTTnLlrBTransAELayers2D
    properties
    end

    methods

        function net = TnLlrTTnLlrBTransAELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in+net.k_inject)

                cosPeTnLrLReLUTransformerLayer(net.m_in+net.k_inject,1,1,1,1,"pet_1")

                %%MultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                %?LrMultiplyLayer("Multiply", net.m_in, floor(net.k_prod/net.m_in)) 
                fullyConnectedLayer(net.k_prod,'Name','inputFeatureExt')


                cosPcTnLrLReLUTransformerLayer(net.k_prod,1,1,1,1,"pct_1")
                %euBatchTransformerLayer(net.k_hid1, "b_k_hid1")
                %%vTransformerLayer(net.k_hid1, "b_k_hid1")
                %%dpTransformerLayer(net.k_hid1, "b_k_hid1")
                %%dp2BatchTransformerLayer(net.k_hid1, "b_k_hid1")


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 


                %?reluLayer
                %%tanhLayer
                %%GaussianRBFLayer('RBF1', net.k_bottle)

                LrReLULayer('LrReLU1', net.k_bottle, 1)
                
                %?LrLReLULayer('LrLReLU1', net.k_bottle, 1, 0.1)
                %%dpBatchTransformerLayer(net.t_in*3, "b_t_in")


                fullyConnectedLayer(net.k_hid2)


                %reluLayer
                %%tanhLayer
                %%GaussianRBFLayer('RBF2', 2*net.n_out*net.k_bottle+1)
                
                LrReLULayer('LrReLU2', net.k_hid2, 1)
                
                %?LrLReLULayer('LrLReLU2', 2*net.n_out*net.k_bottle+1, 1, 0.1)
                %%dpBatchTransformerLayer(2*net.n_out+1, "b_n_out")


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