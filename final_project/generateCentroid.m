function [b,w,e] = generateCentroid(M,A,conf,n) % M is a set of encoded matrices. The 3rd dimension indicates different stocks
                                        % A is the set of classification matrices
                                        % conf is the correlation vector
s = size(conf);
centroids = cell([1,3]);
tmp = [];
tmp2 = [];

longm = [];
longa = [];
% Generalize a single classification from the three classifications
for k = 1:10
    a = A{k};

    newA = sum(a,2);
    for i = 1:length(a)
        if(newA(i) < -1)
            newA(i) = -1;
        elseif(newA(i) > 1)
            newA(i) = 1;
        else
            newA(i) = 0;
        end
    end
    longa = [longa; newA];
end

s = size(longa);

% Generalize the encoded data by generalized classification
sumset = {zeros([1,s(2)]) zeros([1,s(2)]) zeros([1,s(2)])};

for k = 1:10
    m = M{k};
    longm = [longm; m];
end

s = size(longm)

 % number of stock
for j = 1:s(1)
    sumset{longa(j)+2} = sumset{longa(j)+2} + longm(j,:);
end
    
for k = 1:3
    tmp2 = [];
    i = 1;
    while i < s(2)
        t = sumset{k};
        big = 1/3 * max(t);
        test1 = t(1,i+8);
        test2 = t(1,i+9);
        if(test1 >= big)
            if(test2 >= -1 * big)
                pattern = [1,1];
            else
                pattern = [1,-1];
            end
        else
            if(test2 >= -1 * big)
                pattern = [1,-1];
            else
                pattern = [-1,-1];
            end
        end

        tmp = [];
        for p = 1:(conf(k)/2)
            tmp = [tmp pattern];
        end
        tmp2 = [tmp2 zeros([1,n-conf(k)]) tmp];
        i = i+n;
    end
    centroids{k} = tmp2;
end

b = centroids{1};
w = centroids{2};
e = centroids{3};