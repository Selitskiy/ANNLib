classdef resTnTTnBTransAELayers2D
    properties
    end

    methods

        function net = resTnTTnBTransAELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in+net.k_inject)

                residualCosPeTransformerLayer(net.m_in+net.k_inject, net.k_inject, "pet_1")

                residualFCLayer(net.m_in+2*net.k_inject, net.k_prod+net.k_inject, net.k_inject, 'inputFeatureExt')


                residualCosPcTransformerLayer(net.k_prod+2*net.k_inject, net.k_inject, "pct_1")


                residualFCLayer(net.k_prod+3*net.k_inject, net.k_bottle+net.k_inject, net.k_inject,'FeatureBottle') 


                LrReLULayer('LrReLU1', net.k_bottle+2*net.k_inject, 1)
                

                residualFCLayer(net.k_bottle+2*net.k_inject, net.k_hid2+net.k_inject, net.k_inject,'FeatureExt2') 
                
                LrReLULayer('LrReLU2', net.k_hid2+2*net.k_inject, 1)
                

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