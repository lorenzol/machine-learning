%% function [pv] = gaussian_NB(x,y,mu,sigma)
% Gaussian Naive Bayes model
% returns probabilty values for each row
% output pv prediction values
% 
% =====================================================
%
function [pv] = gaussian_NB(x,y,mu,sigma)

    [m,n] = size(x); % m and n values

    yu=unique(y); % unique y's or classes
    nc=length(yu); % number of classes = unique y's
    ni=size(x,2); % number of independent variables

    % compute class probability(prior)
    for i=1:nc % 1 to number of classes
        fy(i)=sum(double(y==yu(i)))/length(y); % prior
    end
   
    % calculate probabilities
    for j=1:m % for all rows
        for s=1:nc % number of classes
            prod_ni = 0; % initialize product
            for t=1:ni  % number of independant variable
                if sigma(s,t) ~= 0
                   % gets-> p(x1|c1)p(x2|c1)...
                   prod_ni = prod_ni + getGaussian(x(j,t),mu(s,t),sigma(s,t));
                end
            end % end ni(ind. variable) loop
            P(j,s) = fy(s)*prod_ni; % gets-> p(c1)p(x1|c1)p(x2|c1)...
        end % end nc(class) loop
    end % end j loop
   
% get predicted output
[pv0,id]=max(P,[],2); %max value of each row
for i=1:length(id)
    pv(i,1)=yu(id(i));
end


end % function [pv] = gaussian_NB(x,y,mu,sigma)