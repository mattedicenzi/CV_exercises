%Dicenzi Matteo
%Demutti Marco
function [x_center, y_center, x_offSet, y_offSet] = findCenterAndOffset(C, template)

    max_C = max(C(:));
    [y_max, x_max] = find(C == max_C);
    
    x_center = floor(x_max - (size(template,2)/2));
    y_center = floor(y_max - (size(template,1)/2));
    
    x_offSet = x_max - size(template,2);
    y_offSet = y_max - size(template,1);
end