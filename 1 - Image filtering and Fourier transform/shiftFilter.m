%Dicenzi Matteo
%Demutti Marco
function [out]= shiftFilter(img)
one=[0 0 0 1 0 0 0]';
H=[zeros(7,6) one];
out=imfilter(img,H);
%display filter
figure,subplot(2,1,1),imagesc(H),title('shift filter');
subplot(2,1,2),surf(H),title('shift filter');
end