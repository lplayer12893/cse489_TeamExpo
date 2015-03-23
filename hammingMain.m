function A = hammingMain(x,training,classes)
% x is the vector to be classified
% training is the matrix containing the centroids for all the stored objects
% classes is the vector containing the classifications corresponding to the training matrix
n = MaxNet(hammingNet(x,training));

A = classes(n);