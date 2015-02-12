%% function function [w] = kFold(x,y,k,d)
% Function which performs kFold on data x, y
% and # of folds k, from degree 1 top degree d. 
%
% To find best degree for polynomial regression.
% 
% Returns weights w of best fit
%
% =====================================================
%
function [w] = kFold(x,y,k,d)
    
    s = length(x); %number of rows(observations)

    K = zeros(k,2); % create matrix of k X 2 to hold fold indexes

    fold_size = s/k;

    %determine fold indexes
    for idx_k = 1:k
        c1 = ((idx_k-1)*fold_size) + 1; % from: row 
        c2 = idx_k*fold_size; % to: row
        K(idx_k,:) = [c1 c2];
    end

    J_train = zeros(d,k); % create matrix of d X k to hold training errors
    J_cv = zeros(d,k); % create matrix of d X k to hold CV errors

    %run k folds training, CV's
    for idx_k = 1:k % k = fold iteration

        %Cross Validation fold 
        x_cv = x(K(idx_k,1):K(idx_k,2)); %extract from x for CV
        y_cv = y(K(idx_k,1):K(idx_k,2)); %extract from y for CV

        %iteration for for training folds
        for idx_t = 1:k-1 %1:k-1 
            next_k=mod((idx_t+idx_k-1),k)+1; %next k revolving folds(the +1 is because index starts at 1)
            if idx_t == 1
                x_train = x(K(next_k,1):K(next_k,2));
                y_train = y(K(next_k,1):K(next_k,2));
            else    
                x_train = [x_train ; x(K(next_k,1):K(next_k,2))];
                y_train = [y_train ; y(K(next_k,1):K(next_k,2))];
            end    
        end % end iteration for training folds   

        %training and CV for up to d degree polymonial
        for idx_d = 1:d % degree
              % train using training data         
              [~, J_train(idx_d,idx_k),W] = PolyRegress(x_train,y_train,idx_d);
              X_cv = addDegrees(x_cv, idx_d); %add degrees to x_CV data
              J_cv(idx_d,idx_k) = computeError(X_cv, y_cv, W); % get error for CV data
        end %end iteration for # of degress

    end %end iteration for # of folds

    J_train_avg = mean(J_train,2); % train avg error for each degree(for each fold)
    J_cv_avg = mean(J_cv,2); % CV avg for each degree(for each fold)


    [lowest_J, best_d] = min(J_cv_avg); % best d polynomial 

    [y_fit, J, w] = PolyRegress(x,y,best_d); % w for best degree fit

    % Plot the best polynomial fit
    str_title = strcat('Best Polynomial Model = Degree-', num2str(best_d));
    figure('Name',str_title,'NumberTitle','off');
    plotFunc(x,y,w); %plot data points x,y and function given by w
    title(str_title);
    y_func = getFunc(w); %get function given by w 

    % Results
    fprintf('\nAverage CV error rates for each degree are as follows:\n');
    for i = 1:d
       fprintf('error rate for degree: %d -> %f\n', i, J_cv_avg(i)); 
    end   
    fprintf('\nError for best polynomial model(degree %d) =  %f\n',best_d,J);
    fprintf('Polynomial model function for best degree: \n%s\n\n',func2str(y_func));
    
end % end function kFold(x,y,k,d)
