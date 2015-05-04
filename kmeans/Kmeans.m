% desc: Kmeans model
% inputs:
% output: centroids U and cluster model C
% 
% =====================================================
% variables:
% U -> matrix of cluster centroids
% C -> sample x_1 belongs to cluster C_1
% E -> distances from closest centroid at each iteration
function [U,C,E] = Kmeans(X,k)

    % initialize cluster centroids
    [m,n] = size(X); % number of rows(m) and features(n)
%     index = randsample(1:m, k); % draw k random samples without replacement 
%     U = X(index,:); % randomly initialize cluster centroids.
    
    % non random cluster intialization
    U = load('u_initial.txt'); % load intial clusters u

    % repeat until convergence
    convergence = 1000; %set uppper limit on convergence
    U_prev = U; % used for convergence
    for t=1:convergence
        % euclidean distance matrix for each row/centroid 
        D = euclideanDist(X,U);

        % assign each row to closest centroid
        [E(:,t),C] = min(D,[],2); % E->min distance, C->min centroid
        

        % update cluster centroids (U)
        for i=1:k
            iRows = X(C==i,:); % get all rows belonging to centroid i
            U(i,:) = mean(iRows);
        end
        
        if (isequaln(U_prev,U)) % if no change i.e. convergence
            plotClusters(X,C,U,k, true); 
            break;
        else
            U_prev = U; 
        end

        % uncomment for visualization, only use 2 dimensions.
        %plotClusters(X,C,U,k,t==convergence);
    end % repeat until convergence
 
end % function