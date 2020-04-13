% Dicenzi Matteo
% Demutti Marco

% The function computes the laplacian response at different scales and 
% returns the scale-space representation (x,y,) of the image

% Inputs: grayscale image, initial value of sigma, sigma increment factor, 
% number of scales
% Output: scale space, radii

function [scale_space,radii] = computeScale(img,startSigma,sigmaIncrease,numbOfScale)
[rr,cc]=size(img);
scale_space = zeros(rr,cc,numbOfScale);

for i=1:numbOfScale
    filt_size =  2*ceil(3*startSigma)+1; 
    LoG= startSigma^2*fspecial('log', filt_size, startSigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate');
    scale_space(:,:,i)=abs(imFiltered);
 
    radii(i)=startSigma;
    startSigma=sigmaIncrease*startSigma;
end
end