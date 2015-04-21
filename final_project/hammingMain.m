function A = hammingMain()
% input is the vector to be classified
% training is the matrix containing the centroids for all the stored objects
% classes is the vector containing the classifications corresponding to the training matrix

% classes = {'ship' 'sub' 'whale'};
ref = generateRotationReference(384,512);

ship1 = createMatrix('ship1.jpg',ref);
ship2 = createMatrix('ship2.jpg',ref);
ship3 = createMatrix('ship3.jpg',ref);
ship4 = createMatrix('ship4.jpg',ref);
ship5 = createMatrix('ship5.jpg',ref);
ship6 = createMatrix('ship6.jpg',ref);
ship7 = createMatrix('ship7.jpg',ref);
ship8 = createMatrix('ship8.jpg',ref);

sub1 = createMatrix('sub1.jpg',ref);
sub2 = createMatrix('sub2.jpg',ref);
sub3 = createMatrix('sub3.jpg',ref);
sub4 = createMatrix('sub4.jpg',ref);
sub5 = createMatrix('sub5.jpg',ref);
sub6 = createMatrix('sub6.jpg',ref);
sub7 = createMatrix('sub7.jpg',ref);
sub8 = createMatrix('sub8.jpg',ref);

whale1 = createMatrix('whale1.jpg',ref);
whale2 = createMatrix('whale2.jpg',ref);
whale3 = createMatrix('whale3.jpg',ref);
whale4 = createMatrix('whale4.jpg',ref);
whale5 = createMatrix('whale5.jpg',ref);
whale6 = createMatrix('whale6.jpg',ref);
whale7 = createMatrix('whale7.jpg',ref);
whale8 = createMatrix('whale8.jpg',ref);

ships = generateCentroid(ship1, ship2, ship3, ship4, ship5, ship6, ship7, ship8);
subs = generateCentroid(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8);
whales = generateCentroid(whale1, whale2, whale3, whale4, whale5, whale6, whale7, whale8);

training = [centroidToVector(ships).' centroidToVector(subs).' centroidToVector(whales).'];
count = 0;

shiptest = createMatrix('shiptest.jpg',ref);
shiptest2 = createMatrix('shiptest2.jpg',ref);
shiptest3 = createMatrix('shiptest3.jpg',ref);
shiptest4 = createMatrix('shiptest4.jpg',ref);
shiptest5 = createMatrix('shiptest5.jpg',ref);
subtest1 = createMatrix('subtest1.jpg',ref);
subtest2 = createMatrix('subtest2.jpg',ref);
subtest3 = createMatrix('subtest3.jpg',ref);
subtest4 = createMatrix('subtest4.jpg',ref);
subtest5 = createMatrix('subtest5.jpg',ref);
whaletest1 = createMatrix('whaletest1.jpg',ref);
whaletest2 = createMatrix('whaletest2.jpg',ref);
whaletest3 = createMatrix('whaletest3.jpg',ref);
whaletest4 = createMatrix('whaletest4.jpg',ref);
whaletest5 = createMatrix('whaletest5.jpg',ref);
input1 = centroidToVector(shiptest).';
input2 = centroidToVector(shiptest2).';
input3 = centroidToVector(shiptest3).';
input4 = centroidToVector(shiptest4).';
input5 = centroidToVector(shiptest5).';
input6 = centroidToVector(subtest1).';
input7 = centroidToVector(subtest2).';
input8 = centroidToVector(subtest3).';
input9 = centroidToVector(subtest4).';
input10 = centroidToVector(subtest5).';
input11 = centroidToVector(whaletest1).';
input12 = centroidToVector(whaletest2).';
input13 = centroidToVector(whaletest3).';
input14 = centroidToVector(whaletest4).';
input15 = centroidToVector(whaletest5).';
n = MaxNet(hammingNet(input1,training));
if(n == 1)
    count = count + 1;
end
n = MaxNet(hammingNet(input2,training));
if(n == 1)
    count = count + 1;
end
n = MaxNet(hammingNet(input3,training));
if(n == 1)
    count = count + 1;
end
n = MaxNet(hammingNet(input4,training));
if(n == 1)
    count = count + 1;
end
n = MaxNet(hammingNet(input5,training));
if(n == 1)
    count = count + 1;
end
disp(count);
%
n = MaxNet(hammingNet(input6,training));
if(n == 2)
    count = count + 1;
end
n = MaxNet(hammingNet(input7,training));
if(n == 2)
    count = count + 1;
end
n = MaxNet(hammingNet(input8,training));
if(n == 2)
    count = count + 1;
end
n = MaxNet(hammingNet(input9,training));
if(n == 2)
    count = count + 1;
end
n = MaxNet(hammingNet(input10,training));
if(n == 2)
    count = count + 1;
end
disp(count);
%
n = MaxNet(hammingNet(input11,training));
if(n == 3)
    count = count + 1;
end
n = MaxNet(hammingNet(input12,training));
if(n == 3)
    count = count + 1;
end
n = MaxNet(hammingNet(input13,training));
if(n == 3)
    count = count + 1;
end
n = MaxNet(hammingNet(input14,training));
if(n == 3)
    count = count + 1;
end
n = MaxNet(hammingNet(input15,training));
if(n == 3)
    count = count + 1;
end
disp(count);
A = count / 15
return;
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

%A = count / 24;