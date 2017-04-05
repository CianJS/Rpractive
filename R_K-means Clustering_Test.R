install.packages("caret")
install.packages("iterators")
install.packages("rpart")
library(caret)
library(rpart)

set.seed(123)

inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]

iris.kmeans <- kmeans(training[,-5], centers=3, iter.max=10000)

training$cluster <- as.factor(iris.kmeans$cluster)

table(training$Species, training$cluster)

training.data <- as.data.frame(training[,1:4])
modFit <- train(x=training.data[,-5], y=training$cluster, method="rpart")


#예제 1
newdata=data.frame(Sepal.Length=5, Sepal.Width=3, Petal.Length=1.6, Petal.Width=0.2)
predict(modFit, newdata[,-5], type='prob')

#예제 2
newdata1=data.frame(Sepal.Length=6.7, Sepal.Width=3.1, Petal.Length=4.7, Petal.Width=1.5)
predict(modFit, newdata1[,-5], type='prob')