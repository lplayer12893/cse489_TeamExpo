function A = generateCentroid(varargin) % accepts multiple matrices of the same size and length as a parameter
                                
usage = {'USAGE: generateCentroid(matrix1, matrix2, ...)';'* matrix# is a matrix as generated by createMatrix'};
fprintf('Total number of input matrices = %d\n',nargin);

nVarargs = length(varargin);
centroid = varargin{1};
for i = 2: nVarargs
	centroid = centroid + varargin{i};
end

for j = 1:size(centroid)
	for k = 1:length(centroid)
		if(centroid(j,k) >= (1 - nVarargs)) % if images have the same white value, it is white in the centroid
			centroid(j,k) = 1;
		else
			centroid(j,k) = -1;
		end
	end
end

A = centroid;