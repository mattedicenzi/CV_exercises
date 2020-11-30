function [left_ep_cartesian, right_ep_cartesian] = computeLeftAndRightEpipoles(F)
% function [left_ep_cartesian, right_ep_cartesian] = computeLeftAndRightEpipoles(F)
% Compute left and right epipoles given matrix F

% SVD decomposition of F
[U,W,V] = svd(F);

% Compute left and right epipoles as the right and left null space of F
% i.e. last column of U and V respectively
left_ep_homogeneous = U(:,end);
right_ep_homogeneous = V(:,end);

% Write the two epipoles in cartesian coordinates
left_ep_cartesian = [left_ep_homogeneous(1)/left_ep_homogeneous(3), left_ep_homogeneous(2)/left_ep_homogeneous(3)];
right_ep_cartesian = [right_ep_homogeneous(1)/right_ep_homogeneous(3), right_ep_homogeneous(2)/right_ep_homogeneous(3)];
end