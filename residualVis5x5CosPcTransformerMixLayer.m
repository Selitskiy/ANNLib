classdef residualVis5x5CosPcTransformerMixLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

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
        Wq1r
        Wk1r

        Wq2r
        Wk2r

        Wq3r
        Wk3r

        Wq4r
        Wk4r

        Wq5r
        Wk5r

        Wq6r
        Wk6r

        Wq7r
        Wk7r

        Wq8r
        Wk8r

        Wq9r
        Wk9r
        
        Wq10r
        Wk10r

        Wq11r
        Wk11r

        Wq12r
        Wk12r

        Wq13r
        Wk13r

        Wq14r
        Wk14r

        Wq15r
        Wk15r

        Wq16r
        Wk16r

        Wq17r
        Wk17r

        Wq18r
        Wk18r

        Wq19r
        Wk19r

        Wq20r
        Wk20r

        Wq21r
        Wk21r

        Wq22r
        Wk22r

        Wq23r
        Wk23r

        Wq24r
        Wk24r

        Wq25r
        Wk25r


        



        %Bias
        Wq01r
        Wk01r

        Wq02r
        Wk02r

        Wq03r
        Wk03r

        Wq04r
        Wk04r

        Wq05r
        Wk05r

        Wq06r
        Wk06r

        Wq07r
        Wk07r

        Wq08r
        Wk08r

        Wq09r
        Wk09r

        Wq010r
        Wk010r

        Wq011r
        Wk011r

        Wq012r
        Wk012r

        Wq013r
        Wk013r

        Wq014r
        Wk014r

        Wq015r
        Wk015r

        Wq016r
        Wk016r

        Wq017r
        Wk017r

        Wq018r
        Wk018r

        Wq019r
        Wk019r

        Wq020r
        Wk020r

        Wq021r
        Wk021r

        Wq022r
        Wk022r

        Wq023r
        Wk023r

        Wq024r
        Wk024r

        Wq025r
        Wk025r



        


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
        function layer = residualVis5x5CosPcTransformerMixLayer(numInChannels, numPatchV, numPatchH, numResChannels, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Residual Mix Visual 5x5x1 Primary Components Transformer" + numPatchV*numPatchH + " channels";

            layer.numPatch = numPatchV * numPatchH;
            layer.numInChannels = numInChannels; 
            layer.numResChannels = numResChannels;

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numPatch + layer.numPatch + layer.numResChannels*2));
            %boundRes = sqrt(6 / (layer.numResChannels + layer.numResChannels));
            
            layer.Wq1r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq01r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk1r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk01r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq2r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq02r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk2r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk02r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq3r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq03r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk3r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk03r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq4r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq04r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk4r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk04r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq5r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq05r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk5r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk05r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq6r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq06r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk6r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk06r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq7r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq07r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk7r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk07r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq8r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq08r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk8r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk08r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq9r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq09r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk9r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk09r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq10r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq010r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk10r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk010r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq11r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq011r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk11r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk011r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq12r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq012r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk12r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk012r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq13r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq013r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk13r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk013r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq14r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq014r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk14r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk014r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq15r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq015r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk15r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk015r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq16r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq016r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk16r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk016r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq17r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq017r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk17r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk017r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq18r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq018r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk18r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk018r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq19r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq019r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk19r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk019r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq20r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq020r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk20r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk020r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq21r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq021r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk21r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk021r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq22r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq022r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk22r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk022r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq23r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq023r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk23r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk023r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq24r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq024r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk24r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk024r = zeros([layer.numPatch+layer.numResChannels, 1]);

            layer.Wq25r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wq025r = zeros([layer.numPatch+layer.numResChannels, 1]);
            layer.Wk25r = bound * (2. * rand([layer.numPatch+layer.numResChannels, layer.numPatch+layer.numResChannels],'single') - 1.);
            layer.Wk025r = zeros([layer.numPatch+layer.numResChannels, 1]);



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

            %red
            cOff = ceil(layer.numPatch*5*5)*0;

            X1r = vertcat ( X(1+cOff:cOff+layer.numPatch,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K1r = layer.Wk1r * X1r + layer.Wk01r;
            Q1r = layer.Wq1r * X1r + layer.Wq01r;
            DK21r = sum(K1r' .* K1r', 1);
            DQ21r = sum(Q1r' .* Q1r', 1);
            DQK1r = sqrt(DQ21r' * DK21r);
            Y1r = (Q1r * K1r') ./ DQK1r;
            Z1r = (X1r' * softmax(Y1r, 'DataFormat', 'CB'))';

            X2r = vertcat ( X(1+cOff+layer.numPatch:cOff+layer.numPatch*2,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K2r = layer.Wk2r * X2r + layer.Wk02r;
            Q2r = layer.Wq2r * X2r + layer.Wq02r;
            DK22r = sum(K2r' .* K2r', 1);
            DQ22r = sum(Q2r' .* Q2r', 1);
            DQK2r = sqrt(DQ22r' * DK22r);
            Y2r = (Q2r * K2r') ./ DQK2r;
            Z2r = (X2r' * softmax(Y2r, 'DataFormat', 'CB'))';

            X3r = vertcat ( X(1+cOff+layer.numPatch*2:cOff+layer.numPatch*3,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K3r = layer.Wk3r * X3r + layer.Wk03r;
            Q3r = layer.Wq3r * X3r + layer.Wq03r;
            DK23r = sum(K3r' .* K3r', 1);
            DQ23r = sum(Q3r' .* Q3r', 1);
            DQK3r = sqrt(DQ23r' * DK23r);
            Y3r = (Q3r * K3r') ./ DQK3r;
            Z3r = (X3r' * softmax(Y3r, 'DataFormat', 'CB'))';

            X4r = vertcat ( X(1+cOff+layer.numPatch*3:cOff+layer.numPatch*4,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K4r = layer.Wk4r * X4r + layer.Wk04r;
            Q4r = layer.Wq4r * X4r + layer.Wq04r;
            DK24r = sum(K4r' .* K4r', 1);
            DQ24r = sum(Q4r' .* Q4r', 1);
            DQK4r = sqrt(DQ24r' * DK24r);
            Y4r = (Q4r * K4r') ./ DQK4r;
            Z4r = (X4r' * softmax(Y4r, 'DataFormat', 'CB'))';

            X5r = vertcat ( X(1+cOff+layer.numPatch*4:cOff+layer.numPatch*5,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K5r = layer.Wk5r * X5r + layer.Wk05r;
            Q5r = layer.Wq5r * X5r + layer.Wq05r;
            DK25r = sum(K5r' .* K5r', 1);
            DQ25r = sum(Q5r' .* Q5r', 1);
            DQK5r = sqrt(DQ25r' * DK25r);
            Y5r = (Q5r * K5r') ./ DQK5r;
            Z5r = (X5r' * softmax(Y5r, 'DataFormat', 'CB'))';

            X6r = vertcat ( X(1+cOff+layer.numPatch*5:cOff+layer.numPatch*6,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K6r = layer.Wk6r * X6r + layer.Wk06r;
            Q6r = layer.Wq6r * X6r + layer.Wq06r;
            DK26r = sum(K6r' .* K6r', 1);
            DQ26r = sum(Q6r' .* Q6r', 1);
            DQK6r = sqrt(DQ26r' * DK26r);
            Y6r = (Q6r * K6r') ./ DQK6r;
            Z6r = (X6r' * softmax(Y6r, 'DataFormat', 'CB'))';

            X7r = vertcat ( X(1+cOff+layer.numPatch*6:cOff+layer.numPatch*7,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K7r = layer.Wk7r * X7r + layer.Wk07r;
            Q7r = layer.Wq7r * X7r + layer.Wq07r;
            DK27r = sum(K7r' .* K7r', 1);
            DQ27r = sum(Q7r' .* Q7r', 1);
            DQK7r = sqrt(DQ27r' * DK27r);
            Y7r = (Q7r * K7r') ./ DQK7r;
            Z7r = (X7r' * softmax(Y7r, 'DataFormat', 'CB'))';

            X8r = vertcat ( X(1+cOff+layer.numPatch*7:cOff+layer.numPatch*8,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K8r = layer.Wk8r * X8r + layer.Wk08r;
            Q8r = layer.Wq8r * X8r + layer.Wq08r;
            DK28r = sum(K8r' .* K8r', 1);
            DQ28r = sum(Q8r' .* Q8r', 1);
            DQK8r = sqrt(DQ28r' * DK28r);
            Y8r = (Q8r * K8r') ./ DQK8r;
            Z8r = (X8r' * softmax(Y8r, 'DataFormat', 'CB'))';

            X9r = vertcat ( X(1+cOff+layer.numPatch*8:cOff+layer.numPatch*9,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K9r = layer.Wk9r * X9r + layer.Wk09r;
            Q9r = layer.Wq9r * X9r + layer.Wq09r;
            DK29r = sum(K9r' .* K9r', 1);
            DQ29r = sum(Q9r' .* Q9r', 1);
            DQK9r = sqrt(DQ29r' * DK29r);
            Y9r = (Q9r * K9r') ./ DQK9r;
            Z9r = (X9r' * softmax(Y9r, 'DataFormat', 'CB'))';

            X10r = vertcat ( X(1+cOff+layer.numPatch*9:cOff+layer.numPatch*10,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K10r = layer.Wk10r * X10r + layer.Wk010r;
            Q10r = layer.Wq10r * X10r + layer.Wq010r;
            DK210r = sum(K10r' .* K10r', 1);
            DQ210r = sum(Q10r' .* Q10r', 1);
            DQK10r = sqrt(DQ210r' * DK210r);
            Y10r = (Q10r * K10r') ./ DQK10r;
            Z10r = (X10r' * softmax(Y10r, 'DataFormat', 'CB'))';

            X11r = vertcat ( X(1+cOff+layer.numPatch*10:cOff+layer.numPatch*11,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K11r = layer.Wk11r * X11r + layer.Wk011r;
            Q11r = layer.Wq11r * X11r + layer.Wq011r;
            DK211r = sum(K11r' .* K11r', 1);
            DQ211r = sum(Q11r' .* Q11r', 1);
            DQK11r = sqrt(DQ211r' * DK211r);
            Y11r = (Q11r * K11r') ./ DQK11r;
            Z11r = (X11r' * softmax(Y11r, 'DataFormat', 'CB'))';     

            X12r = vertcat ( X(1+cOff+layer.numPatch*11:cOff+layer.numPatch*12,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K12r = layer.Wk12r * X12r + layer.Wk012r;
            Q12r = layer.Wq12r * X12r + layer.Wq012r;
            DK212r = sum(K12r' .* K12r', 1);
            DQ212r = sum(Q12r' .* Q12r', 1);
            DQK12r = sqrt(DQ212r' * DK212r);
            Y12r = (Q12r * K12r') ./ DQK12r;
            Z12r = (X12r' * softmax(Y12r, 'DataFormat', 'CB'))';  

            X13r = vertcat ( X(1+cOff+layer.numPatch*12:cOff+layer.numPatch*13,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K13r = layer.Wk13r * X13r + layer.Wk013r;
            Q13r = layer.Wq13r * X13r + layer.Wq013r;
            DK213r = sum(K13r' .* K13r', 1);
            DQ213r = sum(Q13r' .* Q13r', 1);
            DQK13r = sqrt(DQ213r' * DK213r);
            Y13r = (Q13r * K13r') ./ DQK13r;
            Z13r = (X13r' * softmax(Y13r, 'DataFormat', 'CB'))';  

            X14r = vertcat ( X(1+cOff+layer.numPatch*13:cOff+layer.numPatch*14,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K14r = layer.Wk14r * X14r + layer.Wk014r;
            Q14r = layer.Wq14r * X14r + layer.Wq014r;
            DK214r = sum(K14r' .* K14r', 1);
            DQ214r = sum(Q14r' .* Q14r', 1);
            DQK14r = sqrt(DQ214r' * DK214r);
            Y14r = (Q14r * K14r') ./ DQK14r;
            Z14r = (X14r' * softmax(Y14r, 'DataFormat', 'CB'))';

            X15r = vertcat ( X(1+cOff+layer.numPatch*14:cOff+layer.numPatch*15,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K15r = layer.Wk15r * X15r + layer.Wk015r;
            Q15r = layer.Wq15r * X15r + layer.Wq015r;
            DK215r = sum(K15r' .* K15r', 1);
            DQ215r = sum(Q15r' .* Q15r', 1);
            DQK15r = sqrt(DQ215r' * DK215r);
            Y15r = (Q15r * K15r') ./ DQK15r;
            Z15r = (X15r' * softmax(Y15r, 'DataFormat', 'CB'))';

            X16r = vertcat ( X(1+cOff+layer.numPatch*15:cOff+layer.numPatch*16,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K16r = layer.Wk16r * X16r + layer.Wk016r;
            Q16r = layer.Wq16r * X16r + layer.Wq016r;
            DK216r = sum(K16r' .* K16r', 1);
            DQ216r = sum(Q16r' .* Q16r', 1);
            DQK16r = sqrt(DQ216r' * DK216r);
            Y16r = (Q16r * K16r') ./ DQK16r;
            Z16r = (X16r' * softmax(Y16r, 'DataFormat', 'CB'))';

            X17r = vertcat ( X(1+cOff+layer.numPatch*16:cOff+layer.numPatch*17,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K17r = layer.Wk17r * X17r + layer.Wk017r;
            Q17r = layer.Wq17r * X17r + layer.Wq017r;
            DK217r = sum(K17r' .* K17r', 1);
            DQ217r = sum(Q17r' .* Q17r', 1);
            DQK17r = sqrt(DQ217r' * DK217r);
            Y17r = (Q17r * K17r') ./ DQK17r;
            Z17r = (X17r' * softmax(Y17r, 'DataFormat', 'CB'))';

            X18r = vertcat ( X(1+cOff+layer.numPatch*17:cOff+layer.numPatch*18,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K18r = layer.Wk18r * X18r + layer.Wk018r;
            Q18r = layer.Wq18r * X18r + layer.Wq018r;
            DK218r = sum(K18r' .* K18r', 1);
            DQ218r = sum(Q18r' .* Q18r', 1);
            DQK18r = sqrt(DQ218r' * DK218r);
            Y18r = (Q18r * K18r') ./ DQK18r;
            Z18r = (X18r' * softmax(Y18r, 'DataFormat', 'CB'))';

            X19r = vertcat ( X(1+cOff+layer.numPatch*18:cOff+layer.numPatch*19,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K19r = layer.Wk19r * X19r + layer.Wk019r;
            Q19r = layer.Wq19r * X19r + layer.Wq019r;
            DK219r = sum(K19r' .* K19r', 1);
            DQ219r = sum(Q19r' .* Q19r', 1);
            DQK19r = sqrt(DQ219r' * DK219r);
            Y19r = (Q19r * K19r') ./ DQK19r;
            Z19r = (X19r' * softmax(Y19r, 'DataFormat', 'CB'))';

            X20r = vertcat ( X(1+cOff+layer.numPatch*19:cOff+layer.numPatch*20,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K20r = layer.Wk20r * X20r + layer.Wk020r;
            Q20r = layer.Wq20r * X20r + layer.Wq020r;
            DK220r = sum(K20r' .* K20r', 1);
            DQ220r = sum(Q20r' .* Q20r', 1);
            DQK20r = sqrt(DQ220r' * DK220r);
            Y20r = (Q20r * K20r') ./ DQK20r;
            Z20r = (X20r' * softmax(Y20r, 'DataFormat', 'CB'))';

            X21r = vertcat ( X(1+cOff+layer.numPatch*20:cOff+layer.numPatch*21,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K21r = layer.Wk21r * X21r + layer.Wk021r;
            Q21r = layer.Wq21r * X21r + layer.Wq021r;
            DK221r = sum(K21r' .* K21r', 1);
            DQ221r = sum(Q21r' .* Q21r', 1);
            DQK21r = sqrt(DQ221r' * DK221r);
            Y21r = (Q21r * K21r') ./ DQK21r;
            Z21r = (X21r' * softmax(Y21r, 'DataFormat', 'CB'))';

            X22r = vertcat ( X(1+cOff+layer.numPatch*21:cOff+layer.numPatch*22,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K22r = layer.Wk22r * X22r + layer.Wk022r;
            Q22r = layer.Wq22r * X22r + layer.Wq022r;
            DK222r = sum(K22r' .* K22r', 1);
            DQ222r = sum(Q22r' .* Q22r', 1);
            DQK22r = sqrt(DQ222r' * DK222r);
            Y22r = (Q22r * K22r') ./ DQK22r;
            Z22r = (X22r' * softmax(Y22r, 'DataFormat', 'CB'))';

            X23r = vertcat ( X(1+cOff+layer.numPatch*22:cOff+layer.numPatch*23,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K23r = layer.Wk23r * X23r + layer.Wk023r;
            Q23r = layer.Wq23r * X23r + layer.Wq023r;
            DK223r = sum(K23r' .* K23r', 1);
            DQ223r = sum(Q23r' .* Q23r', 1);
            DQK23r = sqrt(DQ223r' * DK223r);
            Y23r = (Q23r * K23r') ./ DQK23r;
            Z23r = (X23r' * softmax(Y23r, 'DataFormat', 'CB'))';

            X24r = vertcat ( X(1+cOff+layer.numPatch*23:cOff+layer.numPatch*24,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K24r = layer.Wk24r * X24r + layer.Wk024r;
            Q24r = layer.Wq24r * X24r + layer.Wq024r;
            DK224r = sum(K24r' .* K24r', 1);
            DQ224r = sum(Q24r' .* Q24r', 1);
            DQK24r = sqrt(DQ224r' * DK224r);
            Y24r = (Q24r * K24r') ./ DQK24r;
            Z24r = (X24r' * softmax(Y24r, 'DataFormat', 'CB'))';

            X25r = vertcat ( X(1+cOff+layer.numPatch*24:cOff+layer.numPatch*25,:), X(layer.numInChannels-layer.numResChannels+1:layer.numInChannels,:) );
            K25r = layer.Wk25r * X25r + layer.Wk025r;
            Q25r = layer.Wq25r * X25r + layer.Wq025r;
            DK225r = sum(K25r' .* K25r', 1);
            DQ225r = sum(Q25r' .* Q25r', 1);
            DQK25r = sqrt(DQ225r' * DK225r);
            Y25r = (Q25r * K25r') ./ DQK25r;
            Z25r = (X25r' * softmax(Y25r, 'DataFormat', 'CB'))';
                  


            Z = Z1r;
            Z = vertcat(Z, Z2r);
            Z = vertcat(Z, Z3r);
            Z = vertcat(Z, Z4r);
            Z = vertcat(Z, Z5r);
            Z = vertcat(Z, Z6r);
            Z = vertcat(Z, Z7r);
            Z = vertcat(Z, Z8r);
            Z = vertcat(Z, Z9r);
            Z = vertcat(Z, Z10r);
            Z = vertcat(Z, Z11r);
            Z = vertcat(Z, Z12r);
            Z = vertcat(Z, Z13r);
            Z = vertcat(Z, Z14r);
            Z = vertcat(Z, Z15r);
            Z = vertcat(Z, Z16r);
            Z = vertcat(Z, Z17r);
            Z = vertcat(Z, Z18r);
            Z = vertcat(Z, Z19r);
            Z = vertcat(Z, Z20r);
            Z = vertcat(Z, Z21r);
            Z = vertcat(Z, Z22r);
            Z = vertcat(Z, Z23r);
            Z = vertcat(Z, Z24r);
            Z = vertcat(Z, Z25r);


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