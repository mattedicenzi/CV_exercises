% Matteo Dicenzi
% 4342944
% Marco Demutti
% 4389233
function plot2ImagesWithHistograms(image1, titleImage1, image2, titleImage2)

figure; 
subplot(2,2,1);
imagesc(image1), colormap gray;
title(titleImage1);

subplot(2,2,2);
imhist(uint8(double(image1)),256);
title("Histogram " + titleImage1);

subplot(2,2,3);
imagesc(image2), colormap gray;
title(titleImage2);

subplot(2,2,4);
imhist(uint8(double(image2)),256);
title("Histogram " + titleImage2);

end