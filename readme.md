### How to run the code
1. Put the data file spamData.mat in the same fold as this readme file.
2. Go to this same file in matlab.
3. Run the following command in command window for Q1:
```
q1()
```
4. Run the following command for Q2:
```
q2()
```
5. Run the following command for Q3:
```
q3()
```
6. Run the following command for Q4:
```
q4()
```

## help functions
1. binarization.m is for binarize the data.
2. logtransform.m is to transform each feature using log(xij + 0.1).

## Q1 Beta-binomial Naive Bayes
1. ```q1()``` will first call ```binarization()``` to binarize the data.
2. It will loop through alpha to do training and classify for different alpha value.
3. Inside the loop, it will first train the data by calling ```train_beta_binomial()```, then classify the training data by calling ```classify_beta_binomial()``` to calculate the training error. Then it will classify the test data to calculate the test error.
4. Finally it will plot the training and test error rates versus alpha.

## Q2 Gaussian Naive Bayes
1. ```q2()``` will first call ```logtransform()``` to log transform the data.
2. It will train the data by calling ```train_gaussian()```.
3. Then it will classify the training data by calling ```classify_gaussian()``` to calculate the training error.
4. It will classify the test data by calling ```classify_gaussian()``` to calculate the test error.

## Q3 Logistic regression
1. ```q3()``` will first call ```logtransform()``` to log transform the data.
2. It will loop through lambda to do training and classify for different lambda value.
3. Inside the loop, it will first train the data by calling ```train_logistic_regression()```, then classify the training data by calling ```classify_logistic_regression()``` to calculate the training error. Then it will classify the test data to calculate the test error.
4. Finally it will plot the training and test error rates versus lambda.

## Q4 K-Nearest Neighbors
1. ```q4()``` will first call ```logtransform()``` to log transform the data.
2. It will loop through k to do training and classify for different k value.
3. Inside the loop, it will call ```classify_knn()``` to classify the training and test data using the training data.
4. Finally it will plot the training and test error rates versus lambda.