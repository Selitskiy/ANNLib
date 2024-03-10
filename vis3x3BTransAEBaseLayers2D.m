classdef vis3x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = vis3x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)

                fullyConnectedLayer(net.k_bottle0,'Name','inputFeatureExt')

                vis3x3BatchTransformerLayer(9, 9, "v_k_9") 


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 

                dpBatchTransformerLayer(net.k_bottle, "b_k_hid1")


                fullyConnectedLayer(net.k_bottle2,'Name','FeatureBottle2') 


                LrReLULayer('LrReLU1', net.k_bottle2, 1)

                fullyConnectedLayer(net.k_hid2);


                LrReLULayer('LrReLU2', net.k_hid2, 1); 
                

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