function [M, A] = readInputs(file)

usage = {'USAGE: readInputs(file)';'* file is the path to the csv file'};
if(exist(file) == 0)
disp(usage);
return
end
disp('Creating Matrix');

%reads the input file and it separtes the data and classification
read = csvread(file, 1, 1);
y = read(:,1:14);
z= read(:,18:size(read,2));
M = [y z];
A= read(:,15:17);


