classdef vis4x4x3BTransAEBaseLayers2D
    properties
    end

    methods

        function net = vis4x4x3BTransAEBaseLayers2D()
        end


        function net = Create(net)

            v = floor(sqrt(net.m_in - net.k_inject));
            h = v;
            fSizeX = 8;
            fSizeY = 8;
            fStrideX = 8;
            fStrideY = 8;

            layers = [
                featureInputLayer(net.m_in)

                %cosPeTransformerLayer(net.m_in, "PeT")

                residualConv2x1Layer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 10, net.k_inject, 'conv2x1')

                fullyConnectedLayer(net.k_bottle0,'Name','inputVisGrid')

                vis4x4x3BatchTransformerLayer(net.k_bottle0, net.l_patchV, net.l_patchH, "visBT")


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle')

                cosPcTransformerLayer(net.k_bottle, "BT")

                

                fullyConnectedLayer(net.k_bottle2,'Name','FeatureBottle2')

                %LrReLULayer('LrReLU0', net.k_bottle2, 1)


                %fullyConnectedLayer(net.k_hid1,'Name','FeatureExpansion')

                %LrReLULayer('LrReLU1', net.k_hid1, 1)



                %fullyConnectedLayer(net.k_hid2,'Name','FeatureExpansion2')
                %fullyConnectedLayer(2*198*net.k_bottle2+1,'Name','FeatureExpansion2')
                LrReLUFCLayer(net.k_bottle2, 2*198*net.k_bottle2+1, 1, "KNetExt")

                %LrReLULayer('LrReLU2', net.k_hid2, 1)
                LrReLULayer('LrReLU2', 2*198*net.k_bottle2+1, 1)


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
