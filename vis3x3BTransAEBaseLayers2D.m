classdef vis3x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = vis3x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                %fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt') %6*6
                residualFCLayer(net.m_in, net.k_hid1, net.k_inject, 'inputFeatureExt')

                %vis3x3BatchTransformerLayer(9, "v_k_9") %6
                residualVis3x3BatchTransformerLayer(net.k_hid1+net.k_inject, 9, net.k_inject, "v_k_9")

                %fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 
                residualFCLayer(net.k_hid1+net.k_inject*2, net.k_bottle, net.k_inject, 'FeatureBottle')

                %dpBatchTransformerLayer(net.k_bottle, "b_k_hid1")
                %dpBatchTransformerLayer(net.k_hid1+net.k_inject, "b_k_hid1")
                residualDpBatchTransformerLayer(net.k_bottle+net.k_inject, net.k_inject, "b_k_hid1")

                %fullyConnectedLayer(net.k_bottle2,'Name','FeatureBottle2') 
                residualFCLayer(net.k_bottle+net.k_inject*2, net.k_bottle2, net.k_inject, 'FeatureBottle2')

                %LrReLULayer('LrReLU1', net.k_bottle2, 1)
                LrReLULayer('LrReLU1', net.k_bottle2+net.k_inject, 1)

                %fullyConnectedLayer(2*net.n_out*net.k_bottle2+1)
                residualFCLayer(net.k_bottle2+net.k_inject, 2*net.n_out*net.k_bottle2+1, net.k_inject, 'Feature2')

                LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle2+1+net.k_inject, 1)
                

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