%% Lab 6 - Fundamental matrix estimation
% Dicenzi Matteo 
% 4342944
% Demutti Marco  
% 4389233

close all;
clear;

%% 'Mire' set of images

% Load Mire1 and Mire2 images
mire1 = imread('.\Mire\Mire1.pgm');
mire2 = imread('.\Mire\Mire2.pgm');

% Load the two sets P1 and P2 and store them in a matrix 3xN
P1 = load('.\Mire\Mire1.points');
P1_hom = [P1'; ones(1,size(P1,1))];

P2 = load('.\Mire\Mire2.points');
P2_hom = [P2'; ones(1,size(P2,1))];

% Estimate F from P1 and P2 (using the 2 functions)
F1 = EightPointsAlgorithm(P1_hom, P2_hom);
F2 = EightPointsAlgorithmN(P1_hom, P2_hom);

% Check that X2'*F1*X1 = 0 for each X1 in P1 and X2 in P2
constraintMireF1 = zeros(1,size(P1_hom,2));
for i=1:size(P1_hom,2)
    constraintMireF1(i) = P2_hom(:,i)' * F1 * P1_hom(:,i);
end

% Check that X2'*F2*X1 = 0 for each X1 in P1 and X2 in P2
constraintMireF2 = zeros(1,size(P1_hom,2));
for i=1:size(P1_hom,2)
    constraintMireF2(i) = P2_hom(:,i)' * F2 * P1_hom(:,i);
end

% visualizeEpipolarLines(mire1, mire2, F1, P1, P2);
% visualizeEpipolarLines(mire1, mire2, F2, P1, P2);

%% 'Rubik' set of images

% Load Rubik1 and Rubik2 images
rubik1 = imread('.\Rubik\Rubik1.pgm');
rubik2 = imread('.\Rubik\Rubik2.pgm');

% Load the two sets P1 and P2 and store them in a matrix 3xN
P1 = load('.\Rubik\Rubik1.points');
P1_hom = [P1'; ones(1,size(P1,1))];

P2 = load('.\Rubik\Rubik2.points');
P2_hom = [P2'; ones(1,size(P2,1))];

% Estimate F from P1 and P2 (using the 2 functions)
F1 = EightPointsAlgorithm(P1_hom, P2_hom);
F2 = EightPointsAlgorithmN(P1_hom, P2_hom);

% Check that X2'*F1*X1 = 0 for each X1 in P1 and X2 in P2
constraintRubikF1 = zeros(1,size(P1_hom,2));
for i=1:size(P1_hom,2)
    constraintRubikF1(i) = P2_hom(:,i)' * F1 * P1_hom(:,i);
end

% Check that X2'*F2*X1 = 0 for each X1 in P1 and X2 in P2
constraintRubikF2 = zeros(1,size(P1_hom,2));
for i=1:size(P1_hom,2)
    constraintRubikF2(i) = P2_hom(:,i)' * F2 * P1_hom(:,i);
end

% visualizeEpipolarLines(rubik1, rubik2, F1, P1, P2);
% visualizeEpipolarLines(rubik1, rubik2, F2, P1, P2);