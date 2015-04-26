function A = test()

[m,a] = readInputs('C:\Users\lstuyves\Documents\GitHub\cse489_TeamExpo\final_project\data\LUV_Data.csv');
conf = csvread('C:\Users\lstuyves\Documents\GitHub\cse489_TeamExpo\final_project\data\LUV_Ratios.csv');
n = 10;

conf = 2 * round(0.66 * conf * n / 2);

result = encode(m,n,conf);

writeOutputs(result,a);

A = result;