%% function err = kErrorRate(y_pred,y)
% desc: KNN model error rate
% inputs: y_pred(prediction from model), y(actual y)
% output: error rate
% 
% =====================================================
function err = kErrorRate(y_pred,y)

    n = size(y,1); % size of vector
    
    nIncorrect = (y_pred ~= y); % number of incorrect predictions
    
    err = sum(nIncorrect)/n; % number incorrect/ total number
    

end % function