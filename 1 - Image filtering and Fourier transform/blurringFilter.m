%Dicenzi Matteo
%Demutti Marco
function [out]= blurringFilter(img)
H=(zeros(7,7)+1)*(1/49);
out=imfilter(img,H);
%display filter
figure,subplot(2,1,1),imagesc(H),title('blurring filter');
subplot(2,1,2),surf(H),title('blurring filter');
end