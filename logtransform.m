function [xtest, xtrain, ytest, ytrain] = logtransform()
data = load("spamData.mat");
ytest = data.ytest;
ytrain = data.ytrain;
xtest = log(data.Xtest + 0.1);
xtrain = log(data.Xtrain + 0.1);
end