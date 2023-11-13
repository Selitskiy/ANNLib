classdef residualVis4x4x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = residualVis4x4x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                residualFCLayer(net.m_in, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                residualVis4x4x3BatchTransformerLayer(net.k_bottle0 + net.k_inject, net.l_patchV, net.l_patchH, net.k_inject, "v_k_9")


                residualFCLayer(net.k_bottle0 + net.k_inject*2, net.k_bottle, net.k_inject, 'FeatureBottle')

                residualDpBatchTransformerLayer(net.k_bottle + net.k_inject, net.k_inject, "b_k_hid1")

                
                residualFCLayer(net.k_bottle + net.k_inject*2, net.k_bottle2, net.k_inject, 'FeatureBottle2')

                LrReLULayer('LrReLU0', net.k_bottle2 + net.k_inject, 1)


                %residualFCLayer(net.k_bottle2 + net.k_inject, net.n_out*net.k_bottle2, net.k_inject, 'FeatureExpansion1')

                %LrReLULayer('LrReLU1', net.n_out*net.k_bottle2 + net.k_inject, 1)

                %%residualFCLayer(net.n_out*net.k_bottle2 + net.k_inject, 2*net.n_out*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')


                %residualFCLayer(net.k_bottle2 + net.k_inject, 2*net.n_out*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')
                residualFCLayer(net.k_bottle2 + net.k_inject, 2*198*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')
                %LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle2+1 + net.k_inject, 1)
                LrReLULayer('LrReLU2', 2*198*net.k_bottle2+1 + net.k_inject, 1)

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