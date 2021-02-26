%% Hw 1: K-means clustering
% Class: ECE133A
% Author:  Thomas Kost
% UID: 504989794
% Date: 1/15/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear,clc,close all;

%% Read in data and set params
load mnist_train.mat;
digit_lim = 10000;
digits = digits(:, 1:digit_lim);
k =20;
min_error_term = 10e-5;

% Create initial group assignment
group = randi(k, 1, digit_lim);
reps = zeros(size(digits,1),k);

%% Execute K-means
for i =1:k
    Ind = find(group == i);
    reps(:,i) = mean(digits(:,Ind),2);
end
J_prev = inf;

while(abs(k_means_error(reps,digits,digit_lim,k) - J_prev) > ...
        min_error_term*k_means_error(reps,digits,digit_lim,k))
    
    J_prev = k_means_error(reps,digits,digit_lim,k);
    
    % recluster
    for i =1:digit_lim
        
        diff = digits(:,i)*ones(1,k) - reps(:,:);        
        diff_norms = vecnorm(diff);
        diff_norms_sq = diff_norms.^2;
        [~,group(i)] = min(diff_norms_sq, [],2);
    end
    
    % regroup
    for i =1:k
        Ind = find(group == i);
        reps(:,i) = mean(digits(:,Ind),2);
    end    
end

% display representatives
fig = figure(1);
for k=1:20
    subplot(4,5,k);
    imshow(reshape(reps(:,k), 28, 28));
end

saveas(fig, "clusters.jpg");
% error function
function error_term = k_means_error(reps, data, length,clusters);
    error_term = 0;
    for i =1:length
        diff = data(:,i)*ones(1,clusters) - reps(:,:);        
        diff_norms = vecnorm(diff);
        diff_norms_sq = diff_norms.^2;
        error_term = error_term + min(diff_norms_sq, [],2);
    end
    error_term = error_term/length;
end
