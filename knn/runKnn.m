
% Lorenzo Luciano 

% KNN Implementation

clear;

% load data
X = load('wpbcx.dat');
y = load('wpbcy.dat');

%==================================================================
% Run k times without any Cross-Validation 
% ========================================
% [m,n] = size(X); % number of rows(m) and features(n)
% y_pred = zeros(size(y)); % declare vector for class predictions
% 
% for k=1:50
%     for i=1:m
%         x = X(i,:); % assign x value
%         dataX = X(1:end~=i,:); % all X matrix except x 
%         dataY = y(1:end~=i); % all y vector except y of x
%         y_pred(i,k) = Knn(x,dataX,dataY,k); % get class from knn
%     end % m loop
%     % get error rates for this value of k
%     err(k,1) = k; 
%     err(k,2) = kErrorRate(y_pred(:,k),y);
% end % k loop
%==================================================================

% 10 Kfold cross-validation
indices = crossvalind('Kfold',y,10);
for cv = 1:10 % cross validation loop
    test = (indices == cv); train = ~test;
    X_train = X(train,:); y_train = y(train,:); % train data
    X_test = X(test,:); y_test = y(test,:); % test data
    % number of rows(m) and features(n) for train/test
    [m_train,n_train] = size(X_train);[m_test,n_test] = size(X_test);
    % prediction matrices
    y_pred_train = zeros(size(y_train)); y_pred_test = zeros(size(y_test)); 
    
    for k=1:30 % value of k as in knn
        % Train
        % =====
        for i=1:m_train % number of rows
            x = X_train(i,:); % assign x value
            %dataX = X_train(1:end~=i,:); % all X matrix except x 
            dataX = X_train; % all X matrix x 
            %dataY = y_train(1:end~=i); % all y vector except y of x
            dataY = y_train; % all y vector
            y_pred_train(i) = Knn(x,dataX,dataY,k); % get class from knn
        end % m loop
        % get error rates for this value of k
        Err_Train(k,1) = k;
        Err_Train(k,cv+1) = kErrorRate(y_pred_train,y_train);
                
        % Test
        % ====
        % use x from test data, but use data from train
        for i=1:m_test % number of rows
            x = X_test(i,:); % assign x value
            dataX = X_train; % all X matrix 
            dataY = y_train; % all y vector
            y_pred_test(i) = Knn(x,dataX,dataY,k); % get class from knn
        end % m loop
        % get error rates for this value of k
        Err_Test(k,1) = k;
        Err_Test(k,cv+1) = kErrorRate(y_pred_test,y_test);

    end % k loop

end % end cv loop
 
% mean error rates
% ================
me_Train = [Err_Train(:,1) mean(Err_Train(:,2:end),2)];
me_Test = [Err_Test(:,1) mean(Err_Test(:,2:end),2)];
 
% plot training and testing error rates as a function of K
% ========================================================
figure('Name','Knn Training and Testing Mean Error Rates','NumberTitle','off');
hold on; % on samer plot
title('Knn Training and Testing Mean Error Rates'); % plot title
plot(me_Train(:,1),me_Train(:,2),'-');
plot(me_Test(:,1),me_Test(:,2),'-');
xlabel('k-vlaue');
ylabel('Mean Error');
legend('Train', 'Test' ,'Location','northeast');
hold off; % on samer plot
 

