function visualizeEpipolesAndEpLines(F, pt1, pt2, ep_l, ep_r)

% function visualizeEpipolesAndEpLines(F, pt1, pt2, ep_l, ep_r)
% Visualize the epipolar lines and right and left epipoles

colors = zeros(size(pt1,1), 3);
for i = 1 : size(pt1,1)
    colors(i,:) = [rand rand rand];
end

figure;

subplot(1,2,1), hold on;
title('Left image');

% Plot left epipole
plot(ep_l(1), ep_l(2), 'x');
set(gca, 'YDir','reverse');

for i = 1 : size(pt1,1)
    
    % points from image 1
    L = F*[pt1(i,1) pt1(i,2) 1]';
    xv = [1:ep_l(1)];
    yv = -L(1)/L(2)*xv - L(3)/L(2);
    plot(xv, yv, '-', 'Color', colors(i,:));

end

subplot(1,2,2), hold on;
title('Right image');

% Plot right epipole
plot(ep_r(1), ep_r(2), 'x');
set(gca, 'YDir','reverse');

for i = 1 : size(pt1,1)
    
    % points from image 2
    L = F'*[pt2(i,1) pt2(i,2) 1]';
    xv = [1:ep_r(1)];
    yv = -L(1)/L(2)*xv -L(3)/L(2);
    plot(xv, yv, '-', 'Color', colors(i,:));
    
end

end

