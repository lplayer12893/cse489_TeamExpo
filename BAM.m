function [outX, outY] = BAM(inputX, inputY)

	% Turn the input image into a 1D vector
	vectorDimension = size(inputX, 1) * size(inputX, 2);
	originalDimension = size(inputX);
	inputX = reshape(inputX, [1, vectorDimension]);

	% Stored Vectors
    bear1 = createMatrix('project_photo\bear1.jpeg');
    bear2 = createMatrix('project_photo\bear2.jpeg');
    bear3 = createMatrix('project_photo\bear3.jpg');
    bear4 = createMatrix('project_photo\bear4.jpg');
    bear5 = createMatrix('project_photo\bear5.jpg');
    %bear6 = createMatrix('project_photo\bear6.jpg');
    bear7 = createMatrix('project_photo\bear7.jpg');
    bear8 = createMatrix('project_photo\bear8.jpg');

    elephant1 = createMatrix('project_photo\elephant1.jpg');
    elephant2 = createMatrix('project_photo\elephant2.jpg');
    elephant3 = createMatrix('project_photo\elephant3.jpg');
    elephant4 = createMatrix('project_photo\elephant4.jpg');
    elephant5 = createMatrix('project_photo\elephant5.jpg');
    elephant6 = createMatrix('project_photo\elephant6.jpg');
    elephant7 = createMatrix('project_photo\elephant7.jpg');
    elephant8 = createMatrix('project_photo\elephant8.jpg');

    fighter1 = createMatrix('project_photo\fighter1.jpg');
    fighter2 = createMatrix('project_photo\fighter2.jpg');
    fighter3 = createMatrix('project_photo\fighter3.jpg');
    fighter4 = createMatrix('project_photo\fighter4.jpg');
    fighter5 = createMatrix('project_photo\fighter5.jpg');
    fighter6 = createMatrix('project_photo\fighter6.jpg');
    fighter7 = createMatrix('project_photo\fighter7.jpg');
    fighter8 = createMatrix('project_photo\fighter8.jpg');

    passenger1 = createMatrix('project_photo\passenger1.jpg');
    passenger2 = createMatrix('project_photo\passenger2.jpg');
    passenger3 = createMatrix('project_photo\passenger3.jpg');
    passenger4 = createMatrix('project_photo\passenger4.jpg');
    passenger5 = createMatrix('project_photo\passenger5.jpg');
    passenger6 = createMatrix('project_photo\passenger6.jpg');
    passenger7 = createMatrix('project_photo\passenger7.jpg');
    passenger8 = createMatrix('project_photo\passenger8.jpg');

    ship1 = createMatrix('project_photo\ship1.jpg');
    ship2 = createMatrix('project_photo\ship2.jpg');
    ship3 = createMatrix('project_photo\ship3.jpg');
    ship4 = createMatrix('project_photo\ship4.jpg');
    ship5 = createMatrix('project_photo\ship5.jpg');
    ship6 = createMatrix('project_photo\ship6.jpg');
    ship7 = createMatrix('project_photo\ship7.jpg');
    ship8 = createMatrix('project_photo\ship8.jpg');

    sub1 = createMatrix('project_photo\sub1.jpg');
    sub2 = createMatrix('project_photo\sub2.jpg');
    sub3 = createMatrix('project_photo\sub3.jpg');
    sub4 = createMatrix('project_photo\sub4.jpg');
    sub5 = createMatrix('project_photo\sub5.jpg');
    sub6 = createMatrix('project_photo\sub6.jpg');
    sub7 = createMatrix('project_photo\sub7.jpg');
    % sub8 = createMatrix('project_photo\sub8.jpg');

    whale1 = createMatrix('project_photo\whale1.jpg');
    whale2 = createMatrix('project_photo\whale2.jpg');
    whale3 = createMatrix('project_photo\whale3.jpg');
    whale4 = createMatrix('project_photo\whale4.jpg');
    whale5 = createMatrix('project_photo\whale5.jpg');
    whale6 = createMatrix('project_photo\whale6.jpg');
    whale7 = createMatrix('project_photo\whale7.jpg');
    whale8 = createMatrix('project_photo\whale8.jpg');

    % Xbear = reshape(generateCentroid(bear1, bear2, bear3, bear4, bear5, bear7, bear8), [1, vectorDimension]);
    % Xelephant = reshape(generateCentroid(elephant1, elephant2, elephant3, elephant4, elephant5, elephant6, elephant7), [1, vectorDimension]);
    % Xfighter = reshape(generateCentroid(fighter1, fighter2, fighter3, fighter4, fighter5, fighter6, fighter7), [1, vectorDimension]);
    % Xpassenger = reshape(generateCentroid(passenger1, passenger2, passenger3, passenger4, passenger5, passenger6, passenger7), [1, vectorDimension]);
    % Xship = reshape(generateCentroid(ship1, ship2, ship3, ship4, ship5, ship6, ship7), [1, vectorDimension]);
    % Xsub = reshape(generateCentroid(sub1, sub2, sub3, sub4, sub5, sub6, sub7), [1, vectorDimension]);
    % Xwhale = reshape(generateCentroid(whale1, whale2, whale3, whale4, whale5, whale6, whale7), [1, vectorDimension]);

    Xbear = reshape(bear1, [1, vectorDimension]);
    Xelephant = reshape(elephant1, [1, vectorDimension]);
    Xfighter = reshape(fighter1, [1, vectorDimension]);
    Xpassenger = reshape(passenger1, [1, vectorDimension]);
    Xship = reshape(ship1, [1, vectorDimension]);
    Xsub = reshape(sub1, [1, vectorDimension]);
    Xwhale = reshape(whale1, [1, vectorDimension]);

	Ybear = 		[1 -1 -1 -1 -1 -1 -1];
	Yelephant = 	[-1 1 -1 -1 -1 -1 -1];
	Yfighter = 		[-1 -1 1 -1 -1 -1 -1];
	Ypassenger = 	[-1 -1 -1 1 -1 -1 -1];
	Yship = 		[-1 -1 -1 -1 1 -1 -1];
	Ysub = 			[-1 -1 -1 -1 -1 1 -1];
	Ywhale = 		[-1 -1 -1 -1 -1 -1 1];

	% Xstored = [Xbear; Xelephant; Xfighter; Xpassenger; Xship; Xsub; Xwhale];
	% Ystored = [Ybear; Yelephant; Yfighter; Ypassenger; Yship; Ysub; Ywhale];

	Xstored = [Xbear; Xelephant];
	Ystored = [Ybear; Yelephant];

	% Weight Matrix Calculation
	W = CalcWeight(Xstored, Ystored);

	% Apply activation function until convergence
	testX = inputX;
	testY = inputY;

	actY = inputY;
	actX = inputX;


	while true
		testY = actY;
		actY = Activation(actX*W, actY);

		testX = actX;
		actX = Activation(actY*W', actX);

		if isequal(testX, actX) && isequal(testY, actY)
			break;
		end
	end
	
	% Convert the 1D vector baack into the matrix representing the image
	outX = reshape(actX, originalDimension);
	outY = actY;

	% imshow(outX);

end

function out = Activation(input, filler)
	out = input;
	threshold = 0;

	for i = 1:length(input)
		if input(:,i) > threshold
			out(:,i) = 1;
		elseif input(:,i) < threshold
			out(:,i) = -1;
		elseif input(:,i) == threshold
			out(:,i) = filler(:,i);
		end
	end
end

function out = CalcWeight(x, y)
	
	output = zeros(size(x,2), size(y,2));

	% NOTE: we are assuming the number of rows in x is equal to the number of rows in y
	for i = 1:size(x,1)
		output = output + x(i,:).' * y(i,:);
	end

	out = output;

end