%% function [y_fit, J, w] = PolyRegress(x,y,d)
% Adds the features x2,x3..Xd to the inputs
% and performs polynomial regression.
%
% Returns y fit, error J, and weights w
%
% =====================================================
%
function [y_fit, J, w] = PolyRegress(x,y,d)

    % add degrees and normalize if requested
    X = addDegrees(x, d);
    
    %calculate weight vector W
    w = inv(X'*X)*(X'*y);

    %polynomial regression line
    y_fit = X*w;  

    J = computeError(X, y, w);

end % function PolyRegress

