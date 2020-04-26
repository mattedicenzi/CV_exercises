%% Lab 5 - NCC-based segmentation and Harris corner detection
% Dicenzi Matteo 
% 4342944
% Demutti Marco  
% 4389233

close all;
clear;

%% Exercise 1 - NCC-based segmentation

% Read all 6 RGB images
img1_rgb = imread('ur_c_s_03a_01_L_0376.png', 'png');
img2_rgb = imread('ur_c_s_03a_01_L_0377.png', 'png');
img3_rgb = imread('ur_c_s_03a_01_L_0378.png', 'png');
img4_rgb = imread('ur_c_s_03a_01_L_0379.png', 'png');
img5_rgb = imread('ur_c_s_03a_01_L_0380.png', 'png');
img6_rgb = imread('ur_c_s_03a_01_L_0381.png', 'png');

figure
subplot(2,3,1), imagesc(img1_rgb), colormap gray, title ('image 1')
subplot(2,3,2), imagesc(img2_rgb), colormap gray, title ('image 2')
subplot(2,3,3), imagesc(img3_rgb), colormap gray, title ('image 3')
subplot(2,3,4), imagesc(img4_rgb), colormap gray, title ('image 4')
subplot(2,3,5), imagesc(img5_rgb), colormap gray, title ('image 5')
subplot(2,3,6), imagesc(img6_rgb), colormap gray, title ('image 6')

%create cell for storing all gray images
imgi_gray = cell(1,6);

%gray conversion
imgi_gray{1} = double(rgb2gray(img1_rgb));
imgi_gray{2} = double(rgb2gray(img2_rgb));
imgi_gray{3} = double(rgb2gray(img3_rgb));
imgi_gray{4} = double(rgb2gray(img4_rgb));
imgi_gray{5} = double(rgb2gray(img5_rgb));
imgi_gray{6} = double(rgb2gray(img6_rgb));

%select area of red car
red_car  = imgi_gray{1}(362:420, 690:769);
%(345:441,675,785)
dark_car = imgi_gray{1}(345:433, 541:663);

larger_dark_car   = imgi_gray{1}(330:448, 526:678);
smaller_dark_car  = imgi_gray{1}(360:418, 556:648);

figure
subplot(1,2,1), imagesc(red_car),  colormap gray, title ('Red Car Template')
subplot(1,2,2), imagesc(dark_car), colormap gray, title ('Dark Car Template')
figure
subplot(1,2,1), imagesc(larger_dark_car),  colormap gray
title ('larger template for dark car')
subplot(1,2,2), imagesc(smaller_dark_car), colormap gray
title ('smaller  template for dark car')
 
%NCC-based segmentation. Ci, i=1,..,6
Ci = computeNCC (red_car, imgi_gray);
%Display results
displayResults(Ci, red_car, imgi_gray);

% Repeat steps for dark car
Ci = computeNCC (dark_car, imgi_gray, "dark car");
%Display results
displayResults(Ci, dark_car, imgi_gray);

% Repeat steps for smaller dark car
Ci = computeNCC (smaller_dark_car, imgi_gray,"smaller dark car");
%Display results
displayResults(Ci, smaller_dark_car, imgi_gray);

% Repeat steps for larger dark car
Ci = computeNCC (larger_dark_car, imgi_gray, "larger dark car");
%Display results
displayResults(Ci, larger_dark_car, imgi_gray);

%% Exercise 2 - Harris corner detection

img = double(imread('i235.png', 'png'));
figure, imagesc(img), colormap gray, title('Image before detecting corners')

% Compute and show x and y derivative of the image
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0  0  0; -1 -2 -1];
Ix = conv2(img, dx, 'same');
Iy = conv2(img, dy, 'same');
figure
subplot(1,2,1),imagesc(Ix), colormap gray, title('x partial derivative of image')
subplot(1,2,2),imagesc(Iy), colormap gray, title('y partial derivative of image')

% Compute products of derivatives at every pixel
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

% Compute the sum of products of  derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
figure, imagesc(g), colormap gray, title('Gaussian filter')
Sx2 = conv2(Ix2, g, 'same'); Sy2 = conv2(Iy2, g, 'same'); Sxy = conv2(Ixy, g, 'same');
figure
subplot(1,3,1),imagesc(Sx2),colormap gray, title('Square of partial derivative in x')
subplot(1,3,2),imagesc(Sxy),colormap gray, title('Cross product of partial derivatives')
subplot(1,3,3),imagesc(Sy2),colormap gray, title('Square of partial derivative in y')

% Corner detection
[R_map, corner_reg] = corner_detection(Sx2, Sxy, Sy2);

% Show the R score map and the corner regions
figure 
subplot(1,2,1), imagesc(R_map), colormap jet, title('R score map')
subplot(1,2,2), imagesc(corner_reg.*img), colormap gray, title('Corner regions')

% Get the centroids of the blobs in the corner regions map
props = regionprops(logical(corner_reg), 'Centroid');

% Show the detected corners overlapped to the image
figure, imagesc(img), colormap gray, title('Image with detected corners'), 
hold on
for i=1:size(props,1)
    xc=floor(props(i).Centroid(1));
    yc=floor(props(i).Centroid(2));
    plot(xc, yc, '*r');
end