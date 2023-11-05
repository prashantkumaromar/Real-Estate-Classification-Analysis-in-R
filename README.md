# Real-Estate-Classification-Analysis-in-R
This R project applies LDA, QDA, Naive Bayes, and KNN methods to classify real estate data. It aims to minimize misclassification rates, using cross-validation for accuracy assessment. The dataset includes quantitative predictors and a categorical response.


## Project Overview
Project 2 is a classification project using a dataset with four quantitative predictors and a categorical response coded as 0 and 1. The goal is to build predictive models minimizing the test misclassification rate, estimated via cross-validation. We employ four different classification methods: Linear Discriminant Analysis (LDA), Quadratic Discriminant Analysis (QDA), Naive Bayes, and K-Nearest Neighbors (KNN).

## Dataset
The dataset `proj2data.txt` consists of five columns:
- `X1`, `X2`, `X3`, `X4`: Quantitative predictors
- `Y`: Categorical response (0 or 1)

## Methodologies

### Linear Discriminant Analysis (LDA)
LDA is used to model the decision boundaries linearly. It's applied with and without cross-validation.

#### Results:
- Misclassification Rate without CV: 0.02188184
- Misclassification Rate with CV: 0.02332362

### Quadratic Discriminant Analysis (QDA)
QDA provides a quadratic decision boundary. It's evaluated similarly to LDA.

#### Results:
- Misclassification Rate without CV: 0.0131291
- Misclassification Rate with CV: 0.01676385

### Naive Bayes
This method applies Bayes theorem with strong independence assumptions between the predictors.

#### Results:
- Misclassification Rate without CV: ~0.1553611
- Misclassification Rate with CV: ~0.1588921

### K-Nearest Neighbors (KNN)
KNN is used with different values of `k` to find the model with the lowest misclassification rate.

#### Results:
- Lowest non-null misclassification rate at `k = 8`
- Error Rate at `k = 8`: 0.010940919

## Libraries Used
- `MASS`
- `e1071`
- `class`
- `ISLR2`

## Conclusion
The project demonstrates the application of different classification techniques in R. KNN with `k = 8` provided the lowest error rate among the methods used. It highlights the importance of cross-validation in model assessment.

## Usage
To replicate the analysis, load the dataset `proj2data.txt` and follow the methodologies as described in each section.

## Contributions
Contributions to enhance the analysis or implement additional methods are welcome.

