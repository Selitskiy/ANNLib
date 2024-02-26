classdef Conv2x1AELayers2D
    properties
    end

    methods

        function net = Conv2x1AELayers2D()
        end


        function net = Create(net)

            layers = [
                featureInputLayer(net.m_in)

                conv2x1Layer(28, 28, 7, 7, 1, 1, 10, 'conv2x1')


                fullyConnectedLayer(net.k_bottle,'Name','FeatureBottle') 


                LrReLULayer('LrReLU1', net.k_bottle, 1)
                

                fullyConnectedLayer(2*net.n_out*net.k_bottle+1)
                
                LrReLULayer('LrReLU2', 2*net.n_out*net.k_bottle+1, 1)
                

                fullyConnectedLayer(net.n_out)%+1)
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