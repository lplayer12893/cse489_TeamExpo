function A = writeEncodedData()

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_EncodedData.csv';

cprefixes = {'Buy','Wait','Sell'};
csuffix = '_Centroid';

[M,A,conf] = getEncodedData(10);

s = size(M);

for i = 1:s(2)
    writeOutputs(M{i},A{i},[prefixes{i} suffix]);
end

% generalize conf for centroids

%M = cell(size(prefixes));
%A = cell(size(prefixes));

%for k = 1:size(prefixes)
%    [m,a] = readEncodedData([prefixes{k} suffix]);
%    M{k} = m;
%    A{k} = a;
%end

for j = 1:size(cprefixes)
    c = generateCentroid(M,A,conf);
    csvwrite([cprefixes{j} csuffix], c(j,:));
end

A = 0;