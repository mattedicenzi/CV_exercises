%Dicenzi Matteo
%Demutti Marco
function [out,H]= sharpeningFilter(img)
two=[0 0 0 2 0 0 0]';
H=[zeros(7,3) two zeros(7,3)] - (zeros(7,7)+1)*(1/49);
out=imfilter(img,H);

%display filter
figure,subplot(2,1,1),imagesc(H),title('sharpening filter');
subplot(2,1,2),surf(H),title('sharpening filter');
end