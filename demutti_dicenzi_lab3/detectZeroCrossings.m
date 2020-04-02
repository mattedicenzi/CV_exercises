% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

% The function is used to detect the zero crossings of an image, given an
% image already convolved with a LoG. It is possible to pass a threshold to
% avoid weak zero crossings.
% Input: convolved Image, threshold
% Output: binary image, with '1' in correspondance of the zero crossings

function ZC = detectZeroCrossings(cImg, threshold)

% Default threshold = 0
if (nargin < 2)
   threshold = 0; 
end

% Detect zero crossings along the rows, then repeat along the columns
ZC_rows = detectZeroCrossings_rows(cImg, threshold);
ZC_col = detectZeroCrossings_rows(cImg', threshold);

% The resulting binary image is obtainer computing an 'or' between the two
% binary images (rows and columns)
ZC = ZC_rows | (ZC_col');

end