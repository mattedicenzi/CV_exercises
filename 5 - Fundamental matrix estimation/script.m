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
P1_mire = load('.\Mire\Mire1.points');
P1_mire_hom = [P1_mire'; ones(1,size(P1_mire,1))];

P2_mire = load('.\Mire\Mire2.points');
P2_mire_hom = [P2_mire'; ones(1,size(P2_mire,1))];

% Estimate F from P1 and P2 (using the 2 functions)
F1_mire = EightPointsAlgorithm(P1_mire_hom, P2_mire_hom);
F2_mire = EightPointsAlgorithmN(P1_mire_hom, P2_mire_hom);

% Check that X2'*F1*X1 = 0 for each X1 in P1 and X2 in P2
constraintMireF1 = zeros(1,size(P1_mire_hom,2));
disp('MIRE: Epipolar constraints not normalized');
for i=1:size(P1_mire_hom,2)
    constraintMireF1(i) = P2_mire_hom(:,i)' * F1_mire * P1_mire_hom(:,i);
    fprintf('%f ', constraintMireF1(i));
end
fprintf('\n\n');

% Check that X2'*F2*X1 = 0 for each X1 in P1 and X2 in P2
constraintMireF2 = zeros(1,size(P1_mire_hom,2));
disp('MIRE: Epipolar constraints normalized');
for i=1:size(P1_mire_hom,2)
    constraintMireF2(i) = P2_mire_hom(:,i)' * F2_mire * P1_mire_hom(:,i);
    fprintf('%f ', constraintMireF2(i));
end
fprintf('\n\n');

visualizeEpipolarLines(mire1, mire2, F1_mire, P1_mire, P2_mire);
visualizeEpipolarLines(mire1, mire2, F2_mire, P1_mire, P2_mire);

% Compute and visualize epipoles F1 (along with the epipolar lines)
[left_ep_cartesian_F1_mire, right_ep_cartesian_F1_mire] = computeLeftAndRightEpipoles(F1_mire);
visualizeEpipolesAndEpLines(F1_mire, P1_mire, P2_mire, ...
    left_ep_cartesian_F1_mire, right_ep_cartesian_F1_mire);
fprintf('MIRE: Left epipole not normalized: [%d, %d]\n', ...
    left_ep_cartesian_F1_mire(1), left_ep_cartesian_F1_mire(2));
fprintf('MIRE: Right epipole not normalized: [%d, %d]\n\n', ...
    right_ep_cartesian_F1_mire(1), right_ep_cartesian_F1_mire(2));

% Compute and visualize epipoles F2 (along with the epipolar lines)
[left_ep_cartesian_F2_mire, right_ep_cartesian_F2_mire] = computeLeftAndRightEpipoles(F2_mire);
visualizeEpipolesAndEpLines(F2_mire, P1_mire, P2_mire, ...
    left_ep_cartesian_F2_mire, right_ep_cartesian_F2_mire);
fprintf('MIRE: Left epipole normalized: [%d, %d]\n', ...
    left_ep_cartesian_F2_mire(1), left_ep_cartesian_F2_mire(2));
fprintf('MIRE: Right epipole normalized: [%d, %d]\n\n\n', ...
    right_ep_cartesian_F2_mire(1), right_ep_cartesian_F2_mire(2));

%% 'Rubik' set of images

% Load Rubik1 and Rubik2 images
rubik1 = imread('.\Rubik\Rubik1.pgm');
rubik2 = imread('.\Rubik\Rubik2.pgm');

% Load the two sets P1 and P2 and store them in a matrix 3xN
P1_rubik = load('.\Rubik\Rubik1.points');
P1_rubik_hom = [P1_rubik'; ones(1,size(P1_rubik,1))];

P2_rubik = load('.\Rubik\Rubik2.points');
P2_rubik_hom = [P2_rubik'; ones(1,size(P2_rubik,1))];

% Estimate F from P1 and P2 (using the 2 functions)
F1_rubik = EightPointsAlgorithm(P1_rubik_hom, P2_rubik_hom);
F2_rubik = EightPointsAlgorithmN(P1_rubik_hom, P2_rubik_hom);

% Check that X2'*F1*X1 = 0 for each X1 in P1 and X2 in P2
constraintRubikF1 = zeros(1,size(P1_rubik_hom,2));
disp('RUBIK: Epipolar constraints not normalized');
for i=1:size(P1_rubik_hom,2)
    constraintRubikF1(i) = P2_rubik_hom(:,i)' * F1_rubik * P1_rubik_hom(:,i);
    fprintf('%f ', constraintRubikF1(i));
end
fprintf('\n\n');

% Check that X2'*F2*X1 = 0 for each X1 in P1 and X2 in P2
constraintRubikF2 = zeros(1,size(P1_rubik_hom,2));
disp('RUBIK: Epipolar constraints normalized');
for i=1:size(P1_rubik_hom,2)
    constraintRubikF2(i) = P2_rubik_hom(:,i)' * F2_rubik * P1_rubik_hom(:,i);
    fprintf('%f ', constraintRubikF2(i));
end
fprintf('\n\n');

visualizeEpipolarLines(rubik1, rubik2, F1_rubik, P1_rubik, P2_rubik);
visualizeEpipolarLines(rubik1, rubik2, F2_rubik, P1_rubik, P2_rubik);

% Compute and visualize epipoles F1 (along with the epipolar lines)
[left_ep_cartesian_F1_rubik, right_ep_cartesian_F1_rubik] = computeLeftAndRightEpipoles(F1_rubik);
visualizeEpipolesAndEpLines(F1_rubik, P1_rubik, P2_rubik, ...
    left_ep_cartesian_F1_rubik, right_ep_cartesian_F1_rubik);
fprintf('RUBIK: Left epipole not normalized: [%d, %d]\n', ...
    left_ep_cartesian_F1_rubik(1), left_ep_cartesian_F1_rubik(2));
fprintf('RUBIK: Right epipole not normalized: [%d, %d]\n\n', ...
    right_ep_cartesian_F1_rubik(1), right_ep_cartesian_F1_rubik(2));

% Compute and visualize epipoles F2 (along with the epipolar lines)
[left_ep_cartesian_F2_rubik, right_ep_cartesian_F2_rubik] = computeLeftAndRightEpipoles(F2_rubik);
visualizeEpipolesAndEpLines(F2_rubik, P1_rubik, P2_rubik, ...
    left_ep_cartesian_F2_rubik, right_ep_cartesian_F2_rubik);
fprintf('RUBIK: Left epipole normalized: [%d, %d]\n', ...
    left_ep_cartesian_F2_rubik(1), left_ep_cartesian_F2_rubik(2));
fprintf('RUBIK: Right epipole normalized: [%d, %d]\n', ...
    right_ep_cartesian_F2_rubik(1), right_ep_cartesian_F2_rubik(2));