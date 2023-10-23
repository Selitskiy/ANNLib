classdef Dp2BTransAEBaseLayers2D
    properties
    end

    methods

        function net = Dp2BTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                %LrMultiplyLayer("Multiply", net.m_in, floor(net.k_hid1/net.m_in)) 
                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')


                %dpBatchTransformerLayer(net.k_hid1, "b_k_hid1")
                %%dpTransformerLayer(net.k_hid1, "b_k_hid1")
                dp2BatchTransformerLayer(net.k_hid1, "b_k_hid1")

                %reluLayer
                %%LrReLULayer('LrReLU0', net.k_hid1, 1)

                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 

                %reluLayer
                %tanhLayer
                %GaussianRBFLayer('RBF1', net.t_in*3)
                LrReLULayer('LrReLU1', net.k_bottle, 1)
                %LrLReLULayer('LrLReLU1', net.t_in*3, 1, 0.1)
                %dpBatchTransformerLayer(net.t_in*3, "b_t_in")

                fullyConnectedLayer(2*net.n_out*net.k_bottle+1)

                %reluLayer
                %tanhLayer
                %GaussianRBFLayer('RBF2', 2*net.n_out+1)
                LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle+1, 1)
                %LrLReLULayer('LrLReLU2', 2*net.n_out+1, 1, 0.1)
                %dpBatchTransformerLayer(2*net.n_out+1, "b_n_out")

                %fullyConnectedLayer(2*net.n_out+1)


                fullyConnectedLayer(net.n_out)%+1)
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