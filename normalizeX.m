%% function [X_normalized] = normalizeX(X)
% Function normalizeX
% normalizes all the input features of X by the max of each feature
%
% =====================================================
%
function [X_normalized] = normalizeX(X)

    % get the highest values of x(for each column) in matrix X
    max_vector = max(X); 
    
    max_vector2 = diag(max_vector);  % creat diagonal matrix of max values 
    
    X_normalized = X / max_vector2;  % normalize X with max values
    
end % function normalizeX
