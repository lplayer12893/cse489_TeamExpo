function A = generateCentroid(varargin) % accepts multiple matrices of the same size and length as a parameter
                                
usage = {'USAGE: generateCentroid(matrix1, matrix2, ...)';'* matrix# is a matrix as generated by createMatrix'};
fprintf('Total number of input matrices = %d\n',nargin);

nVarargs = length(varargin);
centroid = varargin{1};
for i = 2: nVarargs
	centroid = centroid + varargin{i};
end

sensitivity = 1; % Value corresponding to the threshold required for a value in the centroid to be non-ambiguous
count = 0;

for j = 1:size(centroid)
	for k = 1:length(centroid)
        if(centroid(j,k) >= (8 * sensitivity) && centroid(j,k) <= (-8 * sensitivity))    % If the centroid value is ambiguous
        %if(centroid(j,k) == 0)
			%r1 = rand(1);
            count = count + 1;
            %if(r1 >= 0.5)
            %    centroid(j,k) = 1;
            %else
            %    centroid(j,k) = -1;
            %end 
            %centroid(j,k) = 0;  % Ambiguous values will not be considered in the classification algorithm
        elseif(centroid(j,k) > -2 * sensitivity) % if images have the same white value, it is white in the centroid
			centroid(j,k) = 1;
		else
			centroid(j,k) = -1;
        end
	end
end

temp = size(centroid);

%average = mean2(centroid)
p_ambiguous = count / (temp(1) * length(centroid)) * 100

A = centroid;