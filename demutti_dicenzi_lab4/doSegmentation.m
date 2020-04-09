function segmentedImage = doSegmentation(imgHue, minThr, maxThr)

[rr,cc] = size(imgHue);
segmentedImage = zeros(rr,cc);
mask = imgHue > minThr & imgHue < maxThr;
segmentedImage = segmentedImage + mask;

end