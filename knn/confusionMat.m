%% function [confMat,accuracy]=confusionMat(y,y_pred)
% desc: confusion matrix
% inputs: y and y_pred(y predictions)
% output: confusion matrix and accuracy value
% 
% =====================================================
% 
function [confMat,accuracy]=confusionMat(y,y_pred)

    yu=unique(y); % number of unique classes 
    confMat=zeros(length(yu)); % initialize matrix
    for i=1:length(yu) % for all classes
        for j=1:length(yu) % for all samples
            confMat(i,j)=sum(y==yu(i) & y_pred==yu(j));
        end
    end 
    % accuracy of y-predictions
    accuracy = sum(y_pred==y)/length(y_pred);
    
end % function [confMat,accuracy]=confusionMat(y,y_pred)