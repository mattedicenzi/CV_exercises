% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

% The function is used to detect the zero crossings of an image scanning 
% the rows, given an image already convolved with a LoG. It is possible to 
% pass a threshold to avoid weak zero crossings.
% Input: convolved Image, threshold
% Output: binary image, with '1' in correspondance of the zero crossings

function ZC = detectZeroCrossings_rows(cImg, threshold)
ZC = zeros(size(cImg));
[rr,cc] = size(cImg);

% Scan along the rows
for i=1:rr
    for j=1:cc-1
       % Check cases {+,-} {-,+}
       if (cImg(i,j)<0 && cImg(i,j+1)>0) || (cImg(i,j)>0 && cImg(i,j+1)<0)
           % Check treshold
           ZC(i,j) = (abs(cImg(i,j+1)-cImg(i,j)) >= threshold);
       end
       % Check cases {+,0,-} {-,0,+}
       if j > 1 && (cImg(i,j) == 0) && ...
               (((cImg(i,j-1) < 0) && (cImg(i,j+1) > 0)) || ...
               ((cImg(i,j-1) > 0) && (cImg(i,j+1) < 0)))
           % Check treshold
           ZC(i,j) = (abs(cImg(i,j+1)-cImg(i,j-1)) >= threshold);
       end
    end
end
end