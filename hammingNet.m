function A = hammingNet(x,t) % x is the input vector
                                 % t is the training matrix
hammingDist = @(a,b)sum(a(:)~=b(:));

result = [];

for i = 1:5
    result = [result (length(x) - hammingDist(x,t(:,i)))];
end

A = result;