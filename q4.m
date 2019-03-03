function [train_error, test_error] = q4()
    k = [1:10, 15:5:100];
    length = size(k, 2);
    train_error = zeros(1, length);
    test_error = zeros(1, length);
    [xtest, xtrain, ytest, ytrain] = logtransform();
    for i=1:length
        display("k = " + k(i));
        [train_result, test_result] = classify_knn(xtrain, ytrain, xtest, k(i));
        train_error(i) = mean(abs(train_result-ytrain));
        test_error(i) = mean(abs(test_result-ytest));
        if k(i) == 1 || k(i) == 10 || k(i) == 100
            display("training error: " + train_error(i));
            display("test error: " + test_error(i));
        end
    end
    hold on;
    plot(k, train_error, 'b');
    plot(k, test_error, 'r');
    hold off;
end