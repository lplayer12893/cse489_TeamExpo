function [outX, outY] = BAM(inputX, inputY)
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
    sub8 = createMatrix('project_photo\sub8.jpg');

    whale1 = createMatrix('project_photo\whale1.jpg');
    whale2 = createMatrix('project_photo\whale2.jpg');
    whale3 = createMatrix('project_photo\whale3.jpg');
    whale4 = createMatrix('project_photo\whale4.jpg');
    whale5 = createMatrix('project_photo\whale5.jpg');
    whale6 = createMatrix('project_photo\whale6.jpg');
    whale7 = createMatrix('project_photo\whale7.jpg');
    whale8 = createMatrix('project_photo\whale8.jpg');

    Xbear = generateCentroid(bear1, bear2, bear3, bear4, bear5, bear7, bear8);
    Xelephant = generateCentroid(elephant1, elephant2, elephant3, elephant4, elephant5, elephant6, elephant7, elephant8);
    Xfighter = generateCentroid(fighter1, fighter2, fighter3, fighter4, fighter5, fighter6, fighter7, fighter8);
    Xpassenger = generateCentroid(passenger1, passenger2, passenger3, passenger4, passenger5, passenger6, passenger7, passenger8);
    Xship = generateCentroid(ship1, ship2, ship3, ship4, ship5, ship6, ship7, ship8);
    Xsub = generateCentroid(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8);
    Xwhale = generateCentroid(whale1, whale2, whale3, whale4, whale5, whale6, whale7, whale8);

	Ya = [-1 1];
	Yc = [1 1];

	Xstored = [Xa; Xc];
	Ystored = [Ya; Yc];

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
	

	outX = actX;
	outY = actY;

end

function out = Activation(input, filler)
	out = input;

	for i = 1:length(input)
		if input(:,i) > 0
			out(:,i) = 1;
		elseif input(:,i) < 0
			out(:,i) = -1;
		elseif input(:,i) == 0
			out(:,i) = filler(:,i);
		end
	end
end

function out = CalcWeight(x, y)
	out = zeros(size(x,2), size(y,2));

	% NOTE: we are assuming the number of rows in x is equal to the number of rows in y
	for i = 1:size(x,1)
		in1 = x(i,:);
		in2 = y(i,:);

		tempOut = zeros(length(in1), length(in2));

		for i = 1:length(in1)
			for j = 1:length(in2)
				tempOut(i, j) = in1(i) * in2(j);
			end
		end

		out = out + tempOut;
	end

end