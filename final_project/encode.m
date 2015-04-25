function A = encode(m,n,conf)
% m is the input matrix of parameters
% n is the size of each parameter's encoding
% conf is a list of non-zero sizes to correspond with the weights of the parameters

result = [];
tmp = [];

% Day 1 encoding defaults to wait
pattern = [1,-1];
for k = 1:length(m)
    for p = 1:(conf(k)/2)
        tmp = [tmp pattern];
    end
    result = [result zeros([1,n-conf(k)]) tmp];
end

for i = 1:size(m)
    for j = 1:length(m)
        d1 = abs(m(1i+1,j)) - abs(m(1i,j));
        d2 = abs(m(1i+2,j)) - abs(m(1i+1,j));
        d3 = abs(m(1i+3,j)) - abs(m(1i+2,j));
        
        if(abs(d1) <= abs(m(1i,j)*0.01))  % if no change
            d1 = 0;
        elseif(d1 < 0)  % if negative change
            d1 = -1;
        elseif(d1 > 0) % if positive change
            d1 = 1;
        end
        
        if(abs(d2) <= abs(m(1i+1,j)*0.01))  % if no change
            d2 = 0;
        elseif(d2 < 0)  % if negative change
            d2 = -1;
        elseif(d2 > 0) % if positive change
            d2 = 1;
        end
        
        if(abs(d3) <= abs(m(1i+2,j)*0.01))  % if no change
            d3 = 0;
        elseif(d3 < 0)  % if negative change
            d3 = -1;
        elseif(d3 > 0) % if positive change
            d3 = 1;
        end
        
        pattern = [-1,1]; % [1,1] is sell, [-1,-1] is buy, [1,-1] is wait, and [-1,1] is uncertain
        
        switch d1
            case -1
                switch d2
                    case -1
                        switch d3
                            case -1
                                pattern = [1,-1];
                            case 0
                                pattern = [1,-1];
                            case 1
                                pattern = [1,-1];
                        end 
                    case 0
                        switch d3
                            case -1
                                pattern = [1,-1];
                            case 0
                                pattern = [-1,1];
                            case 1
                                pattern = [-1,-1];
                        end 
                    case 1
                        switch d3
                            case -1
                                pattern = [-1,-1];
                            case 0
                                pattern = [-1,-1];
                            case 1
                                pattern = [-1,-1];
                        end 
                end  
            case 0
                pattern = [1,-1]; 
            case 1
                switch d2
                    case -1
                        switch d3
                            case -1
                                pattern = [1,1];
                            case 0
                                pattern = [1,1];
                            case 1
                                pattern = [1,1];
                        end 
                    case 0
                        switch d3
                            case -1
                                pattern = [1,1];
                            case 0
                                pattern = [-1,1];
                            case 1
                                pattern = [1,-1];
                        end 
                    case 1
                        switch d3
                            case -1
                                pattern = [1,-1];
                            case 0
                                pattern = [1,-1];
                            case 1
                                pattern = [1,-1];
                        end
                end 
        end

        tmp = [];
        for p = 1:(conf(j)/2)
            tmp = [tmp pattern];
        end
        result = [result zeros([1,n-conf(j)]) tmp];

    end
end

A = result;