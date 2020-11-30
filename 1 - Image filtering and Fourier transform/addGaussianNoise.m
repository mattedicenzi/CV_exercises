% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944
function imgGaussianNoise = addGaussianNoise(originalImg, standardDev)

imgGaussianNoise = double(originalImg)+standardDev*randn(size(originalImg));

end