classdef residualVis2x2CosPcTransformerMixLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input channels
        numInChannels
        numResChannels

        numPatch
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.
        
        % Weights
        Wq1
        Wk1

        Wq2
        Wk2

        Wq3
        Wk3

        Wq4
        Wk4


        %Bias
        Wq01
        Wk01

        Wq02
        Wk02

        Wq03
        Wk03

        Wq04
        Wk04


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
        function layer = residualVis2x2CosPcTransformerMixLayer(numInChannels, numPatchV, numPatchH, numResChannels, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Residual Mix Visual 3x3x1 Cosine Primary Components Transformer" + numPatchV*numPatchH + " channels";

            layer.numPatch = numPatchV * numPatchH;
            layer.numInChannels = numInChannels; 
            layer.numResChannels = numResChannels;

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numPatch + layer.numPatch + layer.numResChannels*2));
            %boundRes = sqrt(6 / (layer.numResChannels + layer.numResChannels));
            
            layer.Wq1 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq01 = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk1 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk01 = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq2 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq02 = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk2 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk02 = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq3 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq03 = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk3 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk03 = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq4 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq04 = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk4 = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk04 = zeros([layer.numPatch+layer.numResChannels, 1]);


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

            X1 = vertcat( X(1:layer.numPatch,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K1 = layer.Wk1 * X1 + layer.Wk01;
            Q1 = layer.Wq1 * X1 + layer.Wq01;
            DK21 = sum(K1' .* K1', 1);
            DQ21 = sum(Q1' .* Q1', 1);
            DQK1 = sqrt(DQ21' * DK21);
            Y1 = (Q1 * K1') ./ DQK1;
            Z1 = (X1' * softmax(Y1, 'DataFormat', 'CB'))';

            X2 = vertcat( X(1+layer.numPatch:layer.numPatch*2,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K2 = layer.Wk2 * X2 + layer.Wk02;
            Q2 = layer.Wq2 * X2 + layer.Wq02;
            DK22 = sum(K2' .* K2', 1);
            DQ22 = sum(Q2' .* Q2', 1);
            DQK2 = sqrt(DQ22' * DK22);
            Y2 = (Q2 * K2') ./ DQK2;
            Z2 = (X2' * softmax(Y2, 'DataFormat', 'CB'))';

            X3 = vertcat( X(1+layer.numPatch*2:layer.numPatch*3,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K3 = layer.Wk3 * X3 + layer.Wk03;
            Q3 = layer.Wq3 * X3 + layer.Wq03;
            DK23 = sum(K3' .* K3', 1);
            DQ23 = sum(Q3' .* Q3', 1);
            DQK3 = sqrt(DQ23' * DK23);
            Y3 = (Q3 * K3') ./ DQK3;
            Z3 = (X3' * softmax(Y3, 'DataFormat', 'CB'))';

            X4 = vertcat( X(1+layer.numPatch*3:layer.numPatch*4,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K4 = layer.Wk4 * X4 + layer.Wk04;
            Q4 = layer.Wq4 * X4 + layer.Wq04;
            DK24 = sum(K4' .* K4', 1);
            DQ24 = sum(Q4' .* Q4', 1);
            DQK4 = sqrt(DQ24' * DK24);
            Y4 = (Q4 * K4') ./ DQK4;
            Z4 = (X4' * softmax(Y4, 'DataFormat', 'CB'))';


            Z = Z1;
            Z = vertcat(Z, Z2);
            Z = vertcat(Z, Z3);
            Z = vertcat(Z, Z4);


            Z = vertcat(Z, X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:));

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