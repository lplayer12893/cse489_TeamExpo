function A = writeEncodedData()

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_EncodedData.csv';

cprefixes = {'Buy','Wait','Sell'};
csuffix = '_Centroid';

[M,A,conf] = getEncodedData(10);

s = size(M)

for i = 1:s(2)
    writeOutputs(M{i},A{i},[prefixes{i} suffix]);
end

c = generateCentroid(M,A,conf);

s2 = size(c)

for j = 1:s2(2)
    csvwrite([cprefixes{j} csuffix], c(i,:));
end

A = result;