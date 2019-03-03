function [train_result, test_result] = classify_knn(xtrain, ytrain, xtest, k)
% the output is the classifier contains the predicted result of the
% training samples and test samples

% initialization
training_length = size(xtrain, 1);
test_length = size(xtest, 1);
total = training_length + test_length;
all_result = zeros(total, 1);
euclidean_distances = zeros(total, training_length);
idx = zeros(total, training_length);

% calculate the distance
for i=1:total
    for j=1:training_length
        if i<=training_length
            euclidean_distances(i, j) = ...
                sqrt(sum((xtrain(i, :) - xtrain(j, :)).^2));
        else
            euclidean_distances(i, j) = ...
                sqrt(sum((xtest(i-training_length, :) - xtrain(j, :)).^2));
        end
    end
    [euclidean_distances(i, :), idx(i, :)] = sort(euclidean_distances(i, :));
end

% find knn
knn = idx(:, 1:k);

% calculate the result
for i=1:total
    ones = sum(ytrain(knn(i, :)));
    if ones > k/2
        all_result(i) = 1;
    else
        all_result(i) = 0;
    end
end
train_result = all_result(1:training_length);
test_result = all_result(training_length+1:total);

end