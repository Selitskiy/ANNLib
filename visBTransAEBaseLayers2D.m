classdef visBTransAEBaseLayers2D
    properties
    end

    methods

        function net = visBTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                %%MultiplyLayer("Multiply", net.m_in, floor(net.k_hid1/net.m_in)) 
                %?LrMultiplyLayer("Multiply", net.m_in, floor(net.k_hid1/net.m_in)) 
                fullyConnectedLayer(net.m_in,'Name','inputFeatureExt')

                dpBatchTransformerLayer(net.m_in, "b_k_hid1")
                %dpBatchSquizeTransformerLayer(net.k_hid1, 0.01, "b_k_hid1")

                %%batchNormalizationLayer('Name','fcNorm')


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle')


                %dpBatchTransformerLayer(net.k_bottle, "b_k_bottle")
                %fullyConnectedLayer(net.k_bottle2,'Name','FeatureBottle2')


                %eluLayer
                %?geluLayer
                %swishLayer
                %GaussianRBFLayer('RBF1', net.k_bottle)

                LrReLULayer('LrReLU0', net.k_bottle, 1)

                %dropoutLayer(0.25)


                %?fullyConnectedLayer(net.k_hid1,'Name','FeatureExpansion1')
                %?LrReLULayer('LrReLU1', net.k_hid1, 1)


                fullyConnectedLayer(net.k_hid2,'Name','FeatureExpansion2')

                %dpBatchTransformerLayer(net.k_hid2, "b_k_hid2")


                %reluLayer
                %eluLayer
                %?geluLayer
                %swishLayer
                %%tanhLayer
                %GaussianRBFLayer('RBF2', net.k_hid2)
                
                LrReLULayer('LrReLU2', net.k_hid2, 1)
                
                %LrLReLULayer('LrLReLU2', 2*net.n_out*net.k_bottle+1, 1, 0.1)
                %%dpBatchTransformerLayer(2*net.n_out+1, "b_n_out")

                %dropoutLayer(0.25)

                %%fullyConnectedLayer(2*net.n_out+1)


                fullyConnectedLayer(net.n_out)%+1)
                regressionLayer
                %softmaxLayer
                %classificationLayer
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