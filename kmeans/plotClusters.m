% desc: plot clusters and centroids
% inputs: X data , C clusters, U centroids, k clusters, t convergence
% output: plot
% 
% =====================================================
function plotClusters(X,C,U,k,t)

    figure('Name','k-means clustering','NumberTitle','off');
    title('k-means clustering');
    hold on;                % on same plot
    for i=1:k
        iRows = X(C==i,:); % get all rows belonging to centroid i
        plot(iRows(:,1), iRows(:,2),'.'); % plot data points
        plot(U(i,1), U(i,2), '*'); % plot cluster centroids
    end
    xlabel('X1');
    ylabel('X2');
    hold off

    pause(0.01);
    %pause;
    if ~t % if last update keep open
        close('k-means clustering');
    end
end % function plotClusters