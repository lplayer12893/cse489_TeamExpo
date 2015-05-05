function [M, A] = readEncodedData(file)

usage = {'USAGE: readInputs(file)';'* file is the path to the csv file'};
if(exist(file) == 0)
    disp(usage);
    return
end
disp('Creating Matrix');

%reads the input file and it separates the data and classification
read = csvread(file, 0, 0);
s = size(read);
M = read(:,1:s(2)-3);
A = read(:,s(2)-2:s(2));