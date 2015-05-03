function A = readConf(n,filename) % n is the number of bits per parameter

conf = csvread(filename);
conf = conf * (n-2) + 2;

A = conf;