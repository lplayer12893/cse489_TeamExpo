function [outX, outY] = BAM(inputX, inputY, buyCent, sellCent, holdCent)
	% Usage: 
	% 	inputX: the encoded image
	% 	inputY: the encoded key value
	% 	NOTE: Either inputX or inputY can be all zeros
	% 
	% 	outX: the output image
	% 	outY: the output key value


	% Turn the input image into a 1D vector
	vectorDimension = size(inputX, 1) * size(inputX, 2);
	originalDimension = size(inputX);
	inputX = reshape(inputX, [1, vectorDimension]);

    Xbuy = reshape(buyCent, [1, vectorDimension]);
    Xsell = reshape(sellCent, [1, vectorDimension]);
    Xhold = reshape(holdCent, [1, vectorDimension]);

	Ybuy =     [1 1 1];
	Ysell =    [-1 -1 -1];
	Yhold =    [1 -1 1];

	Xstored = [Xbuy; Xsell; Xhold];
	Ystored = [Ybuy; Ysell; Yhold];

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

		% Check for convergence
		if isequal(testX, actX) && isequal(testY, actY)
			break;
		end
	end
	
	% Convert the 1D vector baack into the matrix representing the image
	outX = reshape(actX, originalDimension);
	outY = actY;

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

	% NOTE: we are assuming the number of rows in x is equal to the number of rows in y.
	% This should always be true when the network is being used as intended.
	for i = 1:size(x,1)
		output = output + x(i,:).' * y(i,:);
	end

	out = output;

end