%% function [g] = getGaussian(x,mu,sigma)
% Function that will return Gaussian of x given mu and sigma
% Returns Gaussian value
% =====================================================
%
function [g] = getGaussian(x,mu,sigma)

    g1 = 1/sqrt(2*pi*sigma^2);
    g2 = exp(-(x-mu)^2/(2*sigma^2));
    g = g1*g2;
    
end % function [g] = getGaussian(x,mu,sigma)
    