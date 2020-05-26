%% Lab 6 - Fundamental matrix estimation
% Dicenzi Matteo 
% 4342944
% Demutti Marco  
% 4389233

close all;
clear;

% Load the two sets P1 and P2
P1 = load('.\Mire\Mire1.points');
P1 = [P1'; ones(1,size(P1,1))];

P2 = load('.\Mire\Mire2.points');
P2 = [P2'; ones(1,size(P2,1))];

% Estimate F from P1 and P2 (using the 2 functions)
F1 = EightPointsAlgorithm(P1, P2);
F2 = EightPointsAlgorithmN(P1, P2);

% Check that X2'*F1*X1 = 0 for each X1 in P1 and X2 in P2
constraintCheck = zeros(1,size(P1,2));
for i=1:size(P1,2)
    constraintCheck(i) = P2(:,i)' * F1 * P1(:,i);
end

% Check that X2'*F2*X1 = 0 for each X1 in P1 and X2 in P2
constraintCheck2 = zeros(1,size(P1,2));
for i=1:size(P1,2)
    constraintCheck2(i) = P2(:,i)' * F2 * P1(:,i);
end