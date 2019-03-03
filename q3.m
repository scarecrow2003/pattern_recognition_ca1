function [train_error, test_error] = q3()
    lambda = [1:10, 15:5:100];
    length = size(lambda, 2);
    train_error = zeros(1, length);
    test_error = zeros(1, length);
    [xtest, xtrain, ytest, ytrain] = logtransform();
    for i=1:length
        display("lambda = " + lambda(i));
        w = train_logistic_regression(xtrain, ytrain, lambda(i));
        train_result = classify_logistic_regression(w, xtrain);
        train_error(i) = mean(abs(train_result-ytrain));
        
        test_result = classify_logistic_regression(w, xtest);
        test_error(i) = mean(abs(test_result-ytest));
        if lambda(i) == 1 || lambda(i) == 10 || lambda(i) == 100
            display("training error: " + train_error(i));
            display("test error: " + test_error(i));
        end
    end
    hold on;
    plot(lambda, train_error, 'b');
    plot(lambda, test_error, 'r');
    hold off;
end