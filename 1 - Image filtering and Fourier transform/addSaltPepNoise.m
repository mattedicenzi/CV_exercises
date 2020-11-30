% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944
function imgSaltPepNoise = addSaltPepNoise(originalImg, noiseDensity)

%Salt and pepper 
originalImg=double(originalImg);
[rr,cc]=size(originalImg);
maxv=max(max(originalImg));
indices=full(sprand(rr, cc, noiseDensity)); 
mask1=indices > 0 & indices < 0.5;  
mask2=indices >= 0.5;
imgSaltPepNoise = originalImg .* (~mask1) ;
imgSaltPepNoise = imgSaltPepNoise .* (~mask2) + maxv * mask2;

end