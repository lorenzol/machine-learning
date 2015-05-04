%% function [mu,sigma] = getMuSigma(x,y)
% =====================================================
% Function to calculate mu and sigma from x and y
% returns mu and sigma
%
function [mu,sigma] = getMuSigma(x,y)

    yu=unique(y); % unique y's or classes
    nc=length(yu); % number of classes = unique y's
    
    % for a normal distribution
    for i=1:nc   % 1 to number of classes
        xi=x((y==yu(i)),:); % x's for specific class
        mu(i,:)=mean(xi,1); % mean of class
        sigma(i,:)=std(xi,1); % std.dev of class
    end
   
end % function [mu, sigma] = getMuSigma(x,y)