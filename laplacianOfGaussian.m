% Marco Demutti
% 4389233
% Matteo Dicenzi
% 4342944

% The function implements the Laplacian of Gaussian Operator
% Input: standard deviation
% Output: laplacian of Gaussian filter

function laplacian = laplacianOfGaussian(standDev)

% Standard deviation is related to the spatial support NxN of the Gaussian
% filter: we choose a spacial support s.t. half-width = 3*sigma and round 
% the smallest integer greater than or equal 3*s
sp = ceil(standDev*3); % half-width
[X,Y] = meshgrid(-sp:sp);

% Compute Laplacian of Gaussian (LoG)
laplacian = (1/(2*pi*standDev^2)) * ((X.^2+Y.^2 -2*standDev^2)/standDev^4) .* exp(-(X.^2+Y.^2)/(2*standDev^2));

end