function [M, A, conf] = getEncodedData(n) % n is the number of bits per parameter
                                    % M is the set of all 10 stocks' encoded matrices
                                    % A is the set of all 10 stocks' classification matrices

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffix = '_Data.csv';
M = cell(size(prefixes));
A = cell([1,3]);

conf = loadCorrelations(n);
    
for i = 1:length(prefixes)

    file = [[pwd '/Data/' prefixes{i}] suffix];
    [m,a] = readInputs(file);
    
    M{i} = encode(m,n,conf);
    A{i} = a;
end