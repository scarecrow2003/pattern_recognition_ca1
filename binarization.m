function [xtest, xtrain, ytest, ytrain] = binarization()
data = load("spamData.mat");
ytest = data.ytest;
ytrain = data.ytrain;
mean_value = mean(data.Xtrain);
xtest = hardlim(data.Xtest - mean_value);
xtrain = hardlim(data.Xtrain - mean_value);
end