classdef LrReLUQLayer < nnet.layer.Layer %& nnet.layer.Acceleratable % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input (p) channels
        %numInChannels
        % Number output (q) channels
        numOutChannels
        % Output dimesiality (product of KANs)
        numOutProduct

        % Maximal (initial) ReLU slope
        slope
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.

        % Declare learnable parameters here.
        A

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
        function layer = LrReLUQLayer(name, numOutChannels, numOutProduct, slope)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "LReLU large Phi q KAN layer";

            %layer.numInChannels = numInChannels;
            layer.numOutChannels = numOutChannels;
            layer.numOutProduct = numOutProduct;

            layer.slope = slope;

            % Initialize scaling coefficient.
            if slope == 0
                layer.A = rand([1 numOutChannels numOutProduct]);
            else
                layer.A = ones([1 numOutChannels numOutProduct]) * slope;
            end

        end

        function Z = predict(layer, X)
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

            [c, n, p] = size(X);

            X1 = reshape(X, layer.numOutChannels, layer.numOutProduct, []);
            X2 = permute(X1, [1,3,2]);

            layer.A(layer.A > layer.slope) = layer.slope;
            layer.A(layer.A < 0) = 0;

            PM = X2>=0;

            Z1 = pagemtimes(layer.A, X2 .* PM);
            Z2 = reshape(Z1, [], layer.numOutProduct);
            Z = permute(Z2, [2,1]);

            %Z = layer.A .* X .* PM;

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