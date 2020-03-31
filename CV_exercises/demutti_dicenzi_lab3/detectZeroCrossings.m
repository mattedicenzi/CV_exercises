function ZC = detectZeroCrossings(cImg, treshold)

% Default treshold = 0
if (nargin < 2)
   treshold = 0; 
end

ZC_rows = zeros(size(cImg));
ZC_col = ZC_rows';
[rr,cc] = size(cImg);

for i=1:rr
    for j=1:cc-1
       if (cImg(i,j)<0 && cImg(i,j+1)>0) || (cImg(i,j)>0 && cImg(i,j+1)<0)
           ZC_rows(i,j) = (abs(cImg(i,j+1)-cImg(i,j)) >= treshold);
       end
       if j > 1 && (cImg(i,j) == 0) && ...
               (((cImg(i,j-1) < 0) && (cImg(i,j+1) > 0)) || ...
               ((cImg(i,j-1) > 0) && (cImg(i,j+1) < 0)))
           ZC_rows(i,j) = (abs(cImg(i,j+1)-cImg(i,j-1)) >= treshold);
       end
    end
end

cImg = cImg';
[rr,cc] = size(cImg); 

for i=1:rr
    for j=1:cc-1
       if (cImg(i,j)<0 && cImg(i,j+1)>0) || (cImg(i,j)>0 && cImg(i,j+1)<0)
           ZC_col(i,j) = (abs(cImg(i,j+1)-cImg(i,j)) >= treshold);
       end
       if j > 1 && (cImg(i,j) == 0) && ...
               (((cImg(i,j-1) < 0) && (cImg(i,j+1) > 0)) || ...
               ((cImg(i,j-1) > 0) && (cImg(i,j+1) < 0)))
           ZC_col(i,j) = (abs(cImg(i,j+1)-cImg(i,j-1)) >= treshold);
       end
    end
end

ZC = ZC_rows | (ZC_col');

end