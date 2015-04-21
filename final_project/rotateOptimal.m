function A = rotateOptimal(b,ref) % finds the rotation according to the rotation reference
% b is the matrix to be tested or added to the centroid, and must be optimally rotated
% ref is the rotation reference
s = size(b);
temp = b;
min = hammingDist(ref(:),b(:));
n = 0;
for i = 0:35
    temp = imrotate(b,i*10,'bilinear','crop');
    n = hammingDist(ref(:),temp(:));
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