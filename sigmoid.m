%% function g = sigmoid(z)
% Function that will return the sigmoid of z 
% =====================================================
%
function g = sigmoid(z)

    g = 1./(1 + exp(-z)); % sigmoid of z

end % function g = sigmoid(z)