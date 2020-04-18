%% Lab 5 - NCC-based segmentation and Harris corner detection
%Dicenzi Matteo 4342944
%Demutti Marco  4389233

close all;
clear;

%% Exercise 1: NCC-based segmentation

% Read all 6 RGB images
img1_rgb = imread('ur_c_s_03a_01_L_0376.png', 'png');
img2_rgb = imread('ur_c_s_03a_01_L_0377.png', 'png');
img3_rgb = imread('ur_c_s_03a_01_L_0378.png', 'png');
img4_rgb = imread('ur_c_s_03a_01_L_0379.png', 'png');
img5_rgb = imread('ur_c_s_03a_01_L_0380.png', 'png');
img6_rgb = imread('ur_c_s_03a_01_L_0381.png', 'png');

%gray conversion
img1_gray = double(rgb2gray(img1_rgb));
img2_gray = rgb2gray(img2_rgb);
img3_gray = rgb2gray(img3_rgb);
img4_gray = rgb2gray(img4_rgb);
img5_gray = rgb2gray(img5_rgb);
img6_gray = rgb2gray(img6_rgb);

%select area of red car
red_car  = img1_gray(354:432, 685:775);

figure,imagesc(red_car),colormap gray, title ('Red Car Template')

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
[x1, y1] = find(C1 == max_C1 );
[x2, y2] = find(C2 == max_C2 );
[x3, y3] = find(C3 == max_C3 );
[x4, y4] = find(C4 == max_C4 );
[x5, y5] = find(C5 == max_C5 );
[x6, y6] = find(C6 == max_C6 );

% Display all images in greyscale with red car in box and with focus on
% indeces of maximum
figure
subplot(2,3,1)
imagesc(img1_rgb), title('Image 1 '), hold on
plot(y1, x1,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,2), imagesc(img2_rgb), title('Image 2 '), hold on
plot(y2, x2,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,3), imagesc(img3_rgb), title('Image 3 '), hold on
plot(y3, x3,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,4), imagesc(img4_rgb), title('Image 4 '), hold on
plot(y4, x4,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,5), imagesc(img5_rgb), title('Image 5 '), hold on
plot(y5, x5,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,6), imagesc(img6_rgb), title('Image 6 '), hold on
plot(y6, x6,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

% QUESTO FUNZIONA
% MEGLIO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%remove mean value
red_car = red_car - mean2(red_car);

%two-dimensional correlation
res1 = filter2(red_car, img1_gray,'same');
res2 = filter2(red_car, img2_gray,'same');
res3 = filter2(red_car, img3_gray,'same');
res4 = filter2(red_car, img4_gray,'same');
res5 = filter2(red_car, img5_gray,'same');
res6 = filter2(red_car, img6_gray,'same');

%find indeces of maximum
[x1, y1] = find(res1 == max(res1(:)));
[x2, y2] = find(res2 == max(res2(:)));
[x3, y3] = find(res3 == max(res3(:)));
[x4, y4] = find(res4 == max(res4(:)));
[x5, y5] = find(res5 == max(res5(:)));
[x6, y6] = find(res6 == max(res6(:)));

%show results
figure
subplot(2,3,1), imagesc(res1), colormap gray
subplot(2,3,2), imagesc(res2), colormap gray
subplot(2,3,3), imagesc(res3), colormap gray
subplot(2,3,4), imagesc(res4), colormap gray
subplot(2,3,5), imagesc(res5), colormap gray
subplot(2,3,6), imagesc(res6), colormap gray

% Display all images in greyscale with red car in box and with focus on
% indeces of maximum
figure
subplot(2,3,1)
imagesc(img1_rgb), title('Image 1 '), hold on
plot(y1, x1,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,2), imagesc(img2_rgb), title('Image 2 '), hold on
plot(y2, x2,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,3), imagesc(img3_rgb), title('Image 3 '), hold on
plot(y3, x3,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,4), imagesc(img4_rgb), title('Image 4 '), hold on
plot(y4, x4,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,5), imagesc(img5_rgb), title('Image 5 '), hold on
plot(y5, x5,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);

subplot(2,3,6), imagesc(img6_rgb), title('Image 6 '), hold on
plot(y6, x6,'r*');
rectangle('Position',[685, 354 ,90 , 78],'EdgeColor',[1,0,0]);



%% Exercise 2: Harris corner detection