a= test();
newa1= b(:);
aweight = newa1*newa1.';

tic;

data = testhop(newa1, aweight);
toc
% data= testhop(newwb8, animalweight);
vesi=length(data);