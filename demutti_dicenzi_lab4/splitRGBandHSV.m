function [img_RGB_channels, img_HSV_channels] = splitRGBandHSV(img_rgb, img_hsv)

img_RGB_channels = cell(1,3);
img_HSV_channels = cell(1,3);

% RGB channels
for i=1:3
   img_RGB_channels{i} = img_rgb(:,:,i); 
end

% HSV channels
for i=1:3
   img_HSV_channels{i} = img_hsv(:,:,i); 
end
end