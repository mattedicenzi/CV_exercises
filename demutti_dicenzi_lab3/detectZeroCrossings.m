function ZC = detectZeroCrossings(cImg, threshold)

% Default threshold = 0
if (nargin < 2)
   threshold = 0; 
end

ZC_rows = detectZeroCrossings_rows(cImg, threshold);
ZC_col = detectZeroCrossings_rows(cImg', threshold);

ZC = ZC_rows | (ZC_col');

end