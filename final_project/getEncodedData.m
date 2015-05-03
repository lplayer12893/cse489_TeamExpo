function [M, A] = getEncodedData(n) % n is the number of bits per parameter

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_Data';
M = [];
A = [];
for i = 1:length(prefixes)
    [m,a] = readInputs([prefixes(i) suffix]);

    corrs = loadCorrelations(n);

    M = [M encode(m,n,corrs(i));];
    A = [A a;];
end