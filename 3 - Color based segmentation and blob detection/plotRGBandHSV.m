% Demutti Marco
% Dicenzi Matteo

% The function displays the three RGB channels and the three HSV channels
% of an image

% Inputs: RGB channels (cell), HSV channels (cell), (a title for the image 
% to be displayed)

function plotRGBandHSV(img_RGB_channels, img1_HSV_channels, titleImg)

figure,subplot(2,3,6)
subplot(2,3,1),imagesc(img_RGB_channels{1}),colormap gray,title(titleImg + ": R component")
subplot(2,3,2),imagesc(img_RGB_channels{2}),colormap gray,title(titleImg + ": G component")
subplot(2,3,3),imagesc(img_RGB_channels{3}),colormap gray,title(titleImg + ": B component")
subplot(2,3,4),imagesc(img1_HSV_channels{1}),colormap gray,title(titleImg + ": H component")
subplot(2,3,5),imagesc(img1_HSV_channels{2}),colormap gray,title(titleImg + ": S component")
subplot(2,3,6),imagesc(img1_HSV_channels{3}),colormap gray,title(titleImg + ": V component")

end