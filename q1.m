function [train_error, test_error] = q1()
    alpha = 0:0.5:100;
    length = size(alpha, 2);
    train_error = zeros(1, length);
    test_error = zeros(1, length);
    [xtest, xtrain, ytest, ytrain] = binarization();
    for i=1:length
        display("alpha = " + alpha(i));
        model = train_beta_binomial(xtrain, ytrain, alpha(i));
        train_result = classify_beta_binomial(model, xtrain);
        train_error(i) = mean(abs(train_result-ytrain));
        
        test_result = classify_beta_binomial(model, xtest);
        test_error(i) = mean(abs(test_result-ytest));
    end
    hold on;
    plot(alpha, train_error, 'b');
    plot(alpha, test_error, 'r');
    hold off;
end