classdef residualVis5x5x3CosPcTransformerLayer < nnet.layer.Layer % & nnet.layer.Formattable (Optional)

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


        Wq1g
        Wk1g

        Wq2g
        Wk2g

        Wq3g
        Wk3g

        Wq4g
        Wk4g

        Wq5g
        Wk5g

        Wq6g
        Wk6g

        Wq7g
        Wk7g

        Wq8g
        Wk8g

        Wq9g
        Wk9g
        
        Wq10g
        Wk10g

        Wq11g
        Wk11g

        Wq12g
        Wk12g

        Wq13g
        Wk13g

        Wq14g
        Wk14g

        Wq15g
        Wk15g

        Wq16g
        Wk16g

        Wq17g
        Wk17g

        Wq18g
        Wk18g

        Wq19g
        Wk19g

        Wq20g
        Wk20g

        Wq21g
        Wk21g

        Wq22g
        Wk22g

        Wq23g
        Wk23g

        Wq24g
        Wk24g

        Wq25g
        Wk25g



        Wq1b
        Wk1b

        Wq2b
        Wk2b

        Wq3b
        Wk3b

        Wq4b
        Wk4b

        Wq5b
        Wk5b

        Wq6b
        Wk6b

        Wq7b
        Wk7b

        Wq8b
        Wk8b

        Wq9b
        Wk9b
        
        Wq10b
        Wk10b

        Wq11b
        Wk11b

        Wq12b
        Wk12b

        Wq13b
        Wk13b

        Wq14b
        Wk14b

        Wq15b
        Wk15b

        Wq16b
        Wk16b

        Wq17b
        Wk17b

        Wq18b
        Wk18b

        Wq19b
        Wk19b

        Wq20b
        Wk20b

        Wq21b
        Wk21b

        Wq22b
        Wk22b

        Wq23b
        Wk23b

        Wq24b
        Wk24b

        Wq25b
        Wk25b




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



        Wq01g
        Wk01g

        Wq02g
        Wk02g

        Wq03g
        Wk03g

        Wq04g
        Wk04g

        Wq05g
        Wk05g

        Wq06g
        Wk06g

        Wq07g
        Wk07g

        Wq08g
        Wk08g

        Wq09g
        Wk09g

        Wq010g
        Wk010g

        Wq011g
        Wk011g

        Wq012g
        Wk012g

        Wq013g
        Wk013g

        Wq014g
        Wk014g

        Wq015g
        Wk015g

        Wq016g
        Wk016g

        Wq017g
        Wk017g

        Wq018g
        Wk018g

        Wq019g
        Wk019g

        Wq020g
        Wk020g

        Wq021g
        Wk021g

        Wq022g
        Wk022g

        Wq023g
        Wk023g

        Wq024g
        Wk024g

        Wq025g
        Wk025g



        Wq01b
        Wk01b

        Wq02b
        Wk02b

        Wq03b
        Wk03b

        Wq04b
        Wk04b

        Wq05b
        Wk05b

        Wq06b
        Wk06b

        Wq07b
        Wk07b

        Wq08b
        Wk08b

        Wq09b
        Wk09b

        Wq010b
        Wk010b

        Wq011b
        Wk011b

        Wq012b
        Wk012b

        Wq013b
        Wk013b

        Wq014b
        Wk014b

        Wq015b
        Wk015b

        Wq016b
        Wk016b

        Wq017b
        Wk017b

        Wq018b
        Wk018b

        Wq019b
        Wk019b

        Wq020b
        Wk020b

        Wq021b
        Wk021b

        Wq022b
        Wk022b

        Wq023b
        Wk023b

        Wq024b
        Wk024b

        Wq025b
        Wk025b



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
        function layer = residualVis5x5x3CosPcTransformerLayer(numInChannels, numPatchV, numPatchH, numResChannels, name)
            % (Optional) Create a myLayer.
            % This function must have the same name as the class.

            % Define layer constructor function here.

            % Set layer name.
            layer.Name = name;

            % Set layer description.
            layer.Description = "Residual Visual 5x5x3 Transformer" + numPatchV*numPatchH + " channels";

            layer.numPatch = numPatchV * numPatchH;
            layer.numInChannels = numInChannels; 
            layer.numResChannels = numResChannels;

            % Initialize weight coefficients.
            bound = sqrt(6 / (layer.numPatch + layer.numPatch));
            %boundRes = sqrt(6 / (layer.numResChannels + layer.numResChannels));
            
            layer.Wq1r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq01r = zeros([layer.numPatch, 1]);
            layer.Wk1r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk01r = zeros([layer.numPatch, 1]);

            layer.Wq2r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq02r = zeros([layer.numPatch, 1]);
            layer.Wk2r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk02r = zeros([layer.numPatch, 1]);

            layer.Wq3r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq03r = zeros([layer.numPatch, 1]);
            layer.Wk3r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk03r = zeros([layer.numPatch, 1]);

            layer.Wq4r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq04r = zeros([layer.numPatch, 1]);
            layer.Wk4r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk04r = zeros([layer.numPatch, 1]);

            layer.Wq5r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq05r = zeros([layer.numPatch, 1]);
            layer.Wk5r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk05r = zeros([layer.numPatch, 1]);

            layer.Wq6r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq06r = zeros([layer.numPatch, 1]);
            layer.Wk6r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk06r = zeros([layer.numPatch, 1]);

            layer.Wq7r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq07r = zeros([layer.numPatch, 1]);
            layer.Wk7r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk07r = zeros([layer.numPatch, 1]);

            layer.Wq8r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq08r = zeros([layer.numPatch, 1]);
            layer.Wk8r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk08r = zeros([layer.numPatch, 1]);

            layer.Wq9r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq09r = zeros([layer.numPatch, 1]);
            layer.Wk9r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk09r = zeros([layer.numPatch, 1]);

            layer.Wq10r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq010r = zeros([layer.numPatch, 1]);
            layer.Wk10r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk010r = zeros([layer.numPatch, 1]);

            layer.Wq11r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq011r = zeros([layer.numPatch, 1]);
            layer.Wk11r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk011r = zeros([layer.numPatch, 1]);

            layer.Wq12r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq012r = zeros([layer.numPatch, 1]);
            layer.Wk12r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk012r = zeros([layer.numPatch, 1]);

            layer.Wq13r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq013r = zeros([layer.numPatch, 1]);
            layer.Wk13r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk013r = zeros([layer.numPatch, 1]);

            layer.Wq14r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq014r = zeros([layer.numPatch, 1]);
            layer.Wk14r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk014r = zeros([layer.numPatch, 1]);

            layer.Wq15r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq015r = zeros([layer.numPatch, 1]);
            layer.Wk15r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk015r = zeros([layer.numPatch, 1]);

            layer.Wq16r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq016r = zeros([layer.numPatch, 1]);
            layer.Wk16r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk016r = zeros([layer.numPatch, 1]);

            layer.Wq17r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq017r = zeros([layer.numPatch, 1]);
            layer.Wk17r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk017r = zeros([layer.numPatch, 1]);

            layer.Wq18r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq018r = zeros([layer.numPatch, 1]);
            layer.Wk18r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk018r = zeros([layer.numPatch, 1]);

            layer.Wq19r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq019r = zeros([layer.numPatch, 1]);
            layer.Wk19r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk019r = zeros([layer.numPatch, 1]);

            layer.Wq20r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq020r = zeros([layer.numPatch, 1]);
            layer.Wk20r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk020r = zeros([layer.numPatch, 1]);

            layer.Wq21r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq021r = zeros([layer.numPatch, 1]);
            layer.Wk21r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk021r = zeros([layer.numPatch, 1]);

            layer.Wq22r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq022r = zeros([layer.numPatch, 1]);
            layer.Wk22r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk022r = zeros([layer.numPatch, 1]);

            layer.Wq23r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq023r = zeros([layer.numPatch, 1]);
            layer.Wk23r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk023r = zeros([layer.numPatch, 1]);

            layer.Wq24r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq024r = zeros([layer.numPatch, 1]);
            layer.Wk24r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk024r = zeros([layer.numPatch, 1]);

            layer.Wq25r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq025r = zeros([layer.numPatch, 1]);
            layer.Wk25r = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk025r = zeros([layer.numPatch, 1]);


            layer.Wq1g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq01g = zeros([layer.numPatch, 1]);
            layer.Wk1g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk01g = zeros([layer.numPatch, 1]);

            layer.Wq2g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq02g = zeros([layer.numPatch, 1]);
            layer.Wk2g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk02g = zeros([layer.numPatch, 1]);

            layer.Wq3g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq03g = zeros([layer.numPatch, 1]);
            layer.Wk3g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk03g = zeros([layer.numPatch, 1]);

            layer.Wq4g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq04g = zeros([layer.numPatch, 1]);
            layer.Wk4g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk04g = zeros([layer.numPatch, 1]);

            layer.Wq5g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq05g = zeros([layer.numPatch, 1]);
            layer.Wk5g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk05g = zeros([layer.numPatch, 1]);

            layer.Wq6g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq06g = zeros([layer.numPatch, 1]);
            layer.Wk6g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk06g = zeros([layer.numPatch, 1]);

            layer.Wq7g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq07g = zeros([layer.numPatch, 1]);
            layer.Wk7g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk07g = zeros([layer.numPatch, 1]);

            layer.Wq8g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq08g = zeros([layer.numPatch, 1]);
            layer.Wk8g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk08g = zeros([layer.numPatch, 1]);

            layer.Wq9g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq09g = zeros([layer.numPatch, 1]);
            layer.Wk9g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk09g = zeros([layer.numPatch, 1]);

            layer.Wq10g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq010g = zeros([layer.numPatch, 1]);
            layer.Wk10g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk010g = zeros([layer.numPatch, 1]);

            layer.Wq11g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq011g = zeros([layer.numPatch, 1]);
            layer.Wk11g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk011g = zeros([layer.numPatch, 1]);

            layer.Wq12g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq012g = zeros([layer.numPatch, 1]);
            layer.Wk12g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk012g = zeros([layer.numPatch, 1]);

            layer.Wq13g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq013g = zeros([layer.numPatch, 1]);
            layer.Wk13g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk013g = zeros([layer.numPatch, 1]);

            layer.Wq14g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq014g = zeros([layer.numPatch, 1]);
            layer.Wk14g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk014g = zeros([layer.numPatch, 1]);

            layer.Wq15g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq015g = zeros([layer.numPatch, 1]);
            layer.Wk15g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk015g = zeros([layer.numPatch, 1]);

            layer.Wq16g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq016g = zeros([layer.numPatch, 1]);
            layer.Wk16g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk016g = zeros([layer.numPatch, 1]);

            layer.Wq17g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq017g = zeros([layer.numPatch, 1]);
            layer.Wk17g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk017g = zeros([layer.numPatch, 1]);

            layer.Wq18g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq018g = zeros([layer.numPatch, 1]);
            layer.Wk18g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk018g = zeros([layer.numPatch, 1]);

            layer.Wq19g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq019g = zeros([layer.numPatch, 1]);
            layer.Wk19g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk019g = zeros([layer.numPatch, 1]);

            layer.Wq20g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq020g = zeros([layer.numPatch, 1]);
            layer.Wk20g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk020g = zeros([layer.numPatch, 1]);

            layer.Wq21g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq021g = zeros([layer.numPatch, 1]);
            layer.Wk21g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk021g = zeros([layer.numPatch, 1]);

            layer.Wq22g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq022g = zeros([layer.numPatch, 1]);
            layer.Wk22g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk022g = zeros([layer.numPatch, 1]);

            layer.Wq23g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq023g = zeros([layer.numPatch, 1]);
            layer.Wk23g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk023g = zeros([layer.numPatch, 1]);

            layer.Wq24g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq024g = zeros([layer.numPatch, 1]);
            layer.Wk24g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk024g = zeros([layer.numPatch, 1]);

            layer.Wq25g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq025g = zeros([layer.numPatch, 1]);
            layer.Wk25g = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk025g = zeros([layer.numPatch, 1]);

            


            layer.Wq1b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq01b = zeros([layer.numPatch, 1]);
            layer.Wk1b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk01b = zeros([layer.numPatch, 1]);

            layer.Wq2b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq02b = zeros([layer.numPatch, 1]);
            layer.Wk2b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk02b = zeros([layer.numPatch, 1]);

            layer.Wq3b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq03b = zeros([layer.numPatch, 1]);
            layer.Wk3b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk03b = zeros([layer.numPatch, 1]);

            layer.Wq4b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq04b = zeros([layer.numPatch, 1]);
            layer.Wk4b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk04b = zeros([layer.numPatch, 1]);

            layer.Wq5b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq05b = zeros([layer.numPatch, 1]);
            layer.Wk5b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk05b = zeros([layer.numPatch, 1]);

            layer.Wq6b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq06b = zeros([layer.numPatch, 1]);
            layer.Wk6b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk06b = zeros([layer.numPatch, 1]);

            layer.Wq7b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq07b = zeros([layer.numPatch, 1]);
            layer.Wk7b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk07b = zeros([layer.numPatch, 1]);

            layer.Wq8b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq08b = zeros([layer.numPatch, 1]);
            layer.Wk8b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk08b = zeros([layer.numPatch, 1]);

            layer.Wq9b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq09b = zeros([layer.numPatch, 1]);
            layer.Wk9b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk09b = zeros([layer.numPatch, 1]);

            layer.Wq10b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq010b = zeros([layer.numPatch, 1]);
            layer.Wk10b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk010b = zeros([layer.numPatch, 1]);

            layer.Wq11b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq011b = zeros([layer.numPatch, 1]);
            layer.Wk11b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk011b = zeros([layer.numPatch, 1]);

            layer.Wq12b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq012b = zeros([layer.numPatch, 1]);
            layer.Wk12b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk012b = zeros([layer.numPatch, 1]);

            layer.Wq13b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq013b = zeros([layer.numPatch, 1]);
            layer.Wk13b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk013b = zeros([layer.numPatch, 1]);

            layer.Wq14b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq014b = zeros([layer.numPatch, 1]);
            layer.Wk14b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk014b = zeros([layer.numPatch, 1]);

            layer.Wq15b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq015b = zeros([layer.numPatch, 1]);
            layer.Wk15b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk015b = zeros([layer.numPatch, 1]);

            layer.Wq16b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq016b = zeros([layer.numPatch, 1]);
            layer.Wk16b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk016b = zeros([layer.numPatch, 1]); 

            layer.Wq17b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq017b = zeros([layer.numPatch, 1]);
            layer.Wk17b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk017b = zeros([layer.numPatch, 1]);

            layer.Wq18b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq018b = zeros([layer.numPatch, 1]);
            layer.Wk18b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk018b = zeros([layer.numPatch, 1]);

            layer.Wq19b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq019b = zeros([layer.numPatch, 1]);
            layer.Wk19b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk019b = zeros([layer.numPatch, 1]);

            layer.Wq20b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq020b = zeros([layer.numPatch, 1]);
            layer.Wk20b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk020b = zeros([layer.numPatch, 1]);

            layer.Wq21b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq021b = zeros([layer.numPatch, 1]);
            layer.Wk21b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk021b = zeros([layer.numPatch, 1]);

            layer.Wq22b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq022b = zeros([layer.numPatch, 1]);
            layer.Wk22b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk022b = zeros([layer.numPatch, 1]);

            layer.Wq23b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq023b = zeros([layer.numPatch, 1]);
            layer.Wk23b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk023b = zeros([layer.numPatch, 1]);

            layer.Wq24b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq024b = zeros([layer.numPatch, 1]);
            layer.Wk24b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk024b = zeros([layer.numPatch, 1]);

            layer.Wq25b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wq025b = zeros([layer.numPatch, 1]);
            layer.Wk25b = bound * (2. * rand([layer.numPatch, layer.numPatch],'single') - 1.);
            layer.Wk025b = zeros([layer.numPatch, 1]);





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

            X1r = X(1+cOff:cOff+layer.numPatch,:);
            K1r = layer.Wk1r * X1r + layer.Wk01r;
            Q1r = layer.Wq1r * X1r + layer.Wq01r;
            DK21r = sum(K1r' .* K1r', 1);
            DQ21r = sum(Q1r' .* Q1r', 1);
            DQK1r = sqrt(DQ21r' * DK21r);
            Y1r = (Q1r * K1r') ./ DQK1r;
            Z1r = (X1r' * softmax(Y1r, 'DataFormat', 'CB'))';

            X2r = X(1+cOff+layer.numPatch:cOff+layer.numPatch*2,:);
            K2r = layer.Wk2r * X2r + layer.Wk02r;
            Q2r = layer.Wq2r * X2r + layer.Wq02r;
            DK22r = sum(K2r' .* K2r', 1);
            DQ22r = sum(Q2r' .* Q2r', 1);
            DQK2r = sqrt(DQ22r' * DK22r);
            Y2r = (Q2r * K2r') ./ DQK2r;
            Z2r = (X2r' * softmax(Y2r, 'DataFormat', 'CB'))';

            X3r = X(1+cOff+layer.numPatch*2:cOff+layer.numPatch*3,:);
            K3r = layer.Wk3r * X3r + layer.Wk03r;
            Q3r = layer.Wq3r * X3r + layer.Wq03r;
            DK23r = sum(K3r' .* K3r', 1);
            DQ23r = sum(Q3r' .* Q3r', 1);
            DQK3r = sqrt(DQ23r' * DK23r);
            Y3r = (Q3r * K3r') ./ DQK3r;
            Z3r = (X3r' * softmax(Y3r, 'DataFormat', 'CB'))';

            X4r = X(1+cOff+layer.numPatch*3:cOff+layer.numPatch*4,:);
            K4r = layer.Wk4r * X4r + layer.Wk04r;
            Q4r = layer.Wq4r * X4r + layer.Wq04r;
            DK24r = sum(K4r' .* K4r', 1);
            DQ24r = sum(Q4r' .* Q4r', 1);
            DQK4r = sqrt(DQ24r' * DK24r);
            Y4r = (Q4r * K4r') ./ DQK4r;
            Z4r = (X4r' * softmax(Y4r, 'DataFormat', 'CB'))';

            X5r = X(1+cOff+layer.numPatch*4:cOff+layer.numPatch*5,:);
            K5r = layer.Wk5r * X5r + layer.Wk05r;
            Q5r = layer.Wq5r * X5r + layer.Wq05r;
            DK25r = sum(K5r' .* K5r', 1);
            DQ25r = sum(Q5r' .* Q5r', 1);
            DQK5r = sqrt(DQ25r' * DK25r);
            Y5r = (Q5r * K5r') ./ DQK5r;
            Z5r = (X5r' * softmax(Y5r, 'DataFormat', 'CB'))';

            X6r = X(1+cOff+layer.numPatch*5:cOff+layer.numPatch*6,:);
            K6r = layer.Wk6r * X6r + layer.Wk06r;
            Q6r = layer.Wq6r * X6r + layer.Wq06r;
            DK26r = sum(K6r' .* K6r', 1);
            DQ26r = sum(Q6r' .* Q6r', 1);
            DQK6r = sqrt(DQ26r' * DK26r);
            Y6r = (Q6r * K6r') ./ DQK6r;
            Z6r = (X6r' * softmax(Y6r, 'DataFormat', 'CB'))';

            X7r = X(1+cOff+layer.numPatch*6:cOff+layer.numPatch*7,:);
            K7r = layer.Wk7r * X7r + layer.Wk07r;
            Q7r = layer.Wq7r * X7r + layer.Wq07r;
            DK27r = sum(K7r' .* K7r', 1);
            DQ27r = sum(Q7r' .* Q7r', 1);
            DQK7r = sqrt(DQ27r' * DK27r);
            Y7r = (Q7r * K7r') ./ DQK7r;
            Z7r = (X7r' * softmax(Y7r, 'DataFormat', 'CB'))';

            X8r = X(1+cOff+layer.numPatch*7:cOff+layer.numPatch*8,:);
            K8r = layer.Wk8r * X8r + layer.Wk08r;
            Q8r = layer.Wq8r * X8r + layer.Wq08r;
            DK28r = sum(K8r' .* K8r', 1);
            DQ28r = sum(Q8r' .* Q8r', 1);
            DQK8r = sqrt(DQ28r' * DK28r);
            Y8r = (Q8r * K8r') ./ DQK8r;
            Z8r = (X8r' * softmax(Y8r, 'DataFormat', 'CB'))';

            X9r = X(1+cOff+layer.numPatch*8:cOff+layer.numPatch*9,:);
            K9r = layer.Wk9r * X9r + layer.Wk09r;
            Q9r = layer.Wq9r * X9r + layer.Wq09r;
            DK29r = sum(K9r' .* K9r', 1);
            DQ29r = sum(Q9r' .* Q9r', 1);
            DQK9r = sqrt(DQ29r' * DK29r);
            Y9r = (Q9r * K9r') ./ DQK9r;
            Z9r = (X9r' * softmax(Y9r, 'DataFormat', 'CB'))';

            X10r = X(1+cOff+layer.numPatch*9:cOff+layer.numPatch*10,:);
            K10r = layer.Wk10r * X10r + layer.Wk010r;
            Q10r = layer.Wq10r * X10r + layer.Wq010r;
            DK210r = sum(K10r' .* K10r', 1);
            DQ210r = sum(Q10r' .* Q10r', 1);
            DQK10r = sqrt(DQ210r' * DK210r);
            Y10r = (Q10r * K10r') ./ DQK10r;
            Z10r = (X10r' * softmax(Y10r, 'DataFormat', 'CB'))';

            X11r = X(1+cOff+layer.numPatch*10:cOff+layer.numPatch*11,:);
            K11r = layer.Wk11r * X11r + layer.Wk011r;
            Q11r = layer.Wq11r * X11r + layer.Wq011r;
            DK211r = sum(K11r' .* K11r', 1);
            DQ211r = sum(Q11r' .* Q11r', 1);
            DQK11r = sqrt(DQ211r' * DK211r);
            Y11r = (Q11r * K11r') ./ DQK11r;
            Z11r = (X11r' * softmax(Y11r, 'DataFormat', 'CB'))';     

            X12r = X(1+cOff+layer.numPatch*11:cOff+layer.numPatch*12,:);
            K12r = layer.Wk12r * X12r + layer.Wk012r;
            Q12r = layer.Wq12r * X12r + layer.Wq012r;
            DK212r = sum(K12r' .* K12r', 1);
            DQ212r = sum(Q12r' .* Q12r', 1);
            DQK12r = sqrt(DQ212r' * DK212r);
            Y12r = (Q12r * K12r') ./ DQK12r;
            Z12r = (X12r' * softmax(Y12r, 'DataFormat', 'CB'))';  

            X13r = X(1+cOff+layer.numPatch*12:cOff+layer.numPatch*13,:);
            K13r = layer.Wk13r * X13r + layer.Wk013r;
            Q13r = layer.Wq13r * X13r + layer.Wq013r;
            DK213r = sum(K13r' .* K13r', 1);
            DQ213r = sum(Q13r' .* Q13r', 1);
            DQK13r = sqrt(DQ213r' * DK213r);
            Y13r = (Q13r * K13r') ./ DQK13r;
            Z13r = (X13r' * softmax(Y13r, 'DataFormat', 'CB'))';  

            X14r = X(1+cOff+layer.numPatch*13:cOff+layer.numPatch*14,:);
            K14r = layer.Wk14r * X14r + layer.Wk014r;
            Q14r = layer.Wq14r * X14r + layer.Wq014r;
            DK214r = sum(K14r' .* K14r', 1);
            DQ214r = sum(Q14r' .* Q14r', 1);
            DQK14r = sqrt(DQ214r' * DK214r);
            Y14r = (Q14r * K14r') ./ DQK14r;
            Z14r = (X14r' * softmax(Y14r, 'DataFormat', 'CB'))';

            X15r = X(1+cOff+layer.numPatch*14:cOff+layer.numPatch*15,:);
            K15r = layer.Wk15r * X15r + layer.Wk015r;
            Q15r = layer.Wq15r * X15r + layer.Wq015r;
            DK215r = sum(K15r' .* K15r', 1);
            DQ215r = sum(Q15r' .* Q15r', 1);
            DQK15r = sqrt(DQ215r' * DK215r);
            Y15r = (Q15r * K15r') ./ DQK15r;
            Z15r = (X15r' * softmax(Y15r, 'DataFormat', 'CB'))';

            X16r = X(1+cOff+layer.numPatch*15:cOff+layer.numPatch*16,:);
            K16r = layer.Wk16r * X16r + layer.Wk016r;
            Q16r = layer.Wq16r * X16r + layer.Wq016r;
            DK216r = sum(K16r' .* K16r', 1);
            DQ216r = sum(Q16r' .* Q16r', 1);
            DQK16r = sqrt(DQ216r' * DK216r);
            Y16r = (Q16r * K16r') ./ DQK16r;
            Z16r = (X16r' * softmax(Y16r, 'DataFormat', 'CB'))';

            X17r = X(1+cOff+layer.numPatch*16:cOff+layer.numPatch*17,:);
            K17r = layer.Wk17r * X17r + layer.Wk017r;
            Q17r = layer.Wq17r * X17r + layer.Wq017r;
            DK217r = sum(K17r' .* K17r', 1);
            DQ217r = sum(Q17r' .* Q17r', 1);
            DQK17r = sqrt(DQ217r' * DK217r);
            Y17r = (Q17r * K17r') ./ DQK17r;
            Z17r = (X17r' * softmax(Y17r, 'DataFormat', 'CB'))';

            X18r = X(1+cOff+layer.numPatch*17:cOff+layer.numPatch*18,:);
            K18r = layer.Wk18r * X18r + layer.Wk018r;
            Q18r = layer.Wq18r * X18r + layer.Wq018r;
            DK218r = sum(K18r' .* K18r', 1);
            DQ218r = sum(Q18r' .* Q18r', 1);
            DQK18r = sqrt(DQ218r' * DK218r);
            Y18r = (Q18r * K18r') ./ DQK18r;
            Z18r = (X18r' * softmax(Y18r, 'DataFormat', 'CB'))';

            X19r = X(1+cOff+layer.numPatch*18:cOff+layer.numPatch*19,:);
            K19r = layer.Wk19r * X19r + layer.Wk019r;
            Q19r = layer.Wq19r * X19r + layer.Wq019r;
            DK219r = sum(K19r' .* K19r', 1);
            DQ219r = sum(Q19r' .* Q19r', 1);
            DQK19r = sqrt(DQ219r' * DK219r);
            Y19r = (Q19r * K19r') ./ DQK19r;
            Z19r = (X19r' * softmax(Y19r, 'DataFormat', 'CB'))';

            X20r = X(1+cOff+layer.numPatch*19:cOff+layer.numPatch*20,:);
            K20r = layer.Wk20r * X20r + layer.Wk020r;
            Q20r = layer.Wq20r * X20r + layer.Wq020r;
            DK220r = sum(K20r' .* K20r', 1);
            DQ220r = sum(Q20r' .* Q20r', 1);
            DQK20r = sqrt(DQ220r' * DK220r);
            Y20r = (Q20r * K20r') ./ DQK20r;
            Z20r = (X20r' * softmax(Y20r, 'DataFormat', 'CB'))';

            X21r = X(1+cOff+layer.numPatch*20:cOff+layer.numPatch*21,:);
            K21r = layer.Wk21r * X21r + layer.Wk021r;
            Q21r = layer.Wq21r * X21r + layer.Wq021r;
            DK221r = sum(K21r' .* K21r', 1);
            DQ221r = sum(Q21r' .* Q21r', 1);
            DQK21r = sqrt(DQ221r' * DK221r);
            Y21r = (Q21r * K21r') ./ DQK21r;
            Z21r = (X21r' * softmax(Y21r, 'DataFormat', 'CB'))';

            X22r = X(1+cOff+layer.numPatch*21:cOff+layer.numPatch*22,:);
            K22r = layer.Wk22r * X22r + layer.Wk022r;
            Q22r = layer.Wq22r * X22r + layer.Wq022r;
            DK222r = sum(K22r' .* K22r', 1);
            DQ222r = sum(Q22r' .* Q22r', 1);
            DQK22r = sqrt(DQ222r' * DK222r);
            Y22r = (Q22r * K22r') ./ DQK22r;
            Z22r = (X22r' * softmax(Y22r, 'DataFormat', 'CB'))';

            X23r = X(1+cOff+layer.numPatch*22:cOff+layer.numPatch*23,:);
            K23r = layer.Wk23r * X23r + layer.Wk023r;
            Q23r = layer.Wq23r * X23r + layer.Wq023r;
            DK223r = sum(K23r' .* K23r', 1);
            DQ223r = sum(Q23r' .* Q23r', 1);
            DQK23r = sqrt(DQ223r' * DK223r);
            Y23r = (Q23r * K23r') ./ DQK23r;
            Z23r = (X23r' * softmax(Y23r, 'DataFormat', 'CB'))';

            X24r = X(1+cOff+layer.numPatch*23:cOff+layer.numPatch*24,:);
            K24r = layer.Wk24r * X24r + layer.Wk024r;
            Q24r = layer.Wq24r * X24r + layer.Wq024r;
            DK224r = sum(K24r' .* K24r', 1);
            DQ224r = sum(Q24r' .* Q24r', 1);
            DQK24r = sqrt(DQ224r' * DK224r);
            Y24r = (Q24r * K24r') ./ DQK24r;
            Z24r = (X24r' * softmax(Y24r, 'DataFormat', 'CB'))';

            X25r = X(1+cOff+layer.numPatch*24:cOff+layer.numPatch*25,:);
            K25r = layer.Wk25r * X25r + layer.Wk025r;
            Q25r = layer.Wq25r * X25r + layer.Wq025r;
            DK225r = sum(K25r' .* K25r', 1);
            DQ225r = sum(Q25r' .* Q25r', 1);
            DQK25r = sqrt(DQ225r' * DK225r);
            Y25r = (Q25r * K25r') ./ DQK25r;
            Z25r = (X25r' * softmax(Y25r, 'DataFormat', 'CB'))';
            


            %green
            cOff = ceil(layer.numPatch*5*5)*1;

            X1g = X(1+cOff:cOff+layer.numPatch,:);
            K1g = layer.Wk1g * X1g + layer.Wk01g;
            Q1g = layer.Wq1g * X1g + layer.Wq01g;
            DK21g = sum(K1g' .* K1g', 1);
            DQ21g = sum(Q1g' .* Q1g', 1);
            DQK1g = sqrt(DQ21g' * DK21g);
            Y1g = (Q1g * K1g') ./ DQK1g;
            Z1g = (X1g' * softmax(Y1g, 'DataFormat', 'CB'))';

            X2g = X(1+cOff+layer.numPatch:cOff+layer.numPatch*2,:);
            K2g = layer.Wk2g * X2g + layer.Wk02g;
            Q2g = layer.Wq2g * X2g + layer.Wq02g;
            DK22g = sum(K2g' .* K2g', 1);
            DQ22g = sum(Q2g' .* Q2g', 1);
            DQK2g = sqrt(DQ22g' * DK22g);
            Y2g = (Q2g * K2g') ./ DQK2g;
            Z2g = (X2g' * softmax(Y2g, 'DataFormat', 'CB'))';

            X3g = X(1+cOff+layer.numPatch*2:cOff+layer.numPatch*3,:);
            K3g = layer.Wk3g * X3g + layer.Wk03g;
            Q3g = layer.Wq3g * X3g + layer.Wq03g;
            DK23g = sum(K3g' .* K3g', 1);
            DQ23g = sum(Q3g' .* Q3g', 1);
            DQK3g = sqrt(DQ23g' * DK23g);
            Y3g = (Q3g * K3g') ./ DQK3g;
            Z3g = (X3g' * softmax(Y3g, 'DataFormat', 'CB'))';

            X4g = X(1+cOff+layer.numPatch*3:cOff+layer.numPatch*4,:);
            K4g = layer.Wk4g * X4g + layer.Wk04g;
            Q4g = layer.Wq4g * X4g + layer.Wq04g;
            DK24g = sum(K4g' .* K4g', 1);
            DQ24g = sum(Q4g' .* Q4g', 1);
            DQK4g = sqrt(DQ24g' * DK24g);
            Y4g = (Q4g * K4g') ./ DQK4g;
            Z4g = (X4g' * softmax(Y4g, 'DataFormat', 'CB'))';

            X5g = X(1+cOff+layer.numPatch*4:cOff+layer.numPatch*5,:);
            K5g = layer.Wk5g * X5g + layer.Wk05g;
            Q5g = layer.Wq5g * X5g + layer.Wq05g;
            DK25g = sum(K5g' .* K5g', 1);
            DQ25g = sum(Q5g' .* Q5g', 1);
            DQK5g = sqrt(DQ25g' * DK25g);
            Y5g = (Q5g * K5g') ./ DQK5g;
            Z5g = (X5g' * softmax(Y5g, 'DataFormat', 'CB'))';

            X6g = X(1+cOff+layer.numPatch*5:cOff+layer.numPatch*6,:);
            K6g = layer.Wk6g * X6g + layer.Wk06g;
            Q6g = layer.Wq6g * X6g + layer.Wq06g;
            DK26g = sum(K6g' .* K6g', 1);
            DQ26g = sum(Q6g' .* Q6g', 1);
            DQK6g = sqrt(DQ26g' * DK26g);
            Y6g = (Q6g * K6g') ./ DQK6g;
            Z6g = (X6g' * softmax(Y6g, 'DataFormat', 'CB'))';

            X7g = X(1+cOff+layer.numPatch*6:cOff+layer.numPatch*7,:);
            K7g = layer.Wk7g * X7g + layer.Wk07g;
            Q7g = layer.Wq7g * X7g + layer.Wq07g;
            DK27g = sum(K7g' .* K7g', 1);
            DQ27g = sum(Q7g' .* Q7g', 1);
            DQK7g = sqrt(DQ27g' * DK27g);
            Y7g = (Q7g * K7g') ./ DQK7g;
            Z7g = (X7g' * softmax(Y7g, 'DataFormat', 'CB'))';

            X8g = X(1+cOff+layer.numPatch*7:cOff+layer.numPatch*8,:);
            K8g = layer.Wk8g * X8g + layer.Wk08g;
            Q8g = layer.Wq8g * X8g + layer.Wq08g;
            DK28g = sum(K8g' .* K8g', 1);
            DQ28g = sum(Q8g' .* Q8g', 1);
            DQK8g = sqrt(DQ28g' * DK28g);
            Y8g = (Q8g * K8g') ./ DQK8g;
            Z8g = (X8g' * softmax(Y8g, 'DataFormat', 'CB'))';

            X9g = X(1+cOff+layer.numPatch*8:cOff+layer.numPatch*9,:);
            K9g = layer.Wk9g * X9g + layer.Wk09g;
            Q9g = layer.Wq9g * X9g + layer.Wq09g;
            DK29g = sum(K9g' .* K9g', 1);
            DQ29g = sum(Q9g' .* Q9g', 1);
            DQK9g = sqrt(DQ29g' * DK29g);
            Y9g = (Q9g * K9g') ./ DQK9g;
            Z9g = (X9g' * softmax(Y9g, 'DataFormat', 'CB'))';

            X10g = X(1+cOff+layer.numPatch*9:cOff+layer.numPatch*10,:);
            K10g = layer.Wk10g * X10g + layer.Wk010g;
            Q10g = layer.Wq10g * X10g + layer.Wq010g;
            DK210g = sum(K10g' .* K10g', 1);
            DQ210g = sum(Q10g' .* Q10g', 1);
            DQK10g = sqrt(DQ210g' * DK210g);
            Y10g = (Q10g * K10g') ./ DQK10g;
            Z10g = (X10g' * softmax(Y10g, 'DataFormat', 'CB'))';

            X11g = X(1+cOff+layer.numPatch*10:cOff+layer.numPatch*11,:);
            K11g = layer.Wk11g * X11g + layer.Wk011g;
            Q11g = layer.Wq11g * X11g + layer.Wq011g;
            DK211g = sum(K11g' .* K11g', 1);
            DQ211g = sum(Q11g' .* Q11g', 1);
            DQK11g = sqrt(DQ211g' * DK211g);
            Y11g = (Q11g * K11g') ./ DQK11g;
            Z11g = (X11g' * softmax(Y11g, 'DataFormat', 'CB'))';     

            X12g = X(1+cOff+layer.numPatch*11:cOff+layer.numPatch*12,:);
            K12g = layer.Wk12g * X12g + layer.Wk012g;
            Q12g = layer.Wq12g * X12g + layer.Wq012g;
            DK212g = sum(K12g' .* K12g', 1);
            DQ212g = sum(Q12g' .* Q12g', 1);
            DQK12g = sqrt(DQ212g' * DK212g);
            Y12g = (Q12g * K12g') ./ DQK12g;
            Z12g = (X12g' * softmax(Y12g, 'DataFormat', 'CB'))';  

            X13g = X(1+cOff+layer.numPatch*12:cOff+layer.numPatch*13,:);
            K13g = layer.Wk13g * X13g + layer.Wk013g;
            Q13g = layer.Wq13g * X13g + layer.Wq013g;
            DK213g = sum(K13g' .* K13g', 1);
            DQ213g = sum(Q13g' .* Q13g', 1);
            DQK13g = sqrt(DQ213g' * DK213g);
            Y13g = (Q13g * K13g') ./ DQK13g;
            Z13g = (X13g' * softmax(Y13g, 'DataFormat', 'CB'))';  

            X14g = X(1+cOff+layer.numPatch*13:cOff+layer.numPatch*14,:);
            K14g = layer.Wk14g * X14g + layer.Wk014g;
            Q14g = layer.Wq14g * X14g + layer.Wq014g;
            DK214g = sum(K14g' .* K14g', 1);
            DQ214g = sum(Q14g' .* Q14g', 1);
            DQK14g = sqrt(DQ214g' * DK214g);
            Y14g = (Q14g * K14g') ./ DQK14g;
            Z14g = (X14g' * softmax(Y14g, 'DataFormat', 'CB'))';

            X15g = X(1+cOff+layer.numPatch*14:cOff+layer.numPatch*15,:);
            K15g = layer.Wk15g * X15g + layer.Wk015g;
            Q15g = layer.Wq15g * X15g + layer.Wq015g;
            DK215g = sum(K15g' .* K15g', 1);
            DQ215g = sum(Q15g' .* Q15g', 1);
            DQK15g = sqrt(DQ215g' * DK215g);
            Y15g = (Q15g * K15g') ./ DQK15g;
            Z15g = (X15g' * softmax(Y15g, 'DataFormat', 'CB'))';

            X16g = X(1+cOff+layer.numPatch*15:cOff+layer.numPatch*16,:);
            K16g = layer.Wk16g * X16g + layer.Wk016g;
            Q16g = layer.Wq16g * X16g + layer.Wq016g;
            DK216g = sum(K16g' .* K16g', 1);
            DQ216g = sum(Q16g' .* Q16g', 1);
            DQK16g = sqrt(DQ216g' * DK216g);
            Y16g = (Q16g * K16g') ./ DQK16g;
            Z16g = (X16g' * softmax(Y16g, 'DataFormat', 'CB'))';

            X17g = X(1+cOff+layer.numPatch*16:cOff+layer.numPatch*17,:);
            K17g = layer.Wk17g * X17g + layer.Wk017g;
            Q17g = layer.Wq17g * X17g + layer.Wq017g;
            DK217g = sum(K17g' .* K17g', 1);
            DQ217g = sum(Q17g' .* Q17g', 1);
            DQK17g = sqrt(DQ217g' * DK217g);
            Y17g = (Q17g * K17g') ./ DQK17g;
            Z17g = (X17g' * softmax(Y17g, 'DataFormat', 'CB'))';

            X18g = X(1+cOff+layer.numPatch*17:cOff+layer.numPatch*18,:);
            K18g = layer.Wk18g * X18g + layer.Wk018g;
            Q18g = layer.Wq18g * X18g + layer.Wq018g;
            DK218g = sum(K18g' .* K18g', 1);
            DQ218g = sum(Q18g' .* Q18g', 1);
            DQK18g = sqrt(DQ218g' * DK218g);
            Y18g = (Q18g * K18g') ./ DQK18g;
            Z18g = (X18g' * softmax(Y18g, 'DataFormat', 'CB'))';

            X19g = X(1+cOff+layer.numPatch*18:cOff+layer.numPatch*19,:);
            K19g = layer.Wk19g * X19g + layer.Wk019g;
            Q19g = layer.Wq19g * X19g + layer.Wq019g;
            DK219g = sum(K19g' .* K19g', 1);
            DQ219g = sum(Q19g' .* Q19g', 1);
            DQK19g = sqrt(DQ219g' * DK219g);
            Y19g = (Q19g * K19g') ./ DQK19g;
            Z19g = (X19g' * softmax(Y19g, 'DataFormat', 'CB'))';

            X20g = X(1+cOff+layer.numPatch*19:cOff+layer.numPatch*20,:);
            K20g = layer.Wk20g * X20g + layer.Wk020g;
            Q20g = layer.Wq20g * X20g + layer.Wq020g;
            DK220g = sum(K20g' .* K20g', 1);
            DQ220g = sum(Q20g' .* Q20g', 1);
            DQK20g = sqrt(DQ220g' * DK220g);
            Y20g = (Q20g * K20g') ./ DQK20g;
            Z20g = (X20g' * softmax(Y20g, 'DataFormat', 'CB'))';

            X21g = X(1+cOff+layer.numPatch*20:cOff+layer.numPatch*21,:);
            K21g = layer.Wk21g * X21g + layer.Wk021g;
            Q21g = layer.Wq21g * X21g + layer.Wq021g;
            DK221g = sum(K21g' .* K21g', 1);
            DQ221g = sum(Q21g' .* Q21g', 1);
            DQK21g = sqrt(DQ221g' * DK221g);
            Y21g = (Q21g * K21g') ./ DQK21g;
            Z21g = (X21g' * softmax(Y21g, 'DataFormat', 'CB'))';

            X22g = X(1+cOff+layer.numPatch*21:cOff+layer.numPatch*22,:);
            K22g = layer.Wk22g * X22g + layer.Wk022g;
            Q22g = layer.Wq22g * X22g + layer.Wq022g;
            DK222g = sum(K22g' .* K22g', 1);
            DQ222g = sum(Q22g' .* Q22g', 1);
            DQK22g = sqrt(DQ222g' * DK222g);
            Y22g = (Q22g * K22g') ./ DQK22g;
            Z22g = (X22g' * softmax(Y22g, 'DataFormat', 'CB'))';

            X23g = X(1+cOff+layer.numPatch*22:cOff+layer.numPatch*23,:);
            K23g = layer.Wk23g * X23g + layer.Wk023g;
            Q23g = layer.Wq23g * X23g + layer.Wq023g;
            DK223g = sum(K23g' .* K23g', 1);
            DQ223g = sum(Q23g' .* Q23g', 1);
            DQK23g = sqrt(DQ223g' * DK223g);
            Y23g = (Q23g * K23g') ./ DQK23g;
            Z23g = (X23g' * softmax(Y23g, 'DataFormat', 'CB'))';

            X24g = X(1+cOff+layer.numPatch*23:cOff+layer.numPatch*24,:);
            K24g = layer.Wk24g * X24g + layer.Wk024g;
            Q24g = layer.Wq24g * X24g + layer.Wq024g;
            DK224g = sum(K24g' .* K24g', 1);
            DQ224g = sum(Q24g' .* Q24g', 1);
            DQK24g = sqrt(DQ224g' * DK224g);
            Y24g = (Q24g * K24g') ./ DQK24g;
            Z24g = (X24g' * softmax(Y24g, 'DataFormat', 'CB'))';

            X25g = X(1+cOff+layer.numPatch*24:cOff+layer.numPatch*25,:);
            K25g = layer.Wk25g * X25g + layer.Wk025g;
            Q25g = layer.Wq25g * X25g + layer.Wq025g;
            DK225g = sum(K25g' .* K25g', 1);
            DQ225g = sum(Q25g' .* Q25g', 1);
            DQK25g = sqrt(DQ225g' * DK225g);
            Y25g = (Q25g * K25g') ./ DQK25g;
            Z25g = (X25g' * softmax(Y25g, 'DataFormat', 'CB'))';


            %blue
            cOff = ceil(layer.numPatch*5*5)*2;

            X1b = X(1+cOff:cOff+layer.numPatch,:);
            K1b = layer.Wk1b * X1b + layer.Wk01b;
            Q1b = layer.Wq1b * X1b + layer.Wq01b;
            DK21b = sum(K1b' .* K1b', 1);
            DQ21b = sum(Q1b' .* Q1b', 1);
            DQK1b = sqrt(DQ21b' * DK21b);
            Y1b = (Q1b * K1b') ./ DQK1b;
            Z1b = (X1b' * softmax(Y1b, 'DataFormat', 'CB'))';

            X2b = X(1+cOff+layer.numPatch:cOff+layer.numPatch*2,:);
            K2b = layer.Wk2b * X2b + layer.Wk02b;
            Q2b = layer.Wq2b * X2b + layer.Wq02b;
            DK22b = sum(K2b' .* K2b', 1);
            DQ22b = sum(Q2b' .* Q2b', 1);
            DQK2b = sqrt(DQ22b' * DK22b);
            Y2b = (Q2b * K2b') ./ DQK2b;
            Z2b = (X2b' * softmax(Y2b, 'DataFormat', 'CB'))';

            X3b = X(1+cOff+layer.numPatch*2:cOff+layer.numPatch*3,:);
            K3b = layer.Wk3b * X3b + layer.Wk03b;
            Q3b = layer.Wq3b * X3b + layer.Wq03b;
            DK23b = sum(K3b' .* K3b', 1);
            DQ23b = sum(Q3b' .* Q3b', 1);
            DQK3b = sqrt(DQ23b' * DK23b);
            Y3b = (Q3b * K3b') ./ DQK3b;
            Z3b = (X3b' * softmax(Y3b, 'DataFormat', 'CB'))';

            X4b = X(1+cOff+layer.numPatch*3:cOff+layer.numPatch*4,:);
            K4b = layer.Wk4b * X4b + layer.Wk04b;
            Q4b = layer.Wq4b * X4b + layer.Wq04b;
            DK24b = sum(K4b' .* K4b', 1);
            DQ24b = sum(Q4b' .* Q4b', 1);
            DQK4b = sqrt(DQ24b' * DK24b);
            Y4b = (Q4b * K4b') ./ DQK4b;
            Z4b = (X4b' * softmax(Y4b, 'DataFormat', 'CB'))';

            X5b = X(1+cOff+layer.numPatch*4:cOff+layer.numPatch*5,:);
            K5b = layer.Wk5b * X5b + layer.Wk05b;
            Q5b = layer.Wq5b * X5b + layer.Wq05b;
            DK25b = sum(K5b' .* K5b', 1);
            DQ25b = sum(Q5b' .* Q5b', 1);
            DQK5b = sqrt(DQ25b' * DK25b);
            Y5b = (Q5b * K5b') ./ DQK5b;
            Z5b = (X5b' * softmax(Y5b, 'DataFormat', 'CB'))';

            X6b = X(1+cOff+layer.numPatch*5:cOff+layer.numPatch*6,:);
            K6b = layer.Wk6b * X6b + layer.Wk06b;
            Q6b = layer.Wq6b * X6b + layer.Wq06b;
            DK26b = sum(K6b' .* K6b', 1);
            DQ26b = sum(Q6b' .* Q6b', 1);
            DQK6b = sqrt(DQ26b' * DK26b);
            Y6b = (Q6b * K6b') ./ DQK6b;
            Z6b = (X6b' * softmax(Y6b, 'DataFormat', 'CB'))';

            X7b = X(1+cOff+layer.numPatch*6:cOff+layer.numPatch*7,:);
            K7b = layer.Wk7b * X7b + layer.Wk07b;
            Q7b = layer.Wq7b * X7b + layer.Wq07b;
            DK27b = sum(K7b' .* K7b', 1);
            DQ27b = sum(Q7b' .* Q7b', 1);
            DQK7b = sqrt(DQ27b' * DK27b);
            Y7b = (Q7b * K7b') ./ DQK7b;
            Z7b = (X7b' * softmax(Y7b, 'DataFormat', 'CB'))';

            X8b = X(1+cOff+layer.numPatch*7:cOff+layer.numPatch*8,:);
            K8b = layer.Wk8b * X8b + layer.Wk08b;
            Q8b = layer.Wq8b * X8b + layer.Wq08b;
            DK28b = sum(K8b' .* K8b', 1);
            DQ28b = sum(Q8b' .* Q8b', 1);
            DQK8b = sqrt(DQ28b' * DK28b);
            Y8b = (Q8b * K8b') ./ DQK8b;
            Z8b = (X8b' * softmax(Y8b, 'DataFormat', 'CB'))';

            X9b = X(1+cOff+layer.numPatch*8:cOff+layer.numPatch*9,:);
            K9b = layer.Wk9b * X9b + layer.Wk09b;
            Q9b = layer.Wq9b * X9b + layer.Wq09b;
            DK29b = sum(K9b' .* K9b', 1);
            DQ29b = sum(Q9b' .* Q9b', 1);
            DQK9b = sqrt(DQ29b' * DK29b);
            Y9b = (Q9b * K9b') ./ DQK9b;
            Z9b = (X9b' * softmax(Y9b, 'DataFormat', 'CB'))';

            X10b = X(1+cOff+layer.numPatch*9:cOff+layer.numPatch*10,:);
            K10b = layer.Wk10b * X10b + layer.Wk010b;
            Q10b = layer.Wq10b * X10b + layer.Wq010b;
            DK210b = sum(K10b' .* K10b', 1);
            DQ210b = sum(Q10b' .* Q10b', 1);
            DQK10b = sqrt(DQ210b' * DK210b);
            Y10b = (Q10b * K10b') ./ DQK10b;
            Z10b = (X10b' * softmax(Y10b, 'DataFormat', 'CB'))';

            X11b = X(1+cOff+layer.numPatch*10:cOff+layer.numPatch*11,:);
            K11b = layer.Wk11b * X11b + layer.Wk011b;
            Q11b = layer.Wq11b * X11b + layer.Wq011b;
            DK211b = sum(K11b' .* K11b', 1);
            DQ211b = sum(Q11b' .* Q11b', 1);
            DQK11b = sqrt(DQ211b' * DK211b);
            Y11b = (Q11b * K11b') ./ DQK11b;
            Z11b = (X11b' * softmax(Y11b, 'DataFormat', 'CB'))';     

            X12b = X(1+cOff+layer.numPatch*11:cOff+layer.numPatch*12,:);
            K12b = layer.Wk12b * X12b + layer.Wk012b;
            Q12b = layer.Wq12b * X12b + layer.Wq012b;
            DK212b = sum(K12b' .* K12b', 1);
            DQ212b = sum(Q12b' .* Q12b', 1);
            DQK12b = sqrt(DQ212b' * DK212b);
            Y12b = (Q12b * K12b') ./ DQK12b;
            Z12b = (X12b' * softmax(Y12b, 'DataFormat', 'CB'))';  

            X13b = X(1+cOff+layer.numPatch*12:cOff+layer.numPatch*13,:);
            K13b = layer.Wk13b * X13b + layer.Wk013b;
            Q13b = layer.Wq13b * X13b + layer.Wq013b;
            DK213b = sum(K13b' .* K13b', 1);
            DQ213b = sum(Q13b' .* Q13b', 1);
            DQK13b = sqrt(DQ213b' * DK213b);
            Y13b = (Q13b * K13b') ./ DQK13b;
            Z13b = (X13b' * softmax(Y13b, 'DataFormat', 'CB'))';  

            X14b = X(1+cOff+layer.numPatch*13:cOff+layer.numPatch*14,:);
            K14b = layer.Wk14b * X14b + layer.Wk014b;
            Q14b = layer.Wq14b * X14b + layer.Wq014b;
            DK214b = sum(K14b' .* K14b', 1);
            DQ214b = sum(Q14b' .* Q14b', 1);
            DQK14b = sqrt(DQ214b' * DK214b);
            Y14b = (Q14b * K14b') ./ DQK14b;
            Z14b = (X14b' * softmax(Y14b, 'DataFormat', 'CB'))';

            X15b = X(1+cOff+layer.numPatch*14:cOff+layer.numPatch*15,:);
            K15b = layer.Wk15b * X15b + layer.Wk015b;
            Q15b = layer.Wq15b * X15b + layer.Wq015b;
            DK215b = sum(K15b' .* K15b', 1);
            DQ215b = sum(Q15b' .* Q15b', 1);
            DQK15b = sqrt(DQ215b' * DK215b);
            Y15b = (Q15b * K15b') ./ DQK15b;
            Z15b = (X15b' * softmax(Y15b, 'DataFormat', 'CB'))';

            X16b = X(1+cOff+layer.numPatch*15:cOff+layer.numPatch*16,:);
            K16b = layer.Wk16b * X16b + layer.Wk016b;
            Q16b = layer.Wq16b * X16b + layer.Wq016b;
            DK216b = sum(K16b' .* K16b', 1);
            DQ216b = sum(Q16b' .* Q16b', 1);
            DQK16b = sqrt(DQ216b' * DK216b);
            Y16b = (Q16b * K16b') ./ DQK16b;
            Z16b = (X16b' * softmax(Y16b, 'DataFormat', 'CB'))';

            X17b = X(1+cOff+layer.numPatch*16:cOff+layer.numPatch*17,:);
            K17b = layer.Wk17b * X17b + layer.Wk017b;
            Q17b = layer.Wq17b * X17b + layer.Wq017b;
            DK217b = sum(K17b' .* K17b', 1);
            DQ217b = sum(Q17b' .* Q17b', 1);
            DQK17b = sqrt(DQ217b' * DK217b);
            Y17b = (Q17b * K17b') ./ DQK17b;
            Z17b = (X17b' * softmax(Y17b, 'DataFormat', 'CB'))';

            X18b = X(1+cOff+layer.numPatch*17:cOff+layer.numPatch*18,:);
            K18b = layer.Wk18b * X18b + layer.Wk018b;
            Q18b = layer.Wq18b * X18b + layer.Wq018b;
            DK218b = sum(K18b' .* K18b', 1);
            DQ218b = sum(Q18b' .* Q18b', 1);
            DQK18b = sqrt(DQ218b' * DK218b);
            Y18b = (Q18b * K18b') ./ DQK18b;
            Z18b = (X18b' * softmax(Y18b, 'DataFormat', 'CB'))';

            X19b = X(1+cOff+layer.numPatch*18:cOff+layer.numPatch*19,:);
            K19b = layer.Wk19b * X19b + layer.Wk019b;
            Q19b = layer.Wq19b * X19b + layer.Wq019b;
            DK219b = sum(K19b' .* K19b', 1);
            DQ219b = sum(Q19b' .* Q19b', 1);
            DQK19b = sqrt(DQ219b' * DK219b);
            Y19b = (Q19b * K19b') ./ DQK19b;
            Z19b = (X19b' * softmax(Y19b, 'DataFormat', 'CB'))';

            X20b = X(1+cOff+layer.numPatch*19:cOff+layer.numPatch*20,:);
            K20b = layer.Wk20b * X20b + layer.Wk020b;
            Q20b = layer.Wq20b * X20b + layer.Wq020b;
            DK220b = sum(K20b' .* K20b', 1);
            DQ220b = sum(Q20b' .* Q20b', 1);
            DQK20b = sqrt(DQ220b' * DK220b);
            Y20b = (Q20b * K20b') ./ DQK20b;
            Z20b = (X20b' * softmax(Y20b, 'DataFormat', 'CB'))';

            X21b = X(1+cOff+layer.numPatch*20:cOff+layer.numPatch*21,:);
            K21b = layer.Wk21b * X21b + layer.Wk021b;
            Q21b = layer.Wq21b * X21b + layer.Wq021b;
            DK221b = sum(K21b' .* K21b', 1);
            DQ221b = sum(Q21b' .* Q21b', 1);
            DQK21b = sqrt(DQ221b' * DK221b);
            Y21b = (Q21b * K21b') ./ DQK21b;
            Z21b = (X21b' * softmax(Y21b, 'DataFormat', 'CB'))';

            X22b = X(1+cOff+layer.numPatch*21:cOff+layer.numPatch*22,:);
            K22b = layer.Wk22b * X22b + layer.Wk022b;
            Q22b = layer.Wq22b * X22b + layer.Wq022b;
            DK222b = sum(K22b' .* K22b', 1);
            DQ222b = sum(Q22b' .* Q22b', 1);
            DQK22b = sqrt(DQ222b' * DK222b);
            Y22b = (Q22b * K22b') ./ DQK22b;
            Z22b = (X22b' * softmax(Y22b, 'DataFormat', 'CB'))';

            X23b = X(1+cOff+layer.numPatch*22:cOff+layer.numPatch*23,:);
            K23b = layer.Wk23b * X23b + layer.Wk023b;
            Q23b = layer.Wq23b * X23b + layer.Wq023b;
            DK223b = sum(K23b' .* K23b', 1);
            DQ223b = sum(Q23b' .* Q23b', 1);
            DQK23b = sqrt(DQ223b' * DK223b);
            Y23b = (Q23b * K23b') ./ DQK23b;
            Z23b = (X23b' * softmax(Y23b, 'DataFormat', 'CB'))';

            X24b = X(1+cOff+layer.numPatch*23:cOff+layer.numPatch*24,:);
            K24b = layer.Wk24b * X24b + layer.Wk024b;
            Q24b = layer.Wq24b * X24b + layer.Wq024b;
            DK224b = sum(K24b' .* K24b', 1);
            DQ224b = sum(Q24b' .* Q24b', 1);
            DQK24b = sqrt(DQ224b' * DK224b);
            Y24b = (Q24b * K24b') ./ DQK24b;
            Z24b = (X24b' * softmax(Y24b, 'DataFormat', 'CB'))';

            X25b = X(1+cOff+layer.numPatch*24:cOff+layer.numPatch*25,:);
            K25b = layer.Wk25b * X25b + layer.Wk025b;
            Q25b = layer.Wq25b * X25b + layer.Wq025b;
            DK225b = sum(K25b' .* K25b', 1);
            DQ225b = sum(Q25b' .* Q25b', 1);
            DQK25b = sqrt(DQ225b' * DK225b);
            Y25b = (Q25b * K25b') ./ DQK25b;
            Z25b = (X25b' * softmax(Y25b, 'DataFormat', 'CB'))';



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


            Z = vertcat(Z, Z1g);
            Z = vertcat(Z, Z2g);
            Z = vertcat(Z, Z3g);
            Z = vertcat(Z, Z4g);
            Z = vertcat(Z, Z5g);
            Z = vertcat(Z, Z6g);
            Z = vertcat(Z, Z7g);
            Z = vertcat(Z, Z8g);
            Z = vertcat(Z, Z9g);
            Z = vertcat(Z, Z10g);
            Z = vertcat(Z, Z11g);
            Z = vertcat(Z, Z12g);
            Z = vertcat(Z, Z13g);
            Z = vertcat(Z, Z14g);
            Z = vertcat(Z, Z15g);
            Z = vertcat(Z, Z16g);
            Z = vertcat(Z, Z17g);
            Z = vertcat(Z, Z18g);
            Z = vertcat(Z, Z19g);
            Z = vertcat(Z, Z20g);
            Z = vertcat(Z, Z21g);
            Z = vertcat(Z, Z22g);
            Z = vertcat(Z, Z23g);
            Z = vertcat(Z, Z24g);
            Z = vertcat(Z, Z25g);

            Z = vertcat(Z, Z1b);
            Z = vertcat(Z, Z2b);
            Z = vertcat(Z, Z3b);
            Z = vertcat(Z, Z4b);
            Z = vertcat(Z, Z5b);
            Z = vertcat(Z, Z6b);
            Z = vertcat(Z, Z7b);
            Z = vertcat(Z, Z8b);
            Z = vertcat(Z, Z9b);
            Z = vertcat(Z, Z10b);
            Z = vertcat(Z, Z11b);
            Z = vertcat(Z, Z12b);
            Z = vertcat(Z, Z13b);
            Z = vertcat(Z, Z14b);
            Z = vertcat(Z, Z15b);
            Z = vertcat(Z, Z16b);
            Z = vertcat(Z, Z17b);
            Z = vertcat(Z, Z18b);
            Z = vertcat(Z, Z19b);
            Z = vertcat(Z, Z20b);
            Z = vertcat(Z, Z21b);
            Z = vertcat(Z, Z22b);
            Z = vertcat(Z, Z23b);
            Z = vertcat(Z, Z24b);
            Z = vertcat(Z, Z25b);



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