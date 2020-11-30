% Matteo Dicenzi
% 4342944
% Marco Demutti
% 4389233
function plot2FiltersAsImageAndSurf(filter1, typeOfFilter1, filter2, typeOfFilter2)

% Filter 1
figure;
subplot(2,2,1);
imagesc(filter1); % ...as an image
title(typeOfFilter1 + " image");

subplot(2,2,2);
surf(filter1); % ...and as a surface
title(typeOfFilter1 + " surface");

% Filter 2
subplot(2,2,3);
imagesc(filter2); % ...as an image
title(typeOfFilter2 + " image");

subplot(2,2,4);
surf(filter2); % ...and as a surface
title(typeOfFilter2 + " surface");

end