function A = hammingNet(x,t) % x is the input vector
                                 % t is the training matrix
result = [];

for i = 1:3
    result = [result (length(x) - hammingDist(x,t(:,i)))];
end

A = result