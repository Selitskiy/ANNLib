classdef residualConv2x1GaussLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input channels
        numInChannels
        numOutChannels
        numResChannels

        fSizeX
        fSizeY
        fStrideX
        fStrideY
        nFilters

        fLen

        %Mask
        M
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.
        
        % Filters' Weights
        W

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
        function layer = residualConv2x1GaussLayer(numImgV, numImgH, fSizeX, fSizeY, fStrideX, fStrideY, nFilters, numResChannels, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Convolution 2x1 " + numImgV*numImgH + " channels";

            layer.numInChannels = numImgV * numImgH;
            layer.numOutChannels = ceil((numImgH - fSizeX + 1)/fStrideX) * ceil((numImgV - fSizeY + 1)/fStrideY);
            layer.numResChannels = numResChannels;

            layer.fLen = fSizeX * fSizeY;
            layer.nFilters = nFilters;
            layer.fSizeX = fSizeX;
            layer.fSizeY = fSizeY;
            layer.fStrideX = fStrideX;
            layer.fStrideY = fStrideY;

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.fLen + layer.nFilters));
            
            layer.W = bound * (2. * rand([layer.nFilters, layer.fLen],'single') - 1.);

            layer.M = zeros([layer.fLen, layer.numInChannels*layer.numOutChannels]);


            %Gauss filter
            uX = fSizeX/2;
            uY = fSizeY/2;
            sR2 = 0;
            nR = 0;
            for m=1:fSizeY
                for n=1:fSizeX
                    sR2 = sR2 + (n-0.5 - uX)*(n-0.5 - uX) + (m-0.5 - uY)*(m-0.5 - uY);
                    nR = nR +1;
                end
            end
            varR = sR2/nR;
            sigR = sqrt(varR);


            %Fill the Mask
            cntI = 0;
            for yF=1:fStrideY:(numImgV-fSizeY+1)
                for xF=1:fStrideX:(numImgH-fSizeX+1)

                    pF = (yF-1)*numImgH + xF;

                    pI = cntI * layer.numInChannels;
                    cntI = cntI + 1;

                    for m=1:fSizeY
                        for n=1:fSizeX

                            i = (m-1)*fSizeX + n;

                            p = pI + pF + (n-1) + (m-1)*numImgH;

                            layer.M(i, p) = 1/(sqrt(2*pi)*sigR)*exp(-((n-0.5 - uX)*(n-0.5 - uX) + (m-0.5 - uY)*(m-0.5 - uY))/(2*varR));

                        end
                    end
                end
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

            F = reshape(layer.W * layer.M, [layer.nFilters, layer.numInChannels, layer.numOutChannels]);

            F1 = reshape(sum(F,1), [layer.numInChannels, layer.numOutChannels]);

            Y = (X(1:layer.numInChannels,:)' * F1)';

            Z = vertcat(Y, X(layer.numInChannels+1:layer.numInChannels+layer.numResChannels,:));


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