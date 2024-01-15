classdef VaswaniTransLayers2D
    properties
    end

    methods

        function net = VaswaniTransLayers2D()
        end


        function net = Create(net)

             oLayers = [
                featureInputLayer(net.m_in+net.k_inject,'Name','inputFeature')
                %fullyConnectedLayer(net.k_hid1,'Name','inputFeatureExt')
                additionLayer(2,'Name','fcAgate')
                layerNormalizationLayer('Name','fcNorm')

                fullyConnectedLayer(net.m_in+net.k_inject,'Name','fcHidden')
                additionLayer(2,'Name','fcAgate2')
                layerNormalizationLayer('Name','fcNorm2')
                

                fullyConnectedLayer(net.k_prod,'Name','inputFeatureExt')


                additionLayer(2,'Name','fcAgate3')
                layerNormalizationLayer('Name','fcNorm3')

                fullyConnectedLayer(net.k_prod,'Name','fcHidden3')
                additionLayer(2,'Name','fcAgate4')
                layerNormalizationLayer('Name','fcNorm4')   


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle')


                %additionLayer(2,'Name','fcAgate5')
                %layerNormalizationLayer('Name','fcNorm5')

                %fullyConnectedLayer(net.k_bottle,'Name','fcHidden5')
                %additionLayer(2,'Name','fcAgate6')
                %layerNormalizationLayer('Name','fcNorm6')   


                fullyConnectedLayer(net.k_hid2,'Name','FeatureExt')


                fullyConnectedLayer(net.n_out,'Name','fcOut')
                regressionLayer('Name','regOut')
            ];
            cgraph = layerGraph(oLayers);

            tLayers = [
                vTransformerLayer(net.m_in+net.k_inject,'trans')
            ];

            cgraph = addLayers(cgraph, tLayers);
    
            cgraph = connectLayers(cgraph, 'inputFeature', 'trans');
            cgraph = connectLayers(cgraph,'trans','fcAgate/in2');

            cgraph = connectLayers(cgraph,'fcNorm','fcAgate2/in2');


            t2Layers = [
                vTransformerLayer(net.k_prod,'trans2')
            ];

            cgraph = addLayers(cgraph, t2Layers);
    
            cgraph = connectLayers(cgraph, 'inputFeatureExt', 'trans2');
            cgraph = connectLayers(cgraph,'trans2','fcAgate3/in2');

            cgraph = connectLayers(cgraph,'fcNorm3','fcAgate4/in2');
    

            net.lGraph = cgraph;

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