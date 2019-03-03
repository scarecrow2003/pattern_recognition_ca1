function w = train_logistic_regression(xtrain, ytrain, lambda)
% the output is the trained model with parameters w and b
n = size(xtrain, 1);
m = size(xtrain, 2);
% initialize
xtrain_with_one = [ones(n, 1) xtrain];
w = zeros(m + 1, 1);
theta = 1;
epoch = 100;
for i=1:epoch
    mu = logsig(xtrain_with_one * w);
    gradient = xtrain_with_one' * (mu - ytrain);
    s = diag(mu .* (1 - mu));
    hessian = xtrain_with_one' * s * xtrain_with_one;
    g_reg = gradient + lambda * [0; w(2:m+1, 1)];
    h_reg = hessian + lambda * [zeros(1, m+1); zeros(m, 1) eye(m)];
    d = -inv(h_reg) * g_reg;
    w = w + theta * d;
end
end