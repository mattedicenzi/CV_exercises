%% Lab 5 - NCC-based segmentation and Harris corner detection
%Dicenzi Matteo 4342944
%Demutti Marco  4389233

%% Exercise 1: NCC-based segmentation

% Read all 6 RGB images
img1_rgb=imread('ur_c_s_03a_01_L_0376.png', 'png');
img2_rgb=imread('ur_c_s_03a_01_L_0377.png', 'png');
img3_rgb=imread('ur_c_s_03a_01_L_0378.png', 'png');
img4_rgb=imread('ur_c_s_03a_01_L_0379.png', 'png');
img5_rgb=imread('ur_c_s_03a_01_L_0380.png', 'png');
img6_rgb=imread('ur_c_s_03a_01_L_0381.png', 'png');


%% Exercise 2: Harris corner detection