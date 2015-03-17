function A = createMatrix(file) % file is the path to the image
                                
usage = {'USAGE: createMatrix(file)';'* file is the path to the image'};

if(exist(file) == 0)
	disp(usage);
	return
end

I = imread(file);	% read in image
I = imresize(I, [768, 1024]);	% resize image to desired size
I = rgb2gray(I);	% convert to grayscale
BW = edge(I);	% find edges. Edges are denoted with 1, non-edges are 0

X = double(BW)
for i = 1:size(X)	% convert to binary bipolar matrix
	for j = 1:length(X)
		if(X(i,j) == 0)
			X(i,j) = -1;
		end
	end
end

A = X;