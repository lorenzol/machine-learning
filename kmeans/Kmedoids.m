% desc: Kmedoids  model
% inputs:
% output: centroids U and cluster model C
% =====================================================
% variables:
% U -> matrix of cluster centroids
% C -> sample x_1 belongs to cluster C_1
% E -> distances from closest centroid at each iteration
% =====================================================
function [U,C,E] = Kmeans(X,k)

    % initialize cluster centroids
    [m,n] = size(X); % number of rows(m) and features(n)
    index = randsample(1:m, k); % draw k random samples without replacement 
    U = X(index,:); % randomly initialize cluster centroids to a data point
    
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

            %using vectors, works but not enough memory on large matrices
%           D2 = euclideanDist(iRows,iRows); % distance between points in cluster
%           D2_sum = sum(D2); % sum distance for each data point
%           [~, D2_min] = min(D2_sum); % index of data point which minimizes distances between points
%           U(i,:) = iRows(D2_min,:); % assign to centroid data point which minimizes squared dist.
           
            %using iterative process, slow but works even on large matrices
            clear('D2_sum');  % clear variable
            for j=1:length(iRows)
               D2 = euclideanDist(iRows,iRows(j,:)); % distance between points in cluster
               D2_sum(j) = sum(D2); % sum distance for each data point
            end % loop j    
            [~, D2_min] = min(D2_sum); % index of data point which minimizes distances between points
            U(i,:) = iRows(D2_min,:); % assign to centroid data point which minimizes squared dist.
     
        % output to screen    
        fprintf('t=%d, k=%d,(takes a long time!,max t=1000 or convergence)\n',t,i);    
        end % k loop
   
        % decision whether to end
        if (isequaln(U_prev,U)) % if no change i.e. convergence
            plotClusters(X,C,U,k, true); 
            break;
        else
            U_prev = U; 
        end

        % uncomment for visualization, only uses 2 dimensions.
        %plotClusters(X,C,U,k,t==convergence);
    end % repeat until convergence
 
end % function