function [ y ] = neulvq( input, centroid )
%NEULVQ Summary of this function goes here
<<<<<<< HEAD
=======
% where centroid is classification for input vectors
>>>>>>> origin/master
%   Detailed explanation goes here
% uses the similar code from lab 2.
net = lvqnet(10);
[net, tr] = train(net,input, centroid);
y = net(b1);
%displays useful information about network
view(net);
plotperform(tr);
plottrainstate(tr);
ploterrhist(net);
plotroc(input, y);
plotconfusion(input, y);
end

