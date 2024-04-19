classdef residualVis3x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = residualVis3x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            v = sqrt(net.m_in - net.k_inject);
            h = v;
            fSizeX = 7;
            fSizeY = 7;
            fStrideX = 1;
            fStrideY = 1;
            conOut = ceil((h - fSizeX + 1)/fStrideX) * ceil((v - fSizeY + 1)/fStrideY);

            layers = [
                featureInputLayer(net.m_in)

                %%residualCosPeTransformerLayer(net.m_in, net.k_inject, "PETrans")
                %%residualFCLayer(net.m_in+net.k_inject, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                %residualVis1x1CosPcTransformerLayer(net.m_in, net.k_inject, "PETrans")
                %residualFCLayer(net.m_in, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                %residualConv2x1GaussLayer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 40, net.k_inject, 'conv2x1')
                %%residualConv2x1Layer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 40, net.k_inject, 'conv2x1')
                %residualFCLayer(conOut+net.k_inject, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                %residualFCLayer(net.m_in, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                %residualVis3x3CosPcTransformerLayer(net.k_bottle0+net.k_inject, net.l_patchV, net.l_patchH, net.k_inject, "VisPCTrans")

                % no 'inputFeatureExt'
                residualVis3x3CosPcTransformerMixLayer(net.m_in, net.l_patchV, net.l_patchH, net.k_inject, "VisPCTrans")
                residualFCLayer(net.k_bottle0+net.k_inject*10, net.k_bottle, net.k_inject, 'FeatureBottle')


                %residualFCLayer(net.k_bottle0+net.k_inject, net.k_bottle, net.k_inject, 'FeatureBottle')


                residualCosPcTransformerLayer(net.k_bottle+net.k_inject, net.k_inject, "PCTrans")
                %residualCosPcTanhTransformerLayer(net.k_bottle+net.k_inject, net.k_inject, "PCTrans")
                %residualVis1x1CosPcTransformerLayer(net.k_bottle+net.k_inject, net.k_inject, "PCTrans")


                residualFCLayer(net.k_bottle+net.k_inject*2, net.k_bottle1a, net.k_inject, 'FeatureBottle1a')

                residualCosPcTransformerLayer(net.k_bottle1a+net.k_inject, net.k_inject, "PCTrans1a")
                %residualVis1x1CosPcTransformerLayer(net.k_bottle1a+net.k_inject, net.k_inject, "PCTrans1a")


                residualFCLayer(net.k_bottle1a+net.k_inject*2, net.k_bottle1b, net.k_inject, 'FeatureBottle1b')

                residualCosPcTransformerLayer(net.k_bottle1b+net.k_inject, net.k_inject, "PCTrans1b")
                %residualVis1x1CosPcTransformerLayer(net.k_bottle1a+net.k_inject, net.k_inject, "PCTrans1a")



                residualFCLayer(net.k_bottle1b+net.k_inject*2, net.k_bottle2, net.k_inject, 'FeatureBottle2')



                LrReLUFCLayer(net.k_bottle2+net.k_inject, net.k_hid2, 1, "KNetExt")

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