function A = createMatrix(file,ref)
% file is the path to the image
% ref is the rotation reference                                
usage = {'USAGE: createMatrix(file)';'* file is the path to the image'};

if(exist(file) == 0)
	disp(usage);
	return
end
disp('Creating Matrix');

rdim = size(ref);
block_size = 4;

I = imread(file);	% read in image
I = imresize(I, [rdim(1), rdim(2)]);	% resize image to desired size
I = rgb2gray(I);	% convert to grayscale
BW = edge(I);	% find edges. Edges are denoted with 1, non-edges are 0

X = double(BW);
for i = 1:size(X)	% convert to binary bipolar matrix
	for j = 1:length(X)
		if(X(i,j) == 0)
			X(i,j) = -1;
		end
	end
end

if(ref == zeros(rdim(1),rdim(2)))
	disp('Warning: Empty reference passed');
    result = X;
else
    temp = rotateOptimal(X,ref);	% rotate to a standard angle according to provided reference
	result = zeros(96,128);
	for i = 1:block_size:size(X)		% generalizes the matrix
		for j = 1:block_size:length(X)
			n = sum(temp(i:i+block_size-1,j:j+block_size-1));
			if((n <= 2) & (n >= -2))
				result(ceil(i/block_size),ceil(j/block_size)) = 0;
			elseif(n < -2)
				result(ceil(i/block_size),ceil(j/block_size)) = -1;
			else
				result(ceil(i/block_size),ceil(j/block_size)) = 1;
			end
		end
	end	
end

A = result;