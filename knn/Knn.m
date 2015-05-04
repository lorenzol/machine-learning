%% function y_pred = Knn(x,X,y,k)
% desc: KNN model
% inputs: x sample, X data matrix, y outputs, k nearest neighbours
% output: y prediction for sample x
% 
% =====================================================
% 
function y_pred = Knn(x,X,y,k)

    yu=unique(y); % unique y's or classes
    
    % get distances for each X and sort
    y_dist = [y zeros(size(y))];    
    y_dist(:,2) = euclideanDist(X,x); % euclidean distances between x and X's
    y_dist = sortrows(y_dist,2); % sort in ascending order
    
    y_class = [yu zeros(size(yu))]; % matrix to hold class prediction counts
    
    for i=1:k
        k_class = y_dist(i,1); % class of sample k
        % increment for class prediction
        y_class(y_class(:,1)==k_class,2) = y_class(y_class(:,1)==k_class,2)+1;
    end % k loop
    
    % return class prediction with greatest votes
    max_counts = max(y_class(:,2)); % maximum counts for class y
    y_pred = y_class(y_class(:,2)==max_counts,1); % get class with maximum
    
    % if a tie return first class
    if (size(y_pred,1) > 1)
        y_pred = y_pred(1);
    end 
    
 
end % function