function visualizeEpipolesAndEpLines(F, pt1, pt2, ep1, ep2)

colors = zeros(size(pt1,1), 3);
for i = 1 : size(pt1,1)
    colors(i,:) = [rand rand rand];
end

figure;

subplot(1,2,1), hold on;
title('Left image');

% Plot left epipole
plot(ep1(1), ep1(2), 'x');

for i = 1 : size(pt1,1)
    
    % points from image 1
    L = F*[pt1(i,1) pt1(i,2) 1]';
    xv = [1:ep1(1)];
    yv = -L(1)/L(2)*xv - L(3)/L(2);
    plot(xv, yv, '-', 'Color', colors(i,:));

end

subplot(1,2,2), hold on;
title('Right image');

% Plot right epipole
plot(ep2(1), ep2(2), 'x');

for i = 1 : size(pt1,1)
    
    % points from image 2
    L = F'*[pt2(i,1) pt2(i,2) 1]';
    xv = [1:ep2(1)];
    yv = -L(1)/L(2)*xv -L(3)/L(2);
    plot(xv, yv, '-', 'Color', colors(i,:));
    
end

end

