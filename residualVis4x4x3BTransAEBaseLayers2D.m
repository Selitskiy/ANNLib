classdef residualVis4x4x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = residualVis4x4x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            v = floor(sqrt((net.m_in - net.k_inject)/3));
            %v = floor(sqrt(net.m_in - net.k_inject));
            h = v;
            fSizeX = 32;
            fSizeY = 32;
            fStrideX = 7;
            fStrideY = 7;
            conOut = ceil((h - fSizeX + 1)/fStrideX) * ceil((v - fSizeY + 1)/fStrideY)*3;
            %conOut = ceil((h - fSizeX + 1)/fStrideX) * ceil((v - fSizeY + 1)/fStrideY);

            layers = [
                featureInputLayer(net.m_in)

                %%residualConv2x1GaussLayer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 1, net.k_inject, 'conv2x1')
                %residualConv2x3GaussLayer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 1, net.k_inject, 'conv2x3')
                %residualFCLayer(conOut+net.k_inject, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                %residualCosPeTransformerLayer(net.m_in, net.k_inject, "PETrans")
                %residualFCLayer(net.m_in+net.k_inject, net.k_bottle0, net.k_inject, 'inputFeatureExt')

                residualFCLayer(net.m_in, net.k_bottle0, net.k_inject, 'inputFeatureExt')


                residualVis4x4x3BatchTransformerLayer(net.k_bottle0 + net.k_inject, net.l_patchV, net.l_patchH, net.k_inject, "Vis4x4x3PCTrans")

                residualFCLayer(net.k_bottle0 + net.k_inject, net.k_bottle0bw, net.k_inject, 'FeatureBottle')


                residualVis3x3CosPcTransformerLayer(net.k_bottle0bw+net.k_inject, net.l_patchV, net.l_patchH, net.k_inject, "Vis3x3x1PCTrans")

                residualFCLayer(net.k_bottle0bw+net.k_inject, net.k_bottle, net.k_inject, 'FeatureBottleBW')


                residualCosPcTransformerLayer(net.k_bottle + net.k_inject, net.k_inject, "PCTrans1a")
                
                residualFCLayer(net.k_bottle + net.k_inject*2, net.k_bottle1a, net.k_inject, 'FeatureBottle1a')


                residualCosPcTransformerLayer(net.k_bottle1a + net.k_inject, net.k_inject, "PCTrans1b")
                
                residualFCLayer(net.k_bottle1a + net.k_inject*2, net.k_bottle1b, net.k_inject, 'FeatureBottle1b')


                residualCosPcTransformerLayer(net.k_bottle1b + net.k_inject, net.k_inject, "PCTrans1c")
                
                residualFCLayer(net.k_bottle1b + net.k_inject*2, net.k_bottle1c, net.k_inject, 'FeatureBottle1c')


                residualCosPcTransformerLayer(net.k_bottle1c + net.k_inject, net.k_inject, "PCTrans2")
                
                residualFCLayer(net.k_bottle1c + net.k_inject*2, net.k_bottle2, net.k_inject, 'FeatureBottle2')


                %LrReLULayer('LrReLU0', net.k_bottle2 + net.k_inject, 1)


                %residualFCLayer(net.k_bottle2 + net.k_inject, net.n_out*net.k_bottle2, net.k_inject, 'FeatureExpansion1')

                %LrReLULayer('LrReLU1', net.n_out*net.k_bottle2 + net.k_inject, 1)

                %%residualFCLayer(net.n_out*net.k_bottle2 + net.k_inject, 2*net.n_out*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')


                %residualFCLayer(net.k_bottle2 + net.k_inject, 2*net.n_out*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')
                %residualFCLayer(net.k_bottle2 + net.k_inject, 2*198*net.k_bottle2+1, net.k_inject, 'FeatureExpansion2')
                %LrReLUFCLayer(net.k_bottle2+net.k_inject, 2*198*net.k_bottle2+1, 1, "KNetExt")
                LrReLUFCLayer(net.k_bottle2+net.k_inject, net.k_hid2, 1, "KNetExt")
                %LrReLUFC4x4Layer(net.k_bottle2+net.k_inject, net.k_hid2, 1, "KNetExt")
                
                %LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle2+1 + net.k_inject, 1)
                %LrReLULayer('LrReLU2', 2*198*net.k_bottle2+1, 1)
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