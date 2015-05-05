function [Buy, Sell, Wait] = readCentroids()

disp('Creating Matrix');

Buy = csvread('Buy_Centroid.csv');
Sell = csvread('Buy_Centroid.csv');
Wait = csvread('Buy_Centroid.csv');