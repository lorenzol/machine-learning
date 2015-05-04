%% function D = euclideanDist(X,u)
% desc: calculates euclidean distance between X and U
% inputs: matrix X, matrix U(class centroids)
% output: matrix D, of distance between X and centroids
% 
% =====================================================
function D = euclideanDist(X,u)

   % Matlab function which 
   % calculates pairwise distance between two sets of observations
   % D = pdist2(X,U);
   
   % My function to do the same
   [m,n] = size(X);
   
   for j=1:m % for each row
       D(j)=sqrt(sum((X(j,:)-u).^2));      
   end % j   
   
         
end % function