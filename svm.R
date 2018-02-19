library(e1071)
library("caret")
library("caTools")

cancerData <- read.csv("wisc_bc_data.csv") 

head(cancerData)
str(cancerData)

cancerData$group <- factor(cancerData$diagnosis)
cancerData$group
set.seed(1000)
split = sample.split(cancerData$diagnosis, SplitRatio = 0.65)

options("scipen"=999, "digits"=8)
# Split up the data using subset
train = subset(cancerData, split==TRUE)
test = subset(cancerData, split==FALSE)
testValues = test$diagnosis

#Fit a model. The function syntax is very similar to lm function

model_svm <- svm(diagnosis ~ .-id, train)

#Use the predictions on the data

pred <- predict(model_svm, test)


#Plot the predictions and the plot to see our model fit

table(pred, test$diagnosis)

