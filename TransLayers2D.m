classdef TransLayers2D
    properties
    end

    methods

        function net = TransLayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)
                %fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')
                %transformerLayer(net.k_hid1, "k_hid1")
                %layerNormalizationLayer('Name','fcNorm')
                %fullyConnectedLayer(net.k_hid1)

                transformerLayer(net.m_in, "k_hid1")
                %selfAttentionLayer(1, net.m_in)
                layerNormalizationLayer('Name','fcNorm')                

                fullyConnectedLayer(net.k_hid1,'Name','FeatureExt2')
                
                transformerLayer(net.k_hid1, "k_hid2")
                %selfAttentionLayer(1, net.k_hid1)
                layerNormalizationLayer('Name','fcNorm2')

                fullyConnectedLayer(net.k_hid2)
                
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