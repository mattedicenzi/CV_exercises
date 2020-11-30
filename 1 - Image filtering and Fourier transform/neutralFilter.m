%Dicenzi Matteo
%Demutti Marco
function [out]= neutralFilter(img)
one=[0 0 0 1 0 0 0]';
H=[zeros(7,3) one zeros(7,3)];

out=imfilter(img,H);

%display filter
figure,subplot(2,1,1),imagesc(H),title('neutral filter');
subplot(2,1,2),surf(H),title('neutral filter');
end
