%% Lab 2 - Image warping and bilinear interpolation
% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

clear all
close all

%% Image filtering and Fourier Transform

%% Exercise 1: add Gaussian (standard deviation=20) and salt & pepper 
%% (density=20%) noise to the provided images

% Load the two images
img1 = imread('i235.png', 'png');
img2 = imread('tree.png', 'png');

% Plot the two original images and their histograms
plot2ImagesWithHistograms(img1, "Original Image 1", img2, ...
    "Original Image 2");

% Add gaussian noise to both images (standard deviation = 20)
sigma = 20; % standard deviation
img1GaussianNoise = addGaussianNoise(img1, sigma);
img2GaussianNoise = addGaussianNoise(img2, sigma);

% Add salt & pepper noise (density = 20%)
noiseDensity = 0.20;
img1SaltPepNoise = addSaltPepNoise(img1, noiseDensity);
img2SaltPepNoise = addSaltPepNoise(img2, noiseDensity);

% Plot the first image: noisy with gaussian noise, 
% noisy with salt & pepper noise and the two histograms

plot2ImagesWithHistograms(img1GaussianNoise, ...
    "Image 1 with Gaussian Noise (sigma = 20)", ...
    img1SaltPepNoise, ...
    "Image 1 with Salt & Pepper Noise (density = 20%)");

% Plot the second image: noisy with gaussian noise, 
% noisy with salt & pepper noise and the two histograms

plot2ImagesWithHistograms(img2GaussianNoise, ...
    "Image 2 with Gaussian Noise (sigma = 20)", ...
    img2SaltPepNoise, ...
    "Image 2 with Salt & Pepper Noise (density = 20%)");

%% Exercise 2: remove the noise by using a moving average, a low-pass 
%% Gaussian filter and a median filter
%% Filters
size1 = 3; % spacial support 1 (3x3)
size2 = 7; % spacial support 2 (7x7)

% Create two moving average, respectively 3x3 and 7x7
movAvgFilter1 = fspecial('average', size1);
movAvgFilter2 = fspecial('average', size2);

% Plot 3x3 and 7x7 moving average filters (as image and as surface)
plot2FiltersAsImageAndSurf(movAvgFilter1, "3x3 moving average", ...
    movAvgFilter2, "7x7 moving average");

% Create two low-pass Gaussian filters, respectively 3x3 and 7x7
% Choose sigma s.t. half-width = 3*sigma
sigma1 = (0.5 * size1)/3;
sigma2 = (0.5 * size2)/3;
gaussLPFilter1 = fspecial('gaussian', size1, sigma1);
gaussLPFilter2 = fspecial('gaussian', size2, sigma2);

% Plot 3x3 and 7x7 low-pass Gaussian filters (as image and as surface)
plot2FiltersAsImageAndSurf(gaussLPFilter1, "3x3 LP Gaussian Filter", ...
    gaussLPFilter2, "7x7 LP Gaussian Filter");

%% Img 1
% Use moving average filter (3x3 and 7x7) to remove gaussian noise
% from image 1
img1GausNoiseMovAvgFilter1 = imfilter(img1GaussianNoise, movAvgFilter1);
img1GausNoiseMovAvgFilter2 = imfilter(img1GaussianNoise, movAvgFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1GausNoiseMovAvgFilter1, ...
    "Img 1 Gaussian noise removed with 3x3 moving average", ...
    img1GausNoiseMovAvgFilter2, ...
    "Img 1 Gaussian noise removed with 7x7 moving average");

% Use moving average filter (3x3 and 7x7) to remove salt&pepper noise
% from image 1
img1SaltPepNoiseMovAvgFilter1 = imfilter(img1SaltPepNoise, movAvgFilter1);
img1SaltPepNoiseMovAvgFilter2 = imfilter(img1SaltPepNoise, movAvgFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1SaltPepNoiseMovAvgFilter1, ...
    "Img 1 Salt & Pepper noise removed with 3x3 moving average", ...
    img1SaltPepNoiseMovAvgFilter2, ...
    "Img 1 Salt & Pepper noise removed with 7x7 moving average");

% Use LP Gaussian Filter (3x3 and 7x7) to remove gaussian noise
% from image 1
img1GausNoiseGaussLPFilter1 = imfilter(img1GaussianNoise, gaussLPFilter1);
img1GausNoiseGaussLPFilter2 = imfilter(img1GaussianNoise, gaussLPFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1GausNoiseGaussLPFilter1, ...
    "Img 1 Gaussian noise removed with 3x3 LP Gaussian Filter", ...
    img1GausNoiseGaussLPFilter2, ...
    "Img 1 Gaussian noise removed with 7x7 LP Gaussian Filter");

% Use LP Gaussian Filter (3x3 and 7x7) to remove salt&pepper noise
% from image 1
img1SaltPepNoiseGaussLPFilter1 = imfilter(img1SaltPepNoise, gaussLPFilter1);
img1SaltPepNoiseGaussLPFilter2 = imfilter(img1SaltPepNoise, gaussLPFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1GausNoiseGaussLPFilter1, ...
    "Img 1 Salt & Pepper noise removed with 3x3 LP Gaussian Filter", ...
    img1GausNoiseGaussLPFilter2, ...
    "Img 1 Salt & Pepper noise removed with 7x7 LP Gaussian Filter");

% Use median filter (3x3 and 7x7) to remove gaussian noise
% from image 1
img1GausNoiseMedianFilter1 = medfilt2(img1GaussianNoise, [3 3]);
img1GausNoiseMedianFilter2 = medfilt2(img1GaussianNoise, [7 7]);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1GausNoiseMedianFilter1, ...
    "Img 1 Gaussian noise removed with 3x3 Median Filter", ...
    img1GausNoiseGaussLPFilter2, ...
    "Img 1 Gaussian noise removed with 7x7 Median Filter");

% Use median filter (3x3 and 7x7) to remove salt&pepper noise
% from image 1
img1SaltPepNoiseMedianFilter1 = medfilt2(img1SaltPepNoise, [3 3]);
img1SaltPepNoiseMedianFilter2 = medfilt2(img1SaltPepNoise, [7 7]);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img1GausNoiseMedianFilter1, ...
    "Img 1 Salt & Pepper noise removed with 3x3 Median Filter", ...
    img1GausNoiseGaussLPFilter2, ...
    "Img 1 Salt & Pepper noise removed with 7x7 Median Filter");

%% Img 2
% Use moving average filter (3x3 and 7x7) to remove gaussian noise
% from image 2
img2GausNoiseMovAvgFilter1 = imfilter(img2GaussianNoise, movAvgFilter1);
img2GausNoiseMovAvgFilter2 = imfilter(img2GaussianNoise, movAvgFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2GausNoiseMovAvgFilter1, ...
    "Img 2 Gaussian noise removed with 3x3 moving average", ...
    img2GausNoiseMovAvgFilter2, ...
    "Img 2 Gaussian noise removed with 7x7 moving average");

% Use moving average filter (3x3 and 7x7) to remove salt&pepper noise
% from image 2
img2SaltPepNoiseMovAvgFilter1 = imfilter(img2SaltPepNoise, movAvgFilter1);
img2SaltPepNoiseMovAvgFilter2 = imfilter(img2SaltPepNoise, movAvgFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2SaltPepNoiseMovAvgFilter1, ...
    "Img 2 Salt & Pepper noise removed with 3x3 moving average", ...
    img2SaltPepNoiseMovAvgFilter2, ...
    "Img 2 Salt & Pepper noise removed with 7x7 moving average");

% Use LP Gaussian Filter (3x3 and 7x7) to remove gaussian noise
% from image 2
img2GausNoiseGaussLPFilter1 = imfilter(img2GaussianNoise, gaussLPFilter1);
img2GausNoiseGaussLPFilter2 = imfilter(img2GaussianNoise, gaussLPFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2GausNoiseGaussLPFilter1, ...
    "Img 2 Gaussian noise removed with 3x3 LP Gaussian Filter", ...
    img2GausNoiseGaussLPFilter2, ...
    "Img 2 Gaussian noise removed with 7x7 LP Gaussian Filter");

% Use LP Gaussian Filter (3x3 and 7x7) to remove salt&pepper noise
% from image 2
img2SaltPepNoiseGaussLPFilter1 = imfilter(img2SaltPepNoise, gaussLPFilter1);
img2SaltPepNoiseGaussLPFilter2 = imfilter(img2SaltPepNoise, gaussLPFilter2);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2GausNoiseGaussLPFilter1, ...
    "Img 2 Salt & Pepper noise removed with 3x3 LP Gaussian Filter", ...
    img2GausNoiseGaussLPFilter2, ...
    "Img 2 Salt & Pepper noise removed with 7x7 LP Gaussian Filter");

% Use median filter (3x3 and 7x7) to remove gaussian noise
% from image 2
img2GausNoiseMedianFilter1 = medfilt2(img2GaussianNoise, [3 3]);
img2GausNoiseMedianFilter2 = medfilt2(img2GaussianNoise, [7 7]);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2GausNoiseMedianFilter1, ...
    "Img 2 Gaussian noise removed with 3x3 Median Filter", ...
    img2GausNoiseGaussLPFilter2, ...
    "Img 2 Gaussian noise removed with 7x7 Median Filter");

% Use median filter (3x3 and 7x7) to remove salt&pepper noise
% from image 2
img2SaltPepNoiseMedianFilter1 = medfilt2(img2SaltPepNoise, [3 3]);
img2SaltPepNoiseMedianFilter2 = medfilt2(img2SaltPepNoise, [7 7]);

% Plot resulting images and their histograms
plot2ImagesWithHistograms(img2GausNoiseMedianFilter1, ...
    "Img 2 Salt & Pepper noise removed with 3x3 Median Filter", ...
    img2GausNoiseGaussLPFilter2, ...
    "Img 2 Salt & Pepper noise removed with 7x7 Median Filter");

%% Exercise 3: Implement the slides 41-45 “practice with linear filters"
%image1
%neutral filter (no change)
res=neutralFilter(img1);
figure,imagesc(res), colormap gray,title('image1 filtered with neutral filter')
%shifting filter
res=shiftFilter(img1);
figure,imagesc(res), colormap gray,title('image1 filtered with shift filter')
%boxfilter
res=blurringFilter(img1);
figure,imagesc(res), colormap gray,title('image1 filtered with box filter')
%sharpening filter
res=sharpeningFilter(img1);
figure,imagesc(res), colormap gray,title('image1 filtered with sharpening filter')

%image2
res=neutralFilter(img2);
figure,imagesc(res), colormap gray,title('image2 filtered with neutral filter')
%shifting filter
res=shiftFilter(img2);
figure,imagesc(res), colormap gray,title('image2 filtered with shift filter')
%boxfilter
res=blurringFilter(img2);
figure,imagesc(res), colormap gray,title('image2 filtered with blurring filter')
%sharpening filter
res=sharpeningFilter(img2);
figure,imagesc(res), colormap gray,title('image2 filtered with sharpening filter')
%% Exercise 4: Apply the Fourier Transform (FFT) 

%img1
FImg1=fftshift(fft2(img1));
mod1=abs(FImg1);
figure;
imagesc(log(mod1)), colormap gray;
xlabel('wx'),ylabel('wy'),axis square;
title('Magnitude of transformed image 1 (log)');
figure,mesh(log(mod1)),xlabel('x'),ylabel('y'),zlabel('z');
title('Magnitude of transformed image 1 (log)');

%img2
FImg2=fftshift(fft2(img2));
mod2=abs(FImg2);
figure;
imagesc(log(mod2)), colormap gray;
xlabel('wx'),ylabel('wy'),axis square;
title('Magnitude of transformed image 2 (log)');
figure,mesh(log(mod2)),xlabel('x'),ylabel('y'),zlabel('z');
title('Magnitude of transformed image 2 (log)');

%display the magnitude of the transformed low-pass Gaussian filter (spatial support of 101x101 pixels with sigma=5);
gFilter = fspecial('gaussian', 101, 5); % 101=spatial support, 5=standard deviation
FgFilter=fftshift(fft2(gFilter));
modgFilter=abs(FgFilter);
figure;
imagesc(modgFilter), colormap gray;
xlabel('wx'),ylabel('wy'),axis square;
title('Magnitude of transformed low pass gaussian filter');
figure,mesh(modgFilter),xlabel('x'),ylabel('y'),zlabel('z');
title('Magnitude of transformed low pass gaussian filter');

%display the magnitude of the transformed sharpening filter, slide 44 (the filter has a spatial support of 7x7 pixels, copy it in the middle of a zeros image of 101x101 pixels).
[~, sharpFilterSmall] = sharpeningFilter(img1);
sharpFilter=padarray(sharpFilterSmall,[47,47]); %the filter must be in the center of a 101x101 zero-matrix
%display the magnitude of the transformed sharpening filter (spatial support of 7x7 pixels);
ZSharpFilter=fftshift(fft2(sharpFilter));
modSharp=abs(ZSharpFilter);
figure;
imagesc(modSharp), colormap gray;
xlabel('wx'),ylabel('wy'),axis square;
title('Magnitude of transformed sharpening filter');
figure,mesh(modSharp),xlabel('x'),ylabel('y'),zlabel('z');
title('Magnitude of transformed sharpening filter');
