%Dicenzi Matteo
%Demutti Marco
function Ci = computeNCC (template, imgi_gray, typeOfTemplate)
    %Create cell
    Ci = cell(1,6);
    if(nargin == 2)
        Ci{1} = normxcorr2(template, imgi_gray{1});
        Ci{2} = normxcorr2(template, imgi_gray{2});
        Ci{3} = normxcorr2(template, imgi_gray{3});
        Ci{4} = normxcorr2(template, imgi_gray{4});
        Ci{5} = normxcorr2(template, imgi_gray{5});
        Ci{6} = normxcorr2(template, imgi_gray{6});
    end
    
    if(nargin == 3)
        %get current time
        format shortg,
        temp = clock;
        secOfStart = temp(6); % take into account only seconds
    
        %NCC-based segmentation
        Ci{1} = normxcorr2(template, imgi_gray{1});
        Ci{2} = normxcorr2(template, imgi_gray{2});
        Ci{3} = normxcorr2(template, imgi_gray{3});
        Ci{4} = normxcorr2(template, imgi_gray{4});
        Ci{5} = normxcorr2(template, imgi_gray{5});
        Ci{6} = normxcorr2(template, imgi_gray{6});
    
        format shortg,
        temp = clock;   
        secOfEnd = temp(6);
        delay = (secOfEnd - secOfStart)/6;
        disp("Average seconds of delay : "+ delay +" in case the Template is the " + typeOfTemplate);
    end
    
    %show NCC results
    figure
    subplot(2,3,1), imagesc(Ci{1}), colormap gray, title ('NCC-based segmentation 1')
    subplot(2,3,2), imagesc(Ci{2}), colormap gray, title ('NCC-based segmentation 2')
    subplot(2,3,3), imagesc(Ci{3}), colormap gray, title ('NCC-based segmentation 3')
    subplot(2,3,4), imagesc(Ci{4}), colormap gray, title ('NCC-based segmentation 4')
    subplot(2,3,5), imagesc(Ci{5}), colormap gray, title ('NCC-based segmentation 5')
    subplot(2,3,6), imagesc(Ci{6}), colormap gray, title ('NCC-based segmentation 6')
end