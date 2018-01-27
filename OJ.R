library(tree)
library(ISLR)
library(pROC)
library(ROCR)
library(caret)
library(e1071)

attach(OJ)

names(OJ)
set.seed(84)
N<- nrow(OJ)
train<-sample(N,800)
training.set<-OJ[train,]
test.set<-OJ[-train,]

purchase.test<-Purchase[-train]

tree.purchase<-tree(Purchase~ . , data=training.set)
summary(tree.purchase)

plot(tree.purchase)
text(tree.purchase, pretty=0)

tree.pred<-predict(tree.purchase, test.set, type="class")
table.purchase<- table(tree.pred, purchase.test)
table.purchase
confusionMatrix(table.purchase,positive="MM")