function [x,y] = maxIndexOfMatrix(temp)

[rr,cc] = size(temp);
maximum = temp(1,1);

for i=1:rr
    for j=1:cc
        if temp(i,j)> maximum
            x = j;
            y = i;
        end
    end
end
end