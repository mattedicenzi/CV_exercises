function [F] = EightPointsAlgorithmN(P1, P2)

% Normalize the points P1 and P2
[nP1, T1] = normalise2dpts(P1);
[nP2, T2] = normalise2dpts(P2);

% Construct matrix A
A = zeros(size(nP1,2), 9);

for i=1:size(nP1,2)
    
    % Extract the i-th point
    x1 = nP1(1, i);
    y1 = nP1(2, i);
    x2 = nP2(1, i);
    y2 = nP2(2, i);
    
    % Construct the i-th row
    A(i,1) = x2 * x1;
    A(i,2) = x2 * y1;
    A(i,3) = x2;
    A(i,4) = y2 * x1;
    A(i,5) = y2 * y1;
    A(i,6) = y2;
    A(i,7) = x1;
    A(i,8) = y1;
    A(i,9) = 1;
    
end

% SVD decomposition of A
[U,D,V] = svd(A);
f = V(:,9);
% Matrix F
F = reshape(f,3,3);
F = F';

% Force rank of F to be 2
% SVD decomposition of F
[U,D,V] = svd(F);
D(3,3) = 0;
% Recompute the final F
F = U*D*V';

% De-normalize F
F = T2'*F*T1;
end