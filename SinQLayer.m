classdef SinQLayer < nnet.layer.Layer %& nnet.layer.Formattable & nnet.layer.Acceleratable %(Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input (p) channels
        numInChannels
        % Number output (q) channels
        %numOutChannels
        % Output dimesiality (product of KANs)
        %numOutProduct

        % Maximal (initial) ReLU slope
        %Tmp
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.

        % Declare learnable parameters here.
        A
        W
        W0

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
        function layer = SinQLayer(name, numInChannels)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Sin small phi qp KAN layer";

            layer.numInChannels = numInChannels;
            %layer.numOutChannels = numOutChannels;
            %layer.numOutProduct = numOutProduct;


            bound = sqrt(6 / (1 + numInChannels));
            layer.W = bound * (2. * rand([numInChannels, 1],'single') - 1.);
            layer.W0 = 2 * pi * rand([numInChannels, 1],'single');

            layer.A = bound * (2. * rand([numInChannels, 1],'single') - 1.);
            % Initialize scaling coefficient.
            %if slope == 0
            %    layer.A = rand([numInChannels, numOutChannels*numOutProduct],'single');
            %else
            %    layer.A = ones([numInChannels, numOutChannels*numOutProduct],'single') * slope;

                %DEBUG
                %layer.A(numOutChannels+1:end, :) = 0.;
            %end

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

            [p, qn, b] = size(X);

            twoPi = 2.*pi;

            layer.W0(layer.W0 > twoPi) = twoPi;
            layer.W0(layer.W0 < 0) = 0;
            
            %layer.W(layer.W > pi) = pi;
            %layer.W(layer.W < 0) = 0;

            %layer.Tmp = (-1 .* layer.W0 + twoPi) ./ X;
            %Rep2 = (-1 .* layer.W0) ./ X;
            %layer.W(((layer.W .* X) + layer.W0) > twoPi) = layer.Tmp(((layer.W .* X) + layer.W0) > twoPi); %Rep1(((layer.W .* X) + layer.W0) > twoPi);
            %layer.W(((layer.W .* X) + layer.W0) < 0) = 0; %Rep2(((layer.W .* X) + layer.W0) < 0);

            Z = layer.A .* sin((layer.W .* X) + layer.W0);


            % Reshape
            %Z = reshape(Y, layer.numOutChannels, [], layer.numOutProduct);
            
            % Relabel
            %Z = dlarray(Z,'SBC');

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
