function A = hammingMain(input,training,classes)
% input is the vector to be classified
% training is the matrix containing the centroids for all the stored objects
% classes is the vector containing the classifications corresponding to the training matrix
n = MaxNet(hammingNet(input,training));

A = classes(n);