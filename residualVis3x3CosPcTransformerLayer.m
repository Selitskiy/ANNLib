classdef residualVis3x3CosPcTransformerLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input channels
        numInChannels
        %numOutChannels
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

        Wq5
        Wk5

        Wq6
        Wk6

        Wq7
        Wk7

        Wq8
        Wk8

        Wq9
        Wk9

        Wqr
        Wkr

        %Bias
        Wq01
        Wk01

        Wq02
        Wk02

        Wq03
        Wk03

        Wq04
        Wk04

        Wq05
        Wk05

        Wq06
        Wk06

        Wq07
        Wk07

        Wq08
        Wk08

        Wq09
        Wk09

        %Wq0r
        %Wk0r

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
        function layer = residualVis3x3CosPcTransformerLayer(numInChannels, numPatchV, numPatchH, numResChannels, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Visual 3x3 Transformer" + numPatchV*numPatchH + " channels";

            layer.numPatch = numPatchV * numPatchH;
            layer.numInChannels = numInChannels; %9 * layer.numPatch;
            %layer.numOutChannels = layer.numInChannels;
            layer.numResChannels = numResChannels;

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numPatch + layer.numPatch));
            boundRes = sqrt(6 / (layer.numResChannels + layer.numResChannels));
            
            layer.Wq1 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq01 = zeros([layer.numPatch, 1]);
            layer.Wk1 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk01 = zeros([layer.numPatch, 1]);

            layer.Wq2 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq02 = zeros([layer.numPatch, 1]);
            layer.Wk2 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk02 = zeros([layer.numPatch, 1]);

            layer.Wq3 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq03 = zeros([layer.numPatch, 1]);
            layer.Wk3 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk03 = zeros([layer.numPatch, 1]);

            layer.Wq4 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq04 = zeros([layer.numPatch, 1]);
            layer.Wk4 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk04 = zeros([layer.numPatch, 1]);

            layer.Wq5 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq05 = zeros([layer.numPatch, 1]);
            layer.Wk5 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk05 = zeros([layer.numPatch, 1]);

            layer.Wq6 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq06 = zeros([layer.numPatch, 1]);
            layer.Wk6 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk06 = zeros([layer.numPatch, 1]);

            layer.Wq7 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq07 = zeros([layer.numPatch, 1]);
            layer.Wk7 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk07 = zeros([layer.numPatch, 1]);

            layer.Wq8 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq08 = zeros([layer.numPatch, 1]);
            layer.Wk8 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk08 = zeros([layer.numPatch, 1]);

            layer.Wq9 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq09 = zeros([layer.numPatch, 1]);
            layer.Wk9 = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk09 = zeros([layer.numPatch, 1]);


            %layer.Wqr = boundRes * (2. * rand([layer.numResChannels, layer.numResChannels],'single') - 1.);
            %layer.Wq0r = zeros([layer.numResChannels, 1]);
            %layer.Wkr = boundRes * (2. * rand([layer.numResChannels, layer.numResChannels],'single') - 1.);
            %layer.Wk0r = zeros([layer.numResChannels, 1]);


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

            X1 = X(1:layer.numPatch,:);
            K1 = layer.Wk1 * X1 + layer.Wk01;
            Q1 = layer.Wq1 * X1 + layer.Wq01;
            DK21 = sum(K1' .* K1', 1);
            DQ21 = sum(Q1' .* Q1', 1);
            DQK1 = sqrt(DQ21' * DK21);
            Y1 = (Q1 * K1') ./ DQK1;
            Z1 = (X1' * softmax(Y1, 'DataFormat', 'CB'))';

            X2 = X(1+layer.numPatch:layer.numPatch*2,:);
            K2 = layer.Wk2 * X2 + layer.Wk02;
            Q2 = layer.Wq2 * X2 + layer.Wq02;
            DK22 = sum(K2' .* K2', 1);
            DQ22 = sum(Q2' .* Q2', 1);
            DQK2 = sqrt(DQ22' * DK22);
            Y2 = (Q2 * K2') ./ DQK2;
            Z2 = (X2' * softmax(Y2, 'DataFormat', 'CB'))';

            X3 = X(1+layer.numPatch*2:layer.numPatch*3,:);
            K3 = layer.Wk3 * X3 + layer.Wk03;
            Q3 = layer.Wq3 * X3 + layer.Wq03;
            DK23 = sum(K3' .* K3', 1);
            DQ23 = sum(Q3' .* Q3', 1);
            DQK3 = sqrt(DQ23' * DK23);
            Y3 = (Q3 * K3') ./ DQK3;
            Z3 = (X3' * softmax(Y3, 'DataFormat', 'CB'))';

            X4 = X(1+layer.numPatch*3:layer.numPatch*4,:);
            K4 = layer.Wk4 * X4 + layer.Wk04;
            Q4 = layer.Wq4 * X4 + layer.Wq04;
            DK24 = sum(K4' .* K4', 1);
            DQ24 = sum(Q4' .* Q4', 1);
            DQK4 = sqrt(DQ24' * DK24);
            Y4 = (Q4 * K4') ./ DQK4;
            Z4 = (X4' * softmax(Y4, 'DataFormat', 'CB'))';

            X5 = X(1+layer.numPatch*4:layer.numPatch*5,:);
            K5 = layer.Wk5 * X5 + layer.Wk05;
            Q5 = layer.Wq5 * X5 + layer.Wq05;
            DK25 = sum(K5' .* K5', 1);
            DQ25 = sum(Q5' .* Q5', 1);
            DQK5 = sqrt(DQ25' * DK25);
            Y5 = (Q5 * K5') ./ DQK5;
            Z5 = (X5' * softmax(Y5, 'DataFormat', 'CB'))';

            X6 = X(1+layer.numPatch*5:layer.numPatch*6,:);
            K6 = layer.Wk6 * X6 + layer.Wk06;
            Q6 = layer.Wq6 * X6 + layer.Wq06;
            DK26 = sum(K6' .* K6', 1);
            DQ26 = sum(Q6' .* Q6', 1);
            DQK6 = sqrt(DQ26' * DK26);
            Y6 = (Q6 * K6') ./ DQK6;
            Z6 = (X6' * softmax(Y6, 'DataFormat', 'CB'))';

            X7 = X(1+layer.numPatch*6:layer.numPatch*7,:);
            K7 = layer.Wk7 * X7 + layer.Wk07;
            Q7 = layer.Wq7 * X7 + layer.Wq07;
            DK27 = sum(K7' .* K7', 1);
            DQ27 = sum(Q7' .* Q7', 1);
            DQK7 = sqrt(DQ27' * DK27);
            Y7 = (Q7 * K7') ./ DQK7;
            Z7 = (X7' * softmax(Y7, 'DataFormat', 'CB'))';

            X8 = X(1+layer.numPatch*7:layer.numPatch*8,:);
            K8 = layer.Wk8 * X8 + layer.Wk08;
            Q8 = layer.Wq8 * X8 + layer.Wq08;
            DK28 = sum(K8' .* K8', 1);
            DQ28 = sum(Q8' .* Q8', 1);
            DQK8 = sqrt(DQ28' * DK28);
            Y8 = (Q8 * K8') ./ DQK8;
            Z8 = (X8' * softmax(Y8, 'DataFormat', 'CB'))';

            X9 = X(1+layer.numPatch*8:layer.numPatch*9,:);
            K9 = layer.Wk9 * X9 + layer.Wk09;
            Q9 = layer.Wq9 * X9 + layer.Wq09;
            DK29 = sum(K9' .* K9', 1);
            DQ29 = sum(Q9' .* Q9', 1);
            DQK9 = sqrt(DQ29' * DK29);
            Y9 = (Q9 * K9') ./ DQK9;
            Z9 = (X9' * softmax(Y9, 'DataFormat', 'CB'))';


            %Xr = X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:);
            %Kr = layer.Wkr * Xr + layer.Wk0r;
            %Qr = layer.Wqr * Xr + layer.Wq0r;
            %DK2r = sum(Kr' .* Kr', 1);
            %DQ2r = sum(Qr' .* Qr', 1);
            %DQKr = sqrt(DQ2r' * DK2r);
            %Yr = (Qr * Kr') ./ DQKr;
            %Zr = (Xr' * softmax(Yr, 'DataFormat', 'CB'))';


            Z = Z1;
            Z = vertcat(Z, Z2);
            Z = vertcat(Z, Z3);
            Z = vertcat(Z, Z4);
            Z = vertcat(Z, Z5);
            Z = vertcat(Z, Z6);
            Z = vertcat(Z, Z7);
            Z = vertcat(Z, Z8);
            Z = vertcat(Z, Z9);
            %Z = vertcat(Z, Zr);

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