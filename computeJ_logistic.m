%% function J = computeJ_logistic(X,y,w)
% Function that will return cost of logistic functin
% input X, y, and w
% returns J (cost)
% =====================================================
%
function J = computeJ_logistic(X,y,w)

    %m = length(y); % number of training examples

    J = 0; % initilaize cost to 0

    g_z = sigmoid(X*w); % get sigmoid of h(x)

    j1 = -y' * log(g_z); % if y=1 part of J
    j2 = (1-y)' * log(1 - g_z); % if y=0 part of J

    %J = (1/m) * sum(j1 - j2); % compute J, division by number of rows
    J = sum(j1 - j2); % compute J, no division by # of rows

end % J = computeJ_logistic(X,y,w)
