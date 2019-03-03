function class = classify_logistic_regression(w, xtest)
n = size(xtest, 1);
class = round(logsig([ones(n, 1) xtest] * w));
end