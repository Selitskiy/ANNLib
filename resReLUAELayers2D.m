classdef resReLUAELayers2D
    properties
    end

    methods

        function net = resReLUAELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in+net.k_inject)

                %residualTransformerLayer(net.m_in+net.k_inject, net.k_inject, "pet_tr")

                residualFCLayer(net.m_in+net.k_inject, net.k_prod+net.k_inject, net.k_inject, 'inputFeatureExt')


                %residualDpBatchTransformerLayer(net.k_prod+2*net.k_inject, net.k_inject, "b_k_hid1")


                residualFCLayer(net.k_prod+2*net.k_inject, net.k_bottle+net.k_inject, net.k_inject,'FeatureBottle') 


                reluLayer
                %LrReLULayer('LrReLU1', net.k_bottle+2*net.k_inject, 1)
                

                residualFCLayer(net.k_bottle+2*net.k_inject, net.k_hid2+net.k_inject, net.k_inject,'FeatureExt2') 
                
                reluLayer
                %LrReLULayer('LrReLU2', net.k_hid2+2*net.k_inject, 1)
                

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