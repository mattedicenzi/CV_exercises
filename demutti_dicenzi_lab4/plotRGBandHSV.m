function plotRGBandHSV(img_RGB_channels, img1_HSV_channels, titleImg)

figure,subplot(236)
subplot(231),imagesc(img_RGB_channels{1}),colormap gray,title(titleImg + ": R component")
subplot(232),imagesc(img_RGB_channels{2}),colormap gray,title(titleImg + ": G component")
subplot(233),imagesc(img_RGB_channels{3}),colormap gray,title(titleImg + ": B component")
subplot(234),imagesc(img1_HSV_channels{1}),colormap gray,title(titleImg + ": H component")
subplot(235),imagesc(img1_HSV_channels{2}),colormap gray,title(titleImg + ": S component")
subplot(236),imagesc(img1_HSV_channels{3}),colormap gray,title(titleImg + ": V component")

end