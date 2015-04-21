function A = hammingDist(a,b) % a and b are vectors of equal sizes

result = 0;
for i = 1:size(a)
    if(a(i,1) ~= b(i,1))
        if(a(i,1) ~= 0 && b(i,1) ~= 0)
            result = result + 1;
        end
    end
end

A = result;