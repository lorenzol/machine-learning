%% function w = computeW_L2reg(X, y, lambda)
% Function will perform L2 regularization 
% Inputs: independant values X (matrix), dependant values y(vector)
% and regularization parameter lambda
% Output: weight vector w.
%
% =====================================================
%
function w = computeW_L2reg(X, y, lambda)

    % compute L2 regularized weight vector W for X,y and lambda
    I = eye(size(X,2));
    w = inv((X'*X)+(lambda*I))*(X'*y);

end % end function w = computeW_L2reg(X, y, lambda)
