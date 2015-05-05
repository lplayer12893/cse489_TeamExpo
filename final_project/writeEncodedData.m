function A = writeEncodedData()

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_EncodedData.csv';

cprefixes = {'Buy','Wait','Sell'};
csuffix = '_Centroid.csv';

%[M,A,conf] = getEncodedData(10);
%
%s = size(M);
%
%for i = 1:s(2)
%    writeOutputs(M{i},A{i},[prefixes{i} suffix]);
%end

% generalize conf for centroids
conf = loadCorrelations(10);

M = cell(size(prefixes));
A = cell(size(prefixes));

for k = 1:10
    [m,a] = readEncodedData([prefixes{k} suffix]);
    M{k} = m;
    A{k} = a;
end

cent = generateCentroid(M,A,conf,10);
size(cent)

for j = 1:3
    c  = cent{j};
    csvwrite([cprefixes{j} csuffix], c);
end

A = 0;