function A = loadCorrelations(n)    % n is the number of bits per parameter

prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
suffixes = {'_Ratios.csv','_InverseRatios.csv'};

correlations = [];

for i = 1:length(prefixes)
    
    fileD = [[pwd '/Data/' prefixes{i}] suffixes{1}];
    fileI = [[pwd '/Data/' prefixes{i}] suffixes{2}];
    
    if(i == 1)
        correlations = [max(readConf(n,fileD),readConf(n,fileI))];
    else
        correlations = [correlations; max(readConf(n,fileD),readConf(n,fileI))];
    end    

end

s = size(correlations);

sumset = sum(correlations,1);
sumset = sumset / s(1);
sumset = round(sumset/2) * 2;

A = sumset;