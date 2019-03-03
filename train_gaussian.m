function gaussian_model = train_gaussian(xtrain, ytrain)
% the output is the trained model contains the log of prior
% gaussian_model.prior and likelihood gaussian_model.likelihood
total = size(ytrain, 1);
labels = 2;
% class1 is y=0, class2 is y=1
class2 = sum(ytrain);
class1 = total - class2;
gaussian_model.prior = zeros(labels, 1);
%todo
% estimate the prior
gaussian_model.prior(1) = log(class1) - log(total);
gaussian_model.prior(2) = log(class2) - log(total);

% estimate the likelihood
% i is the class label
for i=1:total
    % get data belong to certain class
    class_data = xtrain(ytrain == i-1, :);
    class_length = size(class_data, 1);
    % j is feature
    for j=1:size(class_data, 2)
        mu = sum(class_data(:, j)) / class_length;
        % 1 represent mean
        gaussian_model.likelihood(i).feature{j}(1) = mu;
        % 2 represent variance
        gaussian_model.likelihood(i).feature{j}(2) = ...
            sum((class_data(:, j) - mu).^2) / class_length;
    end
end
end