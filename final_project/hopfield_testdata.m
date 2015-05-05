% a= test();
% newa1= b(:);
% aweight = newa1*newa1.';
% 
% tic;
% 
% data = testhop(newa1, aweight);
% toc
% % data= testhop(newwb8, animalweight);
% vesi=length(data);

aapl = csvread('AAPL_EncodedData.csv');
ahs = csvread('AHS_EncodedData.csv');
amd = csvread('AMD_EncodedData.csv');

a1 =aapl(1,:);
a2 =aapl(2,:);
a3 =aapl(3,:);

newa3= a3(:);
[buy, sell, wait] = readCentroids();

newbuy= buy(:);
newsell = sell(:);
newwait = wait(:);
% 
% prefixes = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
% suffix = '_EncodedData.csv';
% 
% M = cell(size(prefixes));
% A = cell([1,3]);
% 
% for i = 1:length(prefixes)
% 
%     file = [prefixes{i} suffix];
%     [z,f] = readEncodedData(file);
%     M{i} =z;
%     A{i} =f;
% end


cenweight = newbuy*newbuy.' + newsell*newsell.' + newwait*newwait.'; 

tic; 
data = hopfield(newa3, cenweight);
toc
vesi=length(data);
hamd= hammingDist(data, newa3);
Accrate1= ((vesi - hamd)/vesi)



% 
% x=[newbuy, newsell, newwait];
% t= [1 0 0; 0 2 0; 0 0 3];
% y= neulvq(x,t);
