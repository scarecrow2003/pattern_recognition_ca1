function beta_binomial_model = train_beta_binomial(xtrain, ytrain, alpha)
% the output is the trained model contains the log of prior
% beta_binomial_model.prior and likelihood beta_binomial_model.likelihood
total = size(ytrain, 1);
labels = 2;
% class1 is y=0, class2 is y=1
class2 = sum(ytrain);
class1 = total - class2;
beta_binomial_model.prior = zeros(labels, 1);
%todo
% estimate the prior
beta_binomial_model.prior(1) = log(class1) - log(total);
beta_binomial_model.prior(2) = log(class2) - log(total);

% estimate the likelihood
% i is the class label
for i=1:total
    % get data belong to certain class
    class_data = xtrain(ytrain == i-1, :);
    class_length = size(class_data, 1);
    % j is feature
    for j=1:size(class_data, 2)
        % k is value for each feature, 0 or 1 since we binarize the data
        for k=1:2
            beta_binomial_model.likelihood(i).feature{j}(k) =...
                log(size(find(class_data(:, j)==(k-1)), 1)+alpha) -...
                log(class_length + 2 * alpha);
        end
    end
end
end