%% Lab 3 - Edge detection and Hough Transform
% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

clear all
close all

%% Exercise 1

sd1 = 1;
sd2 = 3.5;

laplacian1 = laplacianOfGaussian(sd1);
laplacian2 = laplacianOfGaussian(sd2);

% Plot the two laplacians as images and as surfaces
figure, subplot(2,2,1), imagesc(laplacian1), colormap gray,
title("Laplacian of Gaussian, sd = " + sd1)

subplot(2,2,2), surf(laplacian1),
title("Laplacian of Gaussian, sd = " + sd1)

subplot(2,2,3), imagesc(laplacian2), colormap gray,
title("Laplacian of Gaussian, sd = " + sd2)

subplot(2,2,4), surf(laplacian2),
title("Laplacian of Gaussian, sd = " + sd2)

% Load 'boccadasse.jpg' image
img1 = imread('boccadasse.jpg', 'jpg');
% Convert RGB image to grayscale
greyImg1 = rgb2gray(img1);

% Convolve the test image boccadasse.jpg with the previous LoG filters
greyImg1_conv1 = conv2(greyImg1, laplacian1, 'same');
greyImg1_conv2 = conv2(greyImg1, laplacian2, 'same');

figure, imagesc(greyImg1_conv1), colormap gray,
title("Boccadasse convolved with sd = " + sd1 + " LoG filter")

figure, imagesc(greyImg1_conv2), colormap gray,
title("Boccadasse convolved with sd = " + sd2 + " LoG filter")

ZC1 = detectZeroCrossings(greyImg1_conv1, 20);
figure, imagesc(~ZC1), colormap gray
ZC2 = detectZeroCrossings(greyImg1_conv2);
figure, imagesc(~ZC2), colormap gray

% BW = edge(greyImg1, 'log');
% figure, imagesc(BW), colormap gray
