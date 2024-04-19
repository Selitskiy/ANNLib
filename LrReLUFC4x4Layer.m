classdef LrReLUFC4x4Layer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

    properties
        % (Optional) Layer properties.

        % Declare layer properties here.

        % Number input channels
        numInChannels
        numOutChannels

        numPatch
        %numInPatch
        numOutPatch

    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.

        % Declare learnable parameters here.
        A1
        A2
        A3
        A4
        A5
        A6
        A7
        A8
        A9
        A10
        A11
        A12
        A13
        A14
        A15
        A16

        slope
        
        % Weights
        W1
        W2
        W3
        W4
        W5
        W6
        W7
        W8
        W9
        W10
        W11
        W12
        W13
        W14
        W15
        W16

        %Bias
        W01
        W02
        W03
        W04
        W05
        W06
        W07
        W08
        W09
        W010
        W011
        W012
        W013
        W014
        W015
        W016

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
        function layer = LrReLUFC4x4Layer(numInChannels, numOutChannels, slope, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "LrReLUFC4x4 fullyConnected " + numInChannels + " channels";

            layer.numPatch = 16;
            layer.numInChannels = numInChannels;
            layer.numOutChannels = numOutChannels;

            %layer.numInPatch = floor(layer.numInChannels / layer.numPatch);
            layer.numOutPatch = floor(layer.numOutChannels / layer.numPatch);

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numOutPatch + layer.numInChannels));
            
            layer.W1 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W01 = zeros([layer.numOutPatch, 1]);

            layer.W2 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W02 = zeros([layer.numOutPatch, 1]);

            layer.W3 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W03 = zeros([layer.numOutPatch, 1]);

            layer.W4 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W04 = zeros([layer.numOutPatch, 1]);

            layer.W5 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W05 = zeros([layer.numOutPatch, 1]);

            layer.W6 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W06 = zeros([layer.numOutPatch, 1]);

            layer.W7 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W07 = zeros([layer.numOutPatch, 1]);

            layer.W8 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W08 = zeros([layer.numOutPatch, 1]);

            layer.W9 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W09 = zeros([layer.numOutPatch, 1]);

            layer.W10 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W010 = zeros([layer.numOutPatch, 1]);

            layer.W11 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W011 = zeros([layer.numOutPatch, 1]);

            layer.W12 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W012 = zeros([layer.numOutPatch, 1]);

            layer.W13 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W013 = zeros([layer.numOutPatch, 1]);

            layer.W14 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W014 = zeros([layer.numOutPatch, 1]);

            layer.W15 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W015 = zeros([layer.numOutPatch, 1]);

            layer.W16 = bound * (2. * rand([layer.numOutPatch, layer.numInChannels],'single') - 1.);
            layer.W016 = zeros([layer.numOutPatch, 1]);


            layer.slope = slope;


            % Initialize scaling coefficient.
            if slope == 0
                layer.A1 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A2 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A3 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A4 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A5 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A6 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A7 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A8 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A9 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A10 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A11 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A12 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A13 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A14 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A15 = rand([layer.numOutPatch, layer.numInChannels]);
                layer.A16 = rand([layer.numOutPatch, layer.numInChannels]);
            else
                layer.A1 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A2 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A3 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A4 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A5 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A6 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A7 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A8 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A9 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A10 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A11 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A12 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A13 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A14 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A15 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
                layer.A16 = ones([layer.numOutPatch, layer.numInChannels]) * slope;
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


            layer.A1(layer.A1 > layer.slope) = layer.slope;
            layer.A1(layer.A1 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W1 .* layer.A1) * Xp + layer.W01;
            Z = Zd;


            layer.A2(layer.A2 > layer.slope) = layer.slope;
            layer.A2(layer.A2 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W2 .* layer.A2) * Xp + layer.W02;
            Z = vertcat(Z, Zd);


            layer.A3(layer.A3 > layer.slope) = layer.slope;
            layer.A3(layer.A3 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W3 .* layer.A3) * Xp + layer.W03;
            Z = vertcat(Z, Zd);


            layer.A4(layer.A4 > layer.slope) = layer.slope;
            layer.A4(layer.A4 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W4 .* layer.A4) * Xp + layer.W04;
            Z = vertcat(Z, Zd);


            layer.A5(layer.A5 > layer.slope) = layer.slope;
            layer.A5(layer.A5 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W5 .* layer.A5) * Xp + layer.W05;
            Z = vertcat(Z, Zd);


            layer.A6(layer.A6 > layer.slope) = layer.slope;
            layer.A6(layer.A6 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W6 .* layer.A6) * Xp + layer.W06;
            Z = vertcat(Z, Zd);


            layer.A7(layer.A7 > layer.slope) = layer.slope;
            layer.A7(layer.A7 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W7 .* layer.A7) * Xp + layer.W07;
            Z = vertcat(Z, Zd);


            layer.A8(layer.A8 > layer.slope) = layer.slope;
            layer.A8(layer.A8 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W8 .* layer.A8) * Xp + layer.W08;
            Z = vertcat(Z, Zd);


            layer.A9(layer.A9 > layer.slope) = layer.slope;
            layer.A9(layer.A9 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W9 .* layer.A9) * Xp + layer.W09;
            Z = vertcat(Z, Zd);


            layer.A10(layer.A10 > layer.slope) = layer.slope;
            layer.A10(layer.A10 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W10 .* layer.A10) * Xp + layer.W010;
            Z = vertcat(Z, Zd);


            layer.A11(layer.A11 > layer.slope) = layer.slope;
            layer.A11(layer.A11 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W11 .* layer.A11) * Xp + layer.W011;
            Z = vertcat(Z, Zd);


            layer.A12(layer.A12 > layer.slope) = layer.slope;
            layer.A12(layer.A12 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W12 .* layer.A12) * Xp + layer.W012;
            Z = vertcat(Z, Zd);


            layer.A13(layer.A13 > layer.slope) = layer.slope;
            layer.A13(layer.A13 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W13 .* layer.A13) * Xp + layer.W013;
            Z = vertcat(Z, Zd);


            layer.A14(layer.A14 > layer.slope) = layer.slope;
            layer.A14(layer.A14 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W14 .* layer.A14) * Xp + layer.W014;
            Z = vertcat(Z, Zd);


            layer.A15(layer.A15 > layer.slope) = layer.slope;
            layer.A15(layer.A15 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W15 .* layer.A15) * Xp + layer.W015;
            Z = vertcat(Z, Zd);


            layer.A16(layer.A16 > layer.slope) = layer.slope;
            layer.A16(layer.A16 < 0) = 0;

            PM = X>=0;
            Xp = X .* PM;

            Zd = (layer.W16 .* layer.A16) * Xp + layer.W016;
            Z = vertcat(Z, Zd);




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