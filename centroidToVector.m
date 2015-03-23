function A = centroidToVector(m) % m is the input centroid as a matrix

result = [];

for i = 1:length(m)
    for j = 1:size(m)
        result = [result m(i,j)];
    end
end

A = result;