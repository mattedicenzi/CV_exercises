%Dicenzi Matteo
%Demutti Marco

function [scale_space,radii] = computeScale(img,sigma,sigmaIncrease,numbOfScale)
[rr,cc]=size(img);
scale_space = zeros(rr,cc,numbOfScale);

for i=1:numbOfScale
    filt_size =  2*ceil(3*sigma)+1; 
    LoG= sigma^2*fspecial('log', filt_size, sigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate');
    scale_space(:,:,i)=abs(imFiltered);
 
    radii(i)=sigma;
    sigma=sigmaIncrease*sigma;
end
end