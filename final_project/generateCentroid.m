function R = generateCentroid(M,A,corr) % M is a set of encoded matrices. The 3rd dimension indicates different stocks
                                        % A is the set of classification matrices
                                        % corr is the correlation vector
s = size(M);

% Generalize a single classification from the three classifications
newA = sum(A,2);
for i = 1:length(A)
    if(newA(i) < -1)
        newA(i) = -1;
    elseif(newA(i) > 1)
        newA(i) = 1;
    else
        newA(i) = 0;
    end
end

% Generalize the encoded data by generalized classification
sumset = [zeros([1,s(2)]) zeros([1,s(2)]) zeros([1,s(2)])];

for k = 1:s(3)
    for j = 1:s(1)
        sumset(newA(j)+2) = sumset(newA(j)+2) + M(:,j,k);
    end
end

for k = 1:3
    for i = 1:s(2):10
        if(sumset(k, % sTART HERE

    tmp = [];
    for p = 1:(conf(k)/2)
        tmp = [tmp pattern];
    end
    result = [result zeros([1,n-conf(k)]) tmp];
end

R = centroid;