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

%gray conversion
img1_gray = double(rgb2gray(img1_rgb));
img2_gray = double(rgb2gray(img2_rgb));
img3_gray = double(rgb2gray(img3_rgb));
img4_gray = double(rgb2gray(img4_rgb));
img5_gray = double(rgb2gray(img5_rgb));
img6_gray = double(rgb2gray(img6_rgb));

%select area of red car
red_car  = img1_gray(362:420, 690:769);
%(345:441,675,785)
dark_car = img1_gray(345:433, 541:663);

larger_dark_car   = img1_gray(330:448, 526:678);
smaller_dark_car  = img1_gray(360:418, 556:648);


figure
subplot(2,1,1), imagesc(red_car),  colormap gray, title ('Red Car Template')
subplot(2,1,2), imagesc(dark_car), colormap gray, title ('Dark Car Template')
figure
subplot(2,1,1), imagesc(larger_dark_car),  colormap gray
title ('smaller template for dark car')
subplot(2,1,2), imagesc(smaller_dark_car), colormap gray
title ('larger  template for dark car')
 
%NCC-based segmentation
C1 = normxcorr2(red_car, img1_gray);
C2 = normxcorr2(red_car, img2_gray);
C3 = normxcorr2(red_car, img3_gray);
C4 = normxcorr2(red_car, img4_gray);
C5 = normxcorr2(red_car, img5_gray);
C6 = normxcorr2(red_car, img6_gray);

%show NCC results
figure
subplot(2,3,1), imagesc(C1), colormap gray, title ('NCC-based segmentation 1')
subplot(2,3,2), imagesc(C2), colormap gray, title ('NCC-based segmentation 2')
subplot(2,3,3), imagesc(C2), colormap gray, title ('NCC-based segmentation 3')
subplot(2,3,4), imagesc(C2), colormap gray, title ('NCC-based segmentation 4')
subplot(2,3,5), imagesc(C2), colormap gray, title ('NCC-based segmentation 5')
subplot(2,3,6), imagesc(C2), colormap gray, title ('NCC-based segmentation 6')

%find maximum value in each Ci, i=1,..,6
max_C1 = max(C1(:));
max_C2 = max(C2(:));
max_C3 = max(C3(:));
max_C4 = max(C4(:));
max_C5 = max(C5(:));
max_C6 = max(C6(:));

%find indeces of maximum
[y1, x1] = find(C1 == max_C1 );
[y2, x2] = find(C2 == max_C2 );
[y3, x3] = find(C3 == max_C3 );
[y4, x4] = find(C4 == max_C4 );
[y5, x5] = find(C5 == max_C5 );
[y6, x6] = find(C6 == max_C6 );

%compute offset for each Ci, i=1,..,6
y1_offSet = y1 - size(red_car,1);
x1_offSet = x1 - size(red_car,2);
y2_offSet = y2 - size(red_car,1);
x2_offSet = x2 - size(red_car,2);
y3_offSet = y3 - size(red_car,1);
x3_offSet = x3 - size(red_car,2);
y4_offSet = y4 - size(red_car,1);
x4_offSet = x4 - size(red_car,2);
y5_offSet = y5 - size(red_car,1);
x5_offSet = x5 - size(red_car,2);
y6_offSet = y6 - size(red_car,1);
x6_offSet = x6 - size(red_car,2);

figure
subplot(2,3,1)
imagesc(img1_rgb), title('Image 1 '), hold on
plot(x1, y1,'r*');
rectangle('Position',[x1_offSet, y1_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

subplot(2,3,2), imagesc(img2_rgb), title('Image 2 '), hold on
plot(x2, y2,'r*');
rectangle('Position',[x2_offSet, y2_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

subplot(2,3,3), imagesc(img3_rgb), title('Image 3 '), hold on
plot(x3, y3,'r*');
rectangle('Position',[x3_offSet, y3_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

subplot(2,3,4), imagesc(img4_rgb), title('Image 4 '), hold on
plot(x4, y4,'r*');
rectangle('Position',[x4_offSet, y4_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

subplot(2,3,5), imagesc(img5_rgb), title('Image 5 '), hold on
plot(x5, y5,'r*');
rectangle('Position',[x5_offSet, y5_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

subplot(2,3,6), imagesc(img6_rgb), title('Image 6 '), hold on
plot(x6, y6,'r*');
rectangle('Position',[x6_offSet, y6_offSet ,size(red_car,2) , size(red_car,1)],'EdgeColor',[1,0,0]);

%% Exercise 2 - Harris corner detection

img = double(imread('i235.png', 'png'));
figure, imagesc(img), colormap gray, title('Image before detecting corners')

% Compute and show x and y derivative of the image
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0  0  0; -1 -2 -1];
Ix = conv2(img, dx, 'same');
Iy = conv2(img, dy, 'same');
figure, imagesc(Ix), colormap gray, title('x partial derivative of image')
figure, imagesc(Iy), colormap gray, title('y partial derivative of image')

% Compute products of derivatives at every pixel
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

% Compute the sum of products of  derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
figure, imagesc(g), colormap gray, title('Gaussian filter')
Sx2 = conv2(Ix2, g, 'same'); Sy2 = conv2(Iy2, g, 'same'); Sxy = conv2(Ixy, g, 'same');

% Corner detection
[R_map, corner_reg] = corner_detection(Sx2, Sxy, Sy2);

% Show the R score map and the corner regions
figure 
subplot(2,1,1), imagesc(R_map), colormap jet, title('R score map')
subplot(2,1,2), imagesc(corner_reg.*img), colormap gray, title('Corner regions')

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