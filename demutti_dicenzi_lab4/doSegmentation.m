function segmentedImage = doSegmentation(imgHue, subimg_Hue)

mean_subimg_Hue = mean2(subimg_Hue);
stdev_subimg_Hue = std2(subimg_Hue);
minThr = mean_subimg_Hue - 0.4*stdev_subimg_Hue;
maxThr = mean_subimg_Hue + 0.4*stdev_subimg_Hue;

[rr,cc] = size(imgHue);
segmentedImage = zeros(rr,cc);
mask = imgHue > minThr & imgHue < maxThr;
segmentedImage = segmentedImage + mask;

end