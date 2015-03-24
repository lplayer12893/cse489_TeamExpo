function A = hammingMain()
% input is the vector to be classified
% training is the matrix containing the centroids for all the stored objects
% classes is the vector containing the classifications corresponding to the training matrix

% classes = {'ship' 'sub' 'whale'};

ship1 = createMatrix('ship1.jpg');
ship2 = createMatrix('ship2.jpg');
ship3 = createMatrix('ship3.jpg');
ship4 = createMatrix('ship4.jpg');
ship5 = createMatrix('ship5.jpg');
ship6 = createMatrix('ship6.jpg');
ship7 = createMatrix('ship7.jpg');
ship8 = createMatrix('ship8.jpg');

sub1 = createMatrix('sub1.jpg');
sub2 = createMatrix('sub2.jpg');
sub3 = createMatrix('sub3.jpg');
sub4 = createMatrix('sub4.jpg');
sub5 = createMatrix('sub5.jpg');
sub6 = createMatrix('sub6.jpg');
sub7 = createMatrix('sub7.jpg');
sub8 = createMatrix('sub8.jpg');

whale1 = createMatrix('whale1.jpg');
whale2 = createMatrix('whale2.jpg');
whale3 = createMatrix('whale3.jpg');
whale4 = createMatrix('whale4.jpg');
whale5 = createMatrix('whale5.jpg');
whale6 = createMatrix('whale6.jpg');
whale7 = createMatrix('whale7.jpg');
whale8 = createMatrix('whale8.jpg');

ships = generateCentroid(ship1, ship2, ship3, ship4, ship5, ship6, ship7, ship8);
subs = generateCentroid(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8);
whales = generateCentroid(whale1, whale2, whale3, whale4, whale5, whale6, whale7, whale8);
training = [centroidToVector(ships).' centroidToVector(subs).' centroidToVector(whales).'];
count = 0;

% Test Ships
input = centroidToVector(ship1).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship2).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship3).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship4).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship5).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship6).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship7).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

input = centroidToVector(ship8).';
n = MaxNet(hammingNet(input,training));
if(n == 1)
    count = count + 1;
end

% Test Subs
input = centroidToVector(sub1).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub2).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub3).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub4).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub5).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub6).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub7).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

input = centroidToVector(sub8).';
n = MaxNet(hammingNet(input,training));
if(n == 2)
    count = count + 1;
end

% Test Whales
input = centroidToVector(whale1).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale2).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale3).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale4).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale5).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale6).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale7).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

input = centroidToVector(whale8).';
n = MaxNet(hammingNet(input,training));
if(n == 3)
    count = count + 1;
end

A = count / 24;