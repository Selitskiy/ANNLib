classdef cosPeLrLReLUTransformerLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input channels
        numInChannels
        numOutChannels
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.
        
        % Weights
        Wq
        Wk

        %Bias
        Wq0
        Wk0

        %ReLU parms
        Aq
        Ak
        slopeAq
        slopeAk

        Bq
        Bk
        slopeBq
        slopeBk

    end

    %properties (State)
        % (Optional) Layer state parameters.

        % Declare state parameters here.
    %end

    %properties (Learnable, State)
        % (Optional) Nested dlnetwork objects with both learnable
        % parameters and state.

        % Declare nested networks with learnable and state parameters here.
    %end

    methods
        function layer = cosPeLrLReLUTransformerLayer(numInChannels, slopeAq, slopeAk, slopeBq, slopeBk, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Transformer" + numInChannels + " channels";

            layer.numInChannels = numInChannels;
            layer.numOutChannels = numInChannels;
            
            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numOutChannels + layer.numInChannels));
            
            layer.Wq = bound * (2. * rand([layer.numOutChannels, layer.numInChannels],'single') - 1.);
            layer.Wq0 = zeros([layer.numOutChannels, 1]);

            layer.Wk = bound * (2. * rand([layer.numOutChannels, layer.numInChannels],'single') - 1.);
            layer.Wk0 = zeros([layer.numOutChannels, 1]);


            %Init learnable slopes
            layer.slopeAq = slopeAq;

            if slopeAq == 0
                layer.Aq = rand([numInChannels 1]);
            else
                layer.Aq = ones([numInChannels 1]) * slopeAq;
            end

            layer.slopeAk = slopeAk;

            if slopeAk == 0
                layer.Ak = rand([numInChannels 1]);
            else
                layer.Ak = ones([numInChannels 1]) * slopeAk;
            end


            layer.slopeBq = slopeBq;

            if slopeBq == 0
                layer.Bq = rand([numInChannels 1]);
            else
                layer.Bq = ones([numInChannels 1]) * slopeBq;
            end

            layer.slopeBk = slopeBk;

            if slopeBk == 0
                layer.Bk = rand([numInChannels 1]);
            else
                layer.Bk = ones([numInChannels 1]) * slopeBk;
            end
        end

        function [Z] = predict(layer, X)
            % Forward input data through the layer at prediction time and
            % output the result and updated state.
            %
            % Inputs:
            %         layer - Layer to forward propagate through 
            %         X     - Input data
            % Outputs:
            %         Z     - Output of layer forward function
            %         state - (Optional) Updated layer state.
            %
            %  - For layers with multiple inputs, replace X with X1,...,XN, 
            %    where N is the number of inputs.
            %  - For layers with multiple outputs, replace Z with 
            %    Z1,...,ZM, where M is the number of outputs.
            %  - For layers with multiple state parameters, replace state 
            %    with state1,...,stateK, where K is the number of state 
            %    parameters.

            % Define layer predict function here.
            % c - channels, n - observations
            [c, n] = size(X);


            Kx = layer.Wk * X + layer.Wk0;
            layer.Ak(layer.Ak > layer.slopeAk) = layer.slopeAk;
            layer.Ak(layer.Ak < 0) = 0;
            layer.Bk(layer.Bk > layer.slopeBk) = layer.slopeBk;
            layer.Bk(layer.Bk < 0) = 0;
            PMk = Kx>=0;
            NMk = Kx<0;
            Kp = layer.Ak .* Kx .* PMk;
            Kn = layer.Ak .* Kx .* NMk;
            K = Kp + Kn;


            Qx = layer.Wq * X + layer.Wq0;
            layer.Aq(layer.Aq > layer.slopeAq) = layer.slopeAq;
            layer.Aq(layer.Aq < 0) = 0;
            layer.Bq(layer.Bq > layer.slopeBq) = layer.slopeBq;
            layer.Bq(layer.Bq < 0) = 0;
            PMq = Qx>=0;
            NMq = Qx<0;
            Qp = layer.Aq .* Qx .* PMq;
            Qn = layer.Aq .* Qx .* NMq;
            Q = Qp + Qn;


            DK2 = sum(K .* K, 1);
            DQ2 = sum(Q .* Q, 1);
            DQK2 = DQ2' * DK2;
            DQK = sqrt(DQK2);

            Y = (Q' * K) ./ DQK;

            SM = softmax(Y', 'DataFormat', 'CB');
            
            Z = X * SM;

            %fprintf('state c=%d n=%d\n', c, n);
        end

        %function [Z,state,memory] = forward(layer,X)
            % (Optional) Forward input data through the layer at training
            % time and output the result, updated state, and a memory
            % value.
            %
            % Inputs:
            %         layer - Layer to forward propagate through 
            %         X     - Layer input data
            % Outputs:
            %         Z      - Output of layer forward function 
            %         state  - (Optional) Updated layer state 
            %         memory - (Optional) Memory value for custom backward
            %                  function
            %
            %  - For layers with multiple inputs, replace X with X1,...,XN, 
            %    where N is the number of inputs.
            %  - For layers with multiple outputs, replace Z with 
            %    Z1,...,ZM, where M is the number of outputs.
            %  - For layers with multiple state parameters, replace state 
            %    with state1,...,stateK, where K is the number of state 
            %    parameters.

            % Define layer forward function here.
        %end

        %function layer = resetState(layer)
            % (Optional) Reset layer state.

            % Define reset state function here.
        %    layer.M = zeros([2, 2]);
        %    layer.MFill = 0;
        %end

        %function [dLdX,dLdW,dLdSin] = backward(layer,X,Z,dLdZ,dLdSout,memory)
            % (Optional) Backward propagate the derivative of the loss
            % function through the layer.
            %
            % Inputs:
            %         layer   - Layer to backward propagate through 
            %         X       - Layer input data 
            %         Z       - Layer output data 
            %         dLdZ    - Derivative of loss with respect to layer 
            %                   output
            %         dLdSout - (Optional) Derivative of loss with respect 
            %                   to state output
            %         memory  - Memory value from forward function
            % Outputs:
            %         dLdX   - Derivative of loss with respect to layer input
            %         dLdW   - (Optional) Derivative of loss with respect to
            %                  learnable parameter 
            %         dLdSin - (Optional) Derivative of loss with respect to 
            %                  state input
            %
            %  - For layers with state parameters, the backward syntax must
            %    include both dLdSout and dLdSin, or neither.
            %  - For layers with multiple inputs, replace X and dLdX with
            %    X1,...,XN and dLdX1,...,dLdXN, respectively, where N is
            %    the number of inputs.
            %  - For layers with multiple outputs, replace Z and dlZ with
            %    Z1,...,ZM and dLdZ,...,dLdZM, respectively, where M is the
            %    number of outputs.
            %  - For layers with multiple learnable parameters, replace 
            %    dLdW with dLdW1,...,dLdWP, where P is the number of 
            %    learnable parameters.
            %  - For layers with multiple state parameters, replace dLdSin
            %    and dLdSout with dLdSin1,...,dLdSinK and 
            %    dLdSout1,...dldSoutK, respectively, where K is the number
            %    of state parameters.

            % Define layer backward function here.
        %end
    end
end