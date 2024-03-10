classdef Conv2x1PcTAELayers2D
    properties
    end

    methods

        function net = Conv2x1PcTAELayers2D()
        end


        function net = Create(net)

            v = sqrt(net.m_in - net.inj);
            h = v;
            fSizeX = 7;
            fSizeY = 7;
            fStrideX = 3;
            fStrideY = 3;
            conOut = ceil((h - fSizeX + 1)/fStrideX) * ceil((h - fSizeY + 1)/fStrideY);

            layers = [
                featureInputLayer(net.m_in,'Name','inputFeature')

                residualConv2x1Layer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 10, net.inj, 'conv2x1')

                fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')

                cosPcTransformerLayer(net.k_hid1, 'PcT')
                
                %conv2x1Layer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 10, 'conv2x1')
                
                %cosPcTransformerLayer(conOut, 'PcT')


                %concatenationLayer(1, 2,'Name','FeatureConcattenation')

                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 


                %LrReLULayer('LrReLU1', net.k_bottle, 1)
                
                LrReLUFCLayer(net.k_bottle, 2*net.n_out*net.k_bottle+1, 1, "KNetExt")
                %fullyConnectedLayer(2*net.n_out*net.k_bottle+1)

                
                LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle+1, 1)
                

                fullyConnectedLayer(net.n_out)
                regressionLayer
            ];
            cgraph = layerGraph(layers);


            %convLayers = [
            %    residualConv2x1Layer(v, h, fSizeX, fSizeY, fStrideX, fStrideY, 10, net.inj, 'conv2x1')
            %];
            %cgraph = addLayers(cgraph, convLayers);


            %cgraph = connectLayers(cgraph, 'inputFeature', 'conv2x1');
            %cgraph = connectLayers(cgraph, 'conv2x1','FeatureConcattenation/in2');


            net.lGraph = cgraph; %layerGraph(layers);

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
