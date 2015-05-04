%% function [confMat,accuracy]=confusionMat(y,y_pred)
% =====================================================
% Function to calculate confusion matrix 
% given y and predicted values y_pred
%
function [confMat,accuracy]=confusionMat(y,y_pred)

    yu=unique(y);
    confMat=zeros(length(yu));
    for i=1:length(yu)
        for j=1:length(yu)
            confMat(i,j)=sum(y==yu(i) & y_pred==yu(j));
        end
    end 
    
    accuracy = sum(y_pred==y)/length(y_pred);
    
end % function [confMat,accuracy]=confusionMat(y,y_pred)