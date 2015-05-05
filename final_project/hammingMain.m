function A = hammingMain()
% input is the vector to be classified
% training is the matrix containing the centroids for all the stored objects
% classes is the vector containing the classifications corresponding to the training matrix

M = cell(size(prefixes));
A = cell(size(prefixes));

for k = 1:10
    [m,a] = readEncodedData([prefixes{k} suffix]);
    M{k} = m;
    A{k} = a;
end

buy = csvread([pwd 'Buy_Centroid.csv'], 0, 0);
wait = csvread([pwd 'Wait_Centroid.csv'], 0, 0);
sell = csvread([pwd 'Sell_Centroid.csv'], 0, 0);
training = [buy.' wait.' sell.'];
count = 0;

s = size(M{1});

for k = 1:size(M)
    m = M{k};
    a = A{k};
    for i = 1:s(2)
        n = MaxNet(hammingNet(m,training));
        if(n-1 == a(i))
            count = count + 1;
    end
end

A = count / 64920;