function A = rotateOptimal(b) % finds the rotation according to the rotation reference
% b is the matrix to be tested or added to the centroid, and must be optimally rotated
s = size(b);
a = generateRotationReference(s(1),length(b));
temp = b;
min = hammingDist(a(:),b(:));
n = 0;
for i = 0:35
    temp = imrotate(b,i*10,'bilinear','crop');
    n = hammingDist(a(:),temp(:));
    if(n < min)
        min = temp;
    end
end

for j = 1:(s(1)*s(2))
    if(min(j) > 0)
        min(j) = 1;
    else
        min(j) = -1;
    end
end
A = min;