%% function w = computeW_L1reg(X, y, lambda)
% Function that will calculate and return the L1 regularized weight 
% For given values X and y and lambda
% returns vector w.
% Using the quadprog function of Matlab
% =====================================================
%
function w = computeW_L1reg(X, y, lambda)

    % compute L1 regularized weight vector W for X,y
        
    H = X'*X; % quadratic term
    
    f = -(y'*X)'; % linear term
    
    A = truthtable(2^size(X,2)); % create truth table of size 2^cols of X
    
    A(A==0) = -1; % convert 0's to -1's
    
    b = repmat(lambda, size(A,1), 1);
    
    options = optimset('Display','off'); % no output to command line
    
    w = quadprog(H,f,A,b,[],[],[],[],[],options);
    
end % end function W = computeW_L1reg(X, y, lambda)
