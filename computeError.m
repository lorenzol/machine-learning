%% function J = computeError(X, y, w)
%Function that will calculate and return the training error of the
%resulting fit of the given X , y and w.
%
% =====================================================
%
function J = computeError(X, y, w)

    % Calculate error using formula
    J = (1/2) * sum(((X*w)-y).^2);

end % end function J = computeError(X, y, w)
