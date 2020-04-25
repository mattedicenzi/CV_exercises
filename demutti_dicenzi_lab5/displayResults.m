%Dicenzi Matteo
%Demutti Marco

function displayResults(Ci, template, imgi)
    [x1_center, y1_center, x1_offSet, y1_offSet] = findCenterAndOffset(Ci{1}, template);
    [x2_center, y2_center, x2_offSet, y2_offSet] = findCenterAndOffset(Ci{2}, template);
    [x3_center, y3_center, x3_offSet, y3_offSet] = findCenterAndOffset(Ci{3}, template);
    [x4_center, y4_center, x4_offSet, y4_offSet] = findCenterAndOffset(Ci{4}, template);
    [x5_center, y5_center, x5_offSet, y5_offSet] = findCenterAndOffset(Ci{5}, template);
    [x6_center, y6_center, x6_offSet, y6_offSet] = findCenterAndOffset(Ci{6}, template);
    
    [rr,cc] = size(template);

    figure
    subplot(2,3,1), imagesc(imgi{1}), title('Image 1 '), colormap gray, hold on
    plot(x1_center, y1_center,'r*');
    rectangle('Position',[x1_offSet+1, y1_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

    subplot(2,3,2), imagesc(imgi{2}), title('Image 2 '), hold on
    plot(x2_center, y2_center,'r*');
    rectangle('Position',[x2_offSet+1, y2_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

    subplot(2,3,3), imagesc(imgi{3}), title('Image 3 '), hold on
    plot(x3_center, y3_center,'r*');
    rectangle('Position',[x3_offSet+1, y3_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

    subplot(2,3,4), imagesc(imgi{4}), title('Image 4 '), hold on
    plot(x4_center, y4_center,'r*');
    rectangle('Position',[x4_offSet+1, y4_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

    subplot(2,3,5), imagesc(imgi{5}), title('Image 5 '), hold on
    plot(x5_center, y5_center,'r*');
    rectangle('Position',[x5_offSet+1, y5_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

    subplot(2,3,6), imagesc(imgi{6}), title('Image 6 '), hold on
    plot(x6_center, y6_center,'r*');
    rectangle('Position',[x6_offSet+1, y6_offSet+1, cc , rr],'EdgeColor',[1,0,0]);

end