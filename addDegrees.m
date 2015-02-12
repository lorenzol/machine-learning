%% function X = addDegrees(x, d)
% Function that add degrees d to vector x
% and output matrix X.
%
% =====================================================
%
function X = addDegrees(x, d)


    X = ones(length(x), d+1);

    for i = 1:d
        X(:,i) = x(:,1).^(d-(i-1));
    end
    
end % end function addDegrees
