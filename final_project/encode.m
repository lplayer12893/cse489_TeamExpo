function A = encode(m,n,conf)
% m is the input matrix of parameters
% n is the size of each parameter's encoding
% conf is a list of non-zero sizes to correspond with the weights of the parameters

result = [];
tmp = [];
undecided = [false,0];

% Day 1 encoding defaults to wait
pattern = [1,-1];
s = size(m);
for k = 1:s(2)
    tmp = [];
    for p = 1:(conf(k)/2)
        tmp = [tmp pattern];
    end
    result = [result zeros([1,n-conf(k)]) tmp];
end

for i = 1:s(1)-3
    tmp2 = [];
    for j = 1:s(2)
        d1 = abs(m(i+1,j)) - abs(m(i,j));
        d2 = abs(m(i+2,j)) - abs(m(i+1,j));
        d3 = abs(m(i+3,j)) - abs(m(i+2,j));
        
        if(abs(d1) <= abs(m(i,j)*0.01))  % if no change
            d1 = 0;
        elseif(d1 < 0)  % if negative change
            d1 = -1;
        elseif(d1 > 0) % if positive change
            d1 = 1;
        end
        
        if(abs(d2) <= abs(m(i+1,j)*0.01))  % if no change
            d2 = 0;
        elseif(d2 < 0)  % if negative change
            d2 = -1;
        elseif(d2 > 0) % if positive change
            d2 = 1;
        end
        
        if(abs(d3) <= abs(m(i+2,j)*0.01))  % if no change
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
                                undecided(1) = false;
                            case 0
                                pattern = [1,-1];
                                undecided(1) = false;
                            case 1
                                pattern = [1,-1];
                                undecided(1) = false;
                        end 
                    case 0
                        switch d3
                            case -1
                                pattern = [1,-1];
                                undecided(1) = false;
                            case 0
                                undecided(1) = true;
                                undecided(2) = d1;
                            case 1
                                pattern = [-1,-1];
                                undecided(1) = false;
                        end 
                    case 1
                        switch d3
                            case -1
                                pattern = [-1,-1];
                                undecided(1) = false;
                            case 0
                                pattern = [-1,-1];
                                undecided(1) = false;
                            case 1
                                pattern = [-1,-1];
                                undecided(1) = false;
                        end 
                end  
            case 0
		        if(undecided(1))
			        d0 = undecided(2);

                    switch d0
                        case -1
                            switch d3
                                case -1
                                    pattern = [1,-1];
                                case 0
                                    undecided(1) = true;
                                case 1
                                    pattern = [-1,-1];
                            end
                        case 1
                            switch d3
                                case -1
                                    pattern = [1,1];
                                case 0
                                    undecided(1) = true;
                                case 1
                                    pattern = [1,-1]
                            end
                    end

                    tmp = [];
                    for p = 1:(conf(j)/2)
                        tmp = [tmp pattern];
                    end
                    tmp2 = [tmp2 zeros([1,n-conf(j)]) tmp];

                    result = [result;tmp2];
		        end
                pattern = [1,-1];
            case 1
                switch d2
                    case -1
                        switch d3
                            case -1
                                pattern = [1,1];
                                undecided(1) = false;
                            case 0
                                pattern = [1,1];
                                undecided(1) = false;
                            case 1
                                pattern = [1,1];
                                undecided(1) = false;
                        end 
                    case 0
                        switch d3
                            case -1
                                pattern = [1,1];
                                undecided(1) = false;
                            case 0
                                undecided(1) = true;
                                undecided(2) = d1;
                            case 1
                                pattern = [1,-1];
                                undecided(1) = false;
                        end 
                    case 1
                        switch d3
                            case -1
                                pattern = [1,-1];
                                undecided(1) = false;
                            case 0
                                pattern = [1,-1];
                                undecided(1) = false;
                            case 1
                                pattern = [1,-1];
                                undecided(1) = false;
                        end
                end 
        end
        
        if(~undecided(1))
            tmp = [];
            for p = 1:(conf(j)/2)
                tmp = [tmp pattern];
            end
            tmp2 = [tmp2 zeros([1,n-conf(j)]) tmp];
        end

    end
    if(~undecided(1))
        result = [result;tmp2];
    end
end

if(undecided(1))    % if 3rd to last day was undecided, defaults to wait
    pattern = [-1,1];

    tmp = [];
    for p = 1:(conf(j)/2)
        tmp = [tmp pattern];
    end
    tmp2 = [tmp2 zeros([1,n-conf(j)]) tmp];

    result = [result;tmp2];
end


% 2nd to last day encoding defaults to wait
pattern = [1,-1];
tmp2 = [];
for k = 1:s(2)
    tmp = [];
    for p = 1:(conf(k)/2)
        tmp = [tmp pattern];
    end
    tmp2 = [tmp2 zeros([1,n-conf(k)]) tmp];
end
result = [result;tmp2];

% Last encoding defaults to wait
pattern = [1,-1];
tmp2 = [];
for k = 1:s(2)
    tmp = [];
    for p = 1:(conf(k)/2)
        tmp = [tmp pattern];
    end
    tmp2 = [tmp2 zeros([1,n-conf(k)]) tmp];
end
result = [result;tmp2];

A = result;
