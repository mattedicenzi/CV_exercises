%% Lab 4 - Color-based segmentation and Blob detection
% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

clear all
close all

%% Exercise 1 - Color-based segmentation

% Read all 6 RGB images
img1_rgb=imread('ur_c_s_03a_01_L_0376.png', 'png');
img2_rgb=imread('ur_c_s_03a_01_L_0377.png', 'png');
img3_rgb=imread('ur_c_s_03a_01_L_0378.png', 'png');
img4_rgb=imread('ur_c_s_03a_01_L_0379.png', 'png');
img5_rgb=imread('ur_c_s_03a_01_L_0380.png', 'png');
img6_rgb=imread('ur_c_s_03a_01_L_0381.png', 'png');

% Display all images in greyscale
figure,subplot(236)
subplot(231),imagesc(rgb2gray(img1_rgb)),colormap gray,title('Image 1 grayscale')
subplot(232),imagesc(rgb2gray(img2_rgb)),colormap gray,title('Image 2 grayscale')
subplot(233),imagesc(rgb2gray(img3_rgb)),colormap gray,title('Image 3 grayscale')
subplot(234),imagesc(rgb2gray(img4_rgb)),colormap gray,title('Image 4 grayscale')
subplot(235),imagesc(rgb2gray(img5_rgb)),colormap gray,title('Image 5 grayscale')
subplot(236),imagesc(rgb2gray(img6_rgb)),colormap gray,title('Image 6 grayscale')

% Convert RGB to HSV
img1_hsv=rgb2hsv(img1_rgb);
img2_hsv=rgb2hsv(img2_rgb);
img3_hsv=rgb2hsv(img3_rgb);
img4_hsv=rgb2hsv(img4_rgb);
img5_hsv=rgb2hsv(img5_rgb);
img6_hsv=rgb2hsv(img6_rgb);

% Split images in the three RGB and three HSV channels (stored in cells)
[img1_RGB_channels, img1_HSV_channels] = splitRGBandHSV(img1_rgb, img1_hsv);
[img2_RGB_channels, img2_HSV_channels] = splitRGBandHSV(img2_rgb, img2_hsv);
[img3_RGB_channels, img3_HSV_channels] = splitRGBandHSV(img3_rgb, img3_hsv);
[img4_RGB_channels, img4_HSV_channels] = splitRGBandHSV(img4_rgb, img4_hsv);
[img5_RGB_channels, img5_HSV_channels] = splitRGBandHSV(img5_rgb, img5_hsv);
[img6_RGB_channels, img6_HSV_channels] = splitRGBandHSV(img6_rgb, img6_hsv);

% Display RGB and HSV channels of each image
plotRGBandHSV(img1_RGB_channels, img1_HSV_channels, "Image 1");
plotRGBandHSV(img2_RGB_channels, img2_HSV_channels, "Image 2");
plotRGBandHSV(img3_RGB_channels, img3_HSV_channels, "Image 3");
plotRGBandHSV(img4_RGB_channels, img4_HSV_channels, "Image 4");
plotRGBandHSV(img5_RGB_channels, img5_HSV_channels, "Image 5");
plotRGBandHSV(img6_RGB_channels, img6_HSV_channels, "Image 6");

% Compute mean value and standard deviation in area [360:420,550:650] of 
% image 1 for Hue component
img1_Hue = img1_HSV_channels{1};
subimg1_Hue = img1_Hue(370:420,560:645);
figure, imagesc(subimg1_Hue),colormap gray

mean_subimg1_Hue = mean2(subimg1_Hue);
stdev_subimg1_Hue = std2(subimg1_Hue);
minThr = mean_subimg1_Hue - 0.5*stdev_subimg1_Hue;
maxThr = mean_subimg1_Hue + 0.5*stdev_subimg1_Hue;
segmentedImage1 = doSegmentation(img1_Hue, minThr, maxThr);

figure, imagesc(segmentedImage1),colormap gray

plotSegCentroidBoundaryBox(segmentedImage1);