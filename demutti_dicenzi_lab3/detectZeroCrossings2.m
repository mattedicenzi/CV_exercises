function ZC = detectZeroCrossings2(cImg, treshold)

% Default treshold = 0
if (nargin < 2)
   treshold = 0; 
end

ZC_rows = detectZeroCrossings_rows(cImg, treshold);
ZC_col = detectZeroCrossings_rows(cImg', treshold);

ZC = ZC_rows | (ZC_col');

end