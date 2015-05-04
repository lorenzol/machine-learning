%% function [pv,w,ll] = logisticRegressionGD(X,y)
% Stochastic Gradient Descent for logistic regression
% Function that will return get w for logistic regression
% given X and y
% output ll: vector of log-likelihood values at each iteration
% ouptut w
% output pv prediction values
% =====================================================
%
function [pv,w, ll] = logisticRegressionGD(X,y)

    alpha = 0.001; % learning rate
    [m,n] = size(X); % m and n values
    w = zeros(n, 1); % initialize w
    
    max_iters = 500; % maximum iterations
    
    for i = 1:max_iters
        hx = sigmoid(X*w); % calculate sigmoid of h(x)
        w = w + alpha * X'*(y-hx); % gradient descent
        ll(i) = sum( y .* log(hx) + (1 - y) .* log(1 - hx) ); % log likelihood
    end
    
    pv = X*w;
    pv(pv >= 0.5) = 1;
    pv(pv < 0.5) = 0;
    
end % function [pv,w,ll] = logisticRegressionGD(X,y)
    