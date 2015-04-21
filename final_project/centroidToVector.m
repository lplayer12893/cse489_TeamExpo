function A = centroidToVector(cent_mat) % cent_mat is the input centroid as a matrix

result = [];

for i = 1:size(cent_mat)
    for j = 1:length(cent_mat)
        result = [result cent_mat(i,j)];
    end
end

A = result;