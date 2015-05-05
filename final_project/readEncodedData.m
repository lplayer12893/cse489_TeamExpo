function [M, A] = readEncodedData(file)

usage = {'USAGE: readInputs(file)';'* file is the path to the csv file'};
if(exist(file) == 0)
    disp(usage);
    return
end
disp('Creating Matrix');

%reads the input file and it separates the data and classification
read = csvread(file, 0, 0);
M = read(:,1:520);
A = read(:,521:523);