%% Lab 3 - Edge detection and Hough Transform
% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

clear all
close all

%% Exercise 1 - Edge detenction with LoG

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
greyImg1 = im2double(rgb2gray(img1));

% Convolve the test image boccadasse.jpg with the previous LoG filters
greyImg1_conv1 = conv2(greyImg1, laplacian1, 'same');
greyImg1_conv2 = conv2(greyImg1, laplacian2, 'same');

figure,subplot(2,1,1), imagesc(greyImg1_conv1), colormap gray,
title("Boccadasse convolved with sd = " + sd1 + " LoG filter")

subplot(2,1,2), imagesc(greyImg1_conv2), colormap gray,
title("Boccadasse convolved with sd = " + sd2 + " LoG filter")

% Find edges with LoG, using two different functions

% Image with sd = 1

% No threshold
ZC_conv1 = detectZeroCrossings(greyImg1_conv1);
BW_conv1 = edge(greyImg1, 'log', 0, sd1);

% Low threshold
threshold1_low = 0.08;

ZC_conv1_threshold_low = detectZeroCrossings(greyImg1_conv1, threshold1_low);
BW_conv1_threshold_low = edge(greyImg1, 'log', threshold1_low, sd1);

% Display result images with threshold = 0 and threshold = 0.08
figure,subplot(2,2,1), imagesc(~ZC_conv1), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd1+")")
subplot(2,2,2),imagesc(~BW_conv1), colormap gray
title("Edge detected with edge() (LoG sd = "+sd1+")");
subplot(2,2,3), imagesc(~ZC_conv1_threshold_low), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd1+", threshold = "+threshold1_low+")");
subplot(2,2,4),imagesc(~BW_conv1_threshold_low), colormap gray
title("Edge detected with edge() (LoG sd = "+sd1+", threshold = "+threshold1_low+")");

% Medium threshold
threshold1_medium = 0.1;

ZC_conv1_threshold_medium = detectZeroCrossings(greyImg1_conv1, threshold1_medium);
BW_conv1_threshold_medium = edge(greyImg1, 'log', threshold1_medium, sd1);

% High threshold
threshold1_high = 0.2;

ZC_conv1_threshold_high = detectZeroCrossings(greyImg1_conv1, threshold1_high);
BW_conv1_threshold_high = edge(greyImg1, 'log', threshold1_high, sd1);

% Display result images with threshold = 0.1 and threshold = 0.2
figure,subplot(2,2,1), imagesc(~ZC_conv1_threshold_medium), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd1+", threshold = "+threshold1_medium+")")
subplot(2,2,2),imagesc(~BW_conv1_threshold_medium), colormap gray
title("Edge detected with edge() (LoG sd = "+sd1+", threshold = "+threshold1_medium+")");
subplot(2,2,3), imagesc(~ZC_conv1_threshold_high), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd1+", threshold = "+threshold1_high+")");
subplot(2,2,4),imagesc(~BW_conv1_threshold_high), colormap gray
title("Edge detected with edge() (LoG sd = "+sd1+", threshold = "+threshold1_high+")");

% Image with sd = 3.5

% No threshold
ZC_conv2 = detectZeroCrossings(greyImg1_conv2);
BW_conv2 = edge(greyImg1, 'log', 0, sd2);

% Low threshold
threshold2_low = 0.001;

ZC_conv2_threshold_low = detectZeroCrossings(greyImg1_conv2, threshold2_low);
BW_conv2_threshold_low = edge(greyImg1, 'log', threshold2_low, sd2);

% Display result images with threshold = 0 and threshold = 0.001
figure,subplot(2,2,1), imagesc(~ZC_conv2), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd2+")")
subplot(2,2,2),imagesc(~BW_conv2), colormap gray
title("Edge detected with edge() (LoG sd = "+sd2+")");
subplot(2,2,3), imagesc(~ZC_conv2_threshold_low), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd2+", threshold = "+threshold2_low+")");
subplot(2,2,4),imagesc(~BW_conv2_threshold_low), colormap gray
title("Edge detected with edge() (LoG sd = "+sd2+", threshold = "+threshold2_low+")");

% Medium threshold
threshold2_medium = 0.002;

ZC_conv2_threshold_medium = detectZeroCrossings(greyImg1_conv2, threshold2_medium);
BW_conv2_threshold_medium = edge(greyImg1, 'log', threshold2_medium, sd2);

% High threshold
threshold2_high = 0.005;

ZC_conv2_threshold_high = detectZeroCrossings(greyImg1_conv2, threshold2_high);
BW_conv2_threshold_high = edge(greyImg1, 'log', threshold2_high, sd2);

% Display result images with threshold = 0.003 and threshold = 0.005
figure,subplot(2,2,1), imagesc(~ZC_conv2_threshold_medium), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd2+", threshold = "+threshold2_medium+")")
subplot(2,2,2),imagesc(~BW_conv2_threshold_medium), colormap gray
title("Edge detected with edge() (LoG sd = "+sd2+", threshold = "+threshold2_medium+")");
subplot(2,2,3), imagesc(~ZC_conv2_threshold_high), colormap gray
title("Edge detection of boccadasse (LoG sd = "+sd2+", threshold = "+threshold2_high+")");
subplot(2,2,4),imagesc(~BW_conv2_threshold_high), colormap gray
title("Edge detected with edge() (LoG sd = "+sd2+", threshold = "+threshold2_high+")");

%% Exercise 2 - Hough Transform
% Read 'highway1.jpg' and 'highway2.jpg' images and convert to grayscale
img1=imread('highway1.jpg','jpg');
img1_gray=double(rgb2gray(img1));
img2=imread('highway2.jpg','jpg');
img2_gray=double(rgb2gray(img2));

% Edge detection
BW1= edge(img1_gray,'sobel');
BW2= edge(img2_gray,'sobel');

% Hough transform: returns H (Hough Tranform Matrix), T (theta) and R (rho)
[H1,T1,R1]=hough(BW1);
[H2,T2,R2]=hough(BW2);

% Identify peaks in Hough transform: returns peaks matrix
P1  = houghpeaks(H1,4); %4 maximum number of peaks, as suggested by the text
P2  = houghpeaks(H2,5,'NHoodSize',[21 21]); %5 maximum number of peaks, as suggested by the text

% Define parameters to be used to find straightlines
houghlinesParams=[10,30]; %fillGap, minLength

% Find straight lines in img 1
computeStraightLines(BW1,P1,T1,R1,img1_gray,houghlinesParams(1),houghlinesParams(2));

% Find straight lines in img 2
computeStraightLines(BW2,P2,T2,R2,img2_gray,houghlinesParams(1),houghlinesParams(2));


% Apply again the same procedure but with different parameters to see
% the results

% Img 1
P1  = houghpeaks(H1,10); %this time we look for 10 peaks at maximum
houghlinesParams=[14,40]; %fillGap, minLength
computeStraightLines(BW1,P1,T1,R1,img1_gray,houghlinesParams(1),houghlinesParams(2));

% Img 2
P2  = houghpeaks(H2,5,'NHoodSize',[21 21]);
houghlinesParams=[7,30]; %fillGap, minLength
computeStraightLines(BW2,P2,T2,R2,img2_gray,houghlinesParams(1),houghlinesParams(2));