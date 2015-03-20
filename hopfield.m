function vector = hopfield(input, weight)
%{usage: input a vector and weight matrix and it returns the output vector}

%generates the unique number
number = randi(length(input),[1,length(input)]) ;

%uses the previous code from hammingmax to makesure the random number
%generated is unique
while 1
    numberUnique = 0;
    
   for i = 1:length(input)
       for j = 1:length(input)
           if number(:,i) == number(:,j) && i ~= j
               number(:,i) = randi(length(input),1);
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

%uses the algorithm from book to calculate the outputvector
   for i = 1:length(input)
        
      x= number(:,i)      
      y = input(x);
         for j = 1:length(input)
           
             w(j)= y + weight(j,x);
         end
         wnew = sum(w);
     y_in= y + wnew;
     
     if y_in > 0
         input(x) = 1;
     else
         input(x) = 0;
     end
     
   end
   %pritns the output vector
   vector = input;
   
