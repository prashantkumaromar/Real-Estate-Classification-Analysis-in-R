
# EAS 508 Project 2
#Project #2 is a classification project. The data set is presented in the attached project2.txt file. The first four columns represent four quantitative predictors. The fifth column stands for a categorical response, with two categories coded as 0 and 1. Task is to build a predictive model that minimizes test misclassification rate. Estimate this rate by cross-validation. Use at least four different classification methods learned in this class.
# Methods 1 and 2: Linear Discriminant Analysis (LDA) and Quadratic Discriminant Analysis (QDA)

library(MASS)
data = read.csv('proj2data.txt')
dataset <- data[c('X1', 'X2', 'X3', 'X4', 'Y')]

# shuffle data so we can make training and test sets:
shuffled_data= dataset[sample(1:nrow(dataset)), ]

fit1 <- data.frame(shuffled_data)
n <- dim(fit1)[1]
rows <- sample(1:n,n/3)
train <- data.frame(fit1[-rows,])
test <- data.frame(fit1[rows,])

#Method 1: LDA

# Without cross validation:
lda.fit <- lda(Y ~ X1+X2+X3+X4, data = train)
lda.pred <- predict(lda.fit , test)
lda.class <- lda.pred$class
table(lda.class , test$Y)
mean(lda.class != test$Y)

# Misclassification rate is 0.02188184


# With cross validation:

lda.cv <- lda(Y ~ X1+X2+X3+X4, CV=TRUE, data = shuffled_data)
table(shuffled_data$Y, lda.cv$class, dnn = c('Actual Group','Predicted Group'))
mean(lda.cv$class != shuffled_data$Y)

# Misclassification rate is 0.02332362

# Method 2: QDA

qda.fit <- qda(Y ~ X1+X2+X3+X4, data = train)
qda.pred <- predict(qda.fit , test)
qda.class <- qda.pred$class
table(qda.class , test$Y)
mean(qda.class != test$Y)

# Misclassification rate is 0.0131291

# with cross validation:

qda.cv <- qda(Y ~ X1+X2+X3+X4, CV=TRUE, data = shuffled_data)
table(shuffled_data$Y, qda.cv$class, dnn = c('Actual Group','Predicted Group'))
mean(qda.cv$class != shuffled_data$Y)

# Misclassification rate is 0.01676385


#Method 3: Naive Bayes
data<- read.table('proj2data.txt',header=FALSE,sep=',')
View(data)
dataset <- data[c('V1', 'V2', 'V3', 'V4', 'V5')]

# shuffle data so we can make training and test sets:
shuffled_data= dataset[sample(1:nrow(dataset)), ]

fit1 <- data.frame(shuffled_data)
n <- dim(fit1)[1]
rows <- sample(1:n,n/3)
train <- data.frame(fit1[-rows,])
test <- data.frame(fit1[rows,])

# Without cross validation:
library(e1071)
nb.fit <- naiveBayes(V5 ~ V1+V2+V3+V4, data = train)
nb.class <- predict(nb.fit, test)
tab1<-table(nb.class, test$V5)
1 - sum(diag(tab1)) / sum(tab1)
mean(nb.class == test$V5)
#Misclassification is around 0.1553611
#Naive Bayes performs very well with accurate predictions over 84% of the time.


#with cross validation
nb.cv <- naiveBayes(V5 ~ V1+V2+V3+V4, CV=TRUE, data = shuffled_data)
pred <- predict(nb.cv, shuffled_data)
tab2<-table(shuffled_data$V5, pred, dnn = c('Actual Group','Predicted Group'))
mean(pred != shuffled_data$V5)
#Misclassification is around 0.1588921




# Method 4: KNN


library(MASS)
data = read.csv('proj2data.txt')
dataset <- data[c('X1', 'X2', 'X3', 'X4', 'Y')]

# shuffle data so we can make training and test sets:

shuffled_data= dataset[sample(1:nrow(dataset)), ]

fit1 <- data.frame(shuffled_data)
n <- dim(fit1)[1]
rows <- sample(1:n,n/3)
train <- data.frame(fit1[-rows,])
test <- data.frame(fit1[rows,])


# cross-validate to find best k value:

library(ISLR2)
library(class)
trainMat <- data.frame(X1 = train$X1, X2 = train$X2, X3 = train$X3, X4 = train$X4)
testMat <- data.frame(X1 = test$X1, X2 = test$X2, X3 = test$X3, X4 = test$X4)                                                          
testError <- rep(0,50)
for (k in 1:50){
  knn.pred <- knn(train = trainMat, test = testMat,cl = train$Y, k = k)
  testError[k] <- mean(knn.pred!=test$Y)
}

testError

# the lowest non-null misclassification rate occurs when k = 8

# the error rate at k = 8 is 0.010940919.








