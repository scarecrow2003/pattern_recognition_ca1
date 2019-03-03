function [train_error, test_error] = q2()
    [xtest, xtrain, ytest, ytrain] = logtransform();
    model = train_gaussian(xtrain, ytrain);
    train_result = classify_gaussian(model, xtrain);
    train_error = mean(abs(train_result-ytrain));
        
    test_result = classify_gaussian(model, xtest);
    test_error = mean(abs(test_result-ytest));
end