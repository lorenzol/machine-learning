% desc: calculates euclidean distance between X and U
% inputs: matrix X, matrix U(class centroids)
% output: matrix D, of distance between X and centroids
% 
% =====================================================
function D = euclideanDist(X,U)

   % Matlab function which 
   % calculates pairwise distance between two sets of observations
   D = pdist2(X,U);
   
%    %My function to do the same
%    k = size(U,1);
%    [m,n] = size(X);
%    
%    for j=1:m %for each row
%       for i=1:k % for each cluster centroid
%           D(j,i)=sqrt(sum((X(j,:)-U(i,:)).^2));      
%        end % k         
%    end % j   
   
         
end % function