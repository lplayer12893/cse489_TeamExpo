function out = MaxNet(input) %input is the input vector

numZeros = 0;
maxIndex = 0;


% Add a small (unique) random number to each element in the input vector
number = randi(10,[1,length(input)]);
while 1
    numberUnique = 0;
    
   for i = 1:length(input)
       for j = 1:length(input)
           if number(:,i) == number(:,j) && i ~= j
               number(:,i) = randi(10,1);
               numberUnique = 0;
           else
               numberUnique = numberUnique + 1;
           end
           
       end
   end
   
   if numberUnique == (length(number)*length(number))
       break;
   end
end

for i = 1:length(input)
    
    input(:,i) = input(:,i) + (number(:,i)/100000000000000);
end

outVector = input;

% Calculate the epsilon
epsilon = 1 / (length(input) + 1);

for i = 1:length(input)
    for j = 1:length(input)
        if i ~= j
            outVector(:,i) = outVector(:,i) - (input(:,j) * epsilon);
        end
        
    end
    
    if outVector(:,i) <= 0
        outVector(:,i) = 0;
    end
    
    if outVector(:,i) == 0
        numZeros = numZeros + 1;
    else
        maxIndex = i;
    end
end

% Feed the new output vector back into the function while
% there are still
if numZeros == length(input)-1
    out = maxIndex;
else
    out =  MaxNet(outVector);
end