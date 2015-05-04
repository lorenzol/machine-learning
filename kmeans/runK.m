% Lorenzo Luciano 
% Kmeans/Kmedoids Implementation

% start with a clean slate
close all, clc, 


% load data
X = load('hw4-image.txt'); % RGB values for each pixel

%% Kmeans
% =============================================================
%X=X(1:100000,:); % for testing
[U,C,E] = Kmeans(X,8); % run kmeans with X data and n clusters

% Results
% =======

% number of clusters
n_clusters = sum(~isnan(U(:,1)));
fprintf('Number of clusters: %d\n',n_clusters);

% final centroids
fprintf('Final Centroids.\n');
U

% number of pixels associated to each cluster
fprintf('Number of pixels associated to each pixel.\n');
[du,~,dx]=unique(C);
dx=accumarray(dx,1);
r=[du,dx]

% matrix E contains the sum of squared distances from each pixel to the
% nearest centroid after every iteration
fprintf('Matrix E -> sum squares after each itreration to closest centroid.\n');


% Visualize image before and after kmeans clustering.
% image before
x_image = reshape(X,[407 516 3]);
x_image = uint8(x_image);
x_image = imrotate(x_image, 270);
imshow(x_image);

% image after
x_image_new = U(C,:); % replace pixels wih centroids
x_image_new = reshape(x_image_new,[407 516 3]);
x_image_new = uint8(x_image_new);
x_image_new = imrotate(x_image_new, 270);
imshow(x_image_new);

% view images together
subplot(1,2,1), subimage(x_image)
subplot(1,2,2), subimage(x_image_new)

%% Kmedoids
% =============================================================

% load data
X = load('hw4-image.txt'); % RGB values for each pixel
X = X(1:100000,:);
[U,C,E] = Kmedoids(X,8); % run kmeans with X data and n clusters



