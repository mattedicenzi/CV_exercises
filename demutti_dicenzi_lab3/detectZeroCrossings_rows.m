function ZC = detectZeroCrossings_rows(cImg, threshold)
ZC = zeros(size(cImg));
[rr,cc] = size(cImg);

for i=1:rr
    for j=1:cc-1
       if (cImg(i,j)<0 && cImg(i,j+1)>0) || (cImg(i,j)>0 && cImg(i,j+1)<0)
           ZC(i,j) = (abs(cImg(i,j+1)-cImg(i,j)) >= threshold);
       end
       if j > 1 && (cImg(i,j) == 0) && ...
               (((cImg(i,j-1) < 0) && (cImg(i,j+1) > 0)) || ...
               ((cImg(i,j-1) > 0) && (cImg(i,j+1) < 0)))
           ZC(i,j) = (abs(cImg(i,j+1)-cImg(i,j-1)) >= threshold);
       end
    end
end
end