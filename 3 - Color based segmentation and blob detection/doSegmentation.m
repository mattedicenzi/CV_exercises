% Demutti Marco
% Dicenzi Matteo

% The function carries out the segmentation of the Hue component of a given
% image in the range (minThr, maxThr).

% Inputs: Hue component of the image, minimum value of the range, max value
% of the range
% Output: binary segmented image

function segmentedImage = doSegmentation(imgHue, minThr, maxThr)

[rr,cc] = size(imgHue);
segmentedImage = zeros(rr,cc);
mask = imgHue > minThr & imgHue < maxThr;
segmentedImage = segmentedImage + mask;

end