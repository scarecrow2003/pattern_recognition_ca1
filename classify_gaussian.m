function class = classify_gaussian(model, xtest)
length = size(xtest, 1);
features = size(xtest, 2);
class = zeros(length, 1);
for i=1:length
    p1 = model.prior(1);
    for j=1:features
        mu = model.likelihood(1).feature{j}(1);
        sigmasquare = model.likelihood(1).feature{j}(2);
        c = -log((2*pi*sigmasquare)^0.5)-(xtest(i, j)-mu)^2/(2*sigmasquare);
        if c ~= -Inf
            p1 = p1 + c;
        else
            class(i) = 1;
            break;
        end
    end
    p2 = model.prior(2);
    for j=1:features
        mu = model.likelihood(2).feature{j}(1);
        sigmasquare = model.likelihood(2).feature{j}(2);
        c = -log((2*pi*sigmasquare)^0.5)-(xtest(i, j)-mu)^2/(2*sigmasquare);
        if c ~= -Inf
            p2 = p2 + c;
        else
            class(i) = 0;
            break;
        end
    end
    if (p1 > p2)
        class(i) = 0;
    else
        class(i) = 1;
    end
end
end