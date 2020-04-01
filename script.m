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

figure,subplot(2,1,1), imagesc(greyImg1_conv1), colormap gray,
title("Boccadasse convolved with sd = " + sd1 + " LoG filter")

subplot(2,1,2), imagesc(greyImg1_conv2), colormap gray,
title("Boccadasse convolved with sd = " + sd2 + " LoG filter")

ZC1 = detectZeroCrossings(greyImg1_conv1, 20);
ZC2 = detectZeroCrossings(greyImg1_conv2);
BW = edge(greyImg1, 'log');

%display result images
figure,subplot(2,1,1), imagesc(~ZC1), colormap gray
title("edge detection of boccadasse (LoG filter with sd = "+sd1+")")
subplot(2,1,2),imagesc(~BW), colormap gray
title('edge detected with function edge()')

figure,subplot(2,1,1), imagesc(~ZC2), colormap gray
title("edge detection of boccadasse (LoG filter with sd = "+sd2+")")
subplot(2,1,2),imagesc(~BW), colormap gray
title('edge detected with function edge()')

%% Exercise 2
img1=imread('highway1.jpg','jpg');
img1_gray=double(rgb2gray(img1));
img2=imread('highway2.jpg','jpg');
img2_gray=double(rgb2gray(img2));

%edge detection
BW1= edge(img1_gray,'sobel');
BW2= edge(img2_gray,'sobel');

%Hough transform
[H1,T1,R1]=hough(BW1);
[H2,T2,R2]=hough(BW2);

%figure,subplot(2,1,1),imagesc(H1),colormap pink,title('Hough transform matrix of highway1.jpg');
%subplot(2,1,2),imagesc(H2),colormap pink,title('Hough transform matrix of highway2.jpg');

%Identify peaks in Hough transform
P1  = houghpeaks(H1,5,'NHoodSize',[21 21]); %5 maximum number of peaks, as suggested by the text
P2  = houghpeaks(H2,4,'NHoodSize',[21 21]); %4 as suggested by the text

%img1
computeStraightLines(BW1,P1,T1,R1,img1);
computeStraightLines(BW2,P2,T2,R2,img2);

