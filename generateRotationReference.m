function A = generateRotationReference(a,b) % finds the rotation most similar to the current centroid
% a is the size of the reference
% b is the length of the reference
result = zeros(a,b);
for i = 1:a
    for j = 1:b
        if (mod(i,2) == 0)
            result(i,j) = -1;
        else
            result(i,j) = 1;
        end
    end
end

A = result;