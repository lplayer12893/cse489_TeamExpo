function A = loadCorrelations(n)    % n is the number of bits per parameter

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffixes = {'_Ratios','_InverseRatios'};

correlations = [];

for i = 1:length(prefixes)
    for j = 1:length:suffixes
        correlations = [correlations max(readConf(n,[prefixes(i) suffixes(j)]);
    end
    correlations = [correlations;];
end

A = correlations