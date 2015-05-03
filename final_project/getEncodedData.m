function [M, A] = getEncodedData(n) % n is the number of bits per parameter

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_Data.csv';
M = [];
A = [];

for i = 1:length(prefixes)

    file = [[pwd '/Data/' prefixes{i}] suffix];
    [m,a] = readInputs(file);

    corrs = loadCorrelations(n);

    M = [M encode(m,n,corrs);];
    A = [A a;];
end