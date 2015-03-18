function [outX, outY] = BAM(inputX, inputY)
	% Stored Vectors
	Xa = [-1 1 -1 1 -1 1 1 1 1 1 -1 1 1 -1 1];
	Xc = [-1 1 1 1 -1 -1 1 -1 -1 1 -1 -1 -1 1 1];

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