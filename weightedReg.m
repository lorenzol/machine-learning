%% function [y, w] = weightedReg(x,y,u)
% Performs a weighted linear regression given x,y and weight vector u
% Returns weight vector w
%
% =====================================================
%
function [y, w] = weightedReg(x,y,u)
 
    % add column vector of 1's to inputs(X)
    X = [x ones(size(x))];

    % create diagonal matrix of weight vector u
    U = diag(u);

    % calculate weight vector w
    w = inv(X'*U*X)*(X'*U*y);

    % linear fit
    y = X*w;  

end % function weightedReg(x,t,u)
