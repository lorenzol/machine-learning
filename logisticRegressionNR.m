%% function [pv,w,ll] = logisticRegressionNR(X,y)
% Newton's method for logistic regression
% Function that will return w and ll for logistic regression
% w is weights, ll logo likelihood
% given X and y
% output pv prediction values
% =====================================================
%
function [pv,w,ll] = logisticRegressionNR(X,y)

    [m,n] = size(X); % m and n values
    
    w = zeros(n, 1); % initialize w with 0's
    
    max_iters = 10; % maximum number of iterations
    
    for i = 1:max_iters
        grad = zeros(n, 1); % initialize gradient with 0's
        ll(i) =0; % initiliaze log likelihood to 0
        H = zeros(n,n); % initilize Hessian matrix
        for j=1:m
            hxj = sigmoid(X(j,:)*w); % sigmoid applied to w'X
            grad = grad + X(j,:)'*(y(j) - hxj); % update gradient
            R = hxj * (1-hxj); % compute R
            H = H - (R*X(j,:)'*X(j,:)); % update H
            ll(i) = ll(i) + y(j)*log(hxj) + (1-y(j))*log(1-hxj); % ll cost
        end % j loop
 
        w = w - inv(H)*grad; % the weights are updated 
        
    end % end i loop
    
    pv = X*w;
    pv(pv >= 0.5) = 1;
    pv(pv < 0.5) = 0;
    
end % function [pv,w,ll] = logisticRegressionNR(X,y)
    
    