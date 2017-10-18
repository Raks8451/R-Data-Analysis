install.packages("titanic")
## 1.
library(titanic)

## 2.

data("titanic")

data("titanic_train")
head(titanic_train)
View(titanic_train)


## 3.
summary(titanic_train$Age)

## 4.
summary(titanic_train$Fare)

## 5.
var(titanic_train$Age,na.rm=T)
sd(titanic_train$Age,na.rm=T)

var(titanic_train$Fare)
sd(titanic_train$Fare)

 ## 6.
IQR(titanic_train$Fare)
var(titanic_train$Pclass)
sd(titanic_train$Survived)

## 7.

titanic_train <- sample(1:500)
titanic_train


sample((1:nrow(titanic_train)),500,replace=F)


## 8.

aggregate(titanic_train$Fare,by=list(titanic_train$Pclass),FUN=mean,na.rm=TRUE)

## 9.

mean(titanic_train[titanic_train$Pclass==1,"Fare"])

mean(titanic_train[titanic_train$Pclass==2,"Fare"])

mean(titanic_train[titanic_train$Pclass==3,"Fare"])

## 11.


mean(titanic_train$Age,na.rm=T)
sd(titanic_train$Age,na.rm = T)


1- pnorm(50, mean=29.69912,sd=14.5265)

pnorm(50, mean=29.69912,sd=14.5265,lower.tail = F)

## 12.
pnorm(50, mean=29.69912,sd=14.5265)-pnorm(40, mean=29.69912,sd=14.5265)


## 13.

quantile(titanic_train$Age,probs=0.75,na.rm=T)

quantile(titanic_train$Age,0.75,na.rm=T)

qnorm(0.75,mean=29.69912,sd=14.5265)

## 14.

qnorm(0.975,mean=29.69912,sd=14.5265)-qnorm(0.025,mean=29.69912,sd=14.5265)

qnorm(c(0.025,0.975),mean=mean(titanic_train$Age,na.rm=T),sd=sd(titanic_train$Age,na.rm=T))

## 15.
## wrong one for verification
k = dnorm(titanic_train$Age,mean = 29.69912,sd=14.5265) 
?dnorm
plot(titanic_train$Age,k,type="l")

?dnorm
?rnorm

ggplot(titanic_train,aes(Age),na.rm=T)+geom_density()
plot(density(titanic$Age,na.rm=T),main = "Age Plot",xlab = "Age",ylab = "Density")


## 16.

scale(titanic_train$Fare)

zscore=function(x){
  return((x-mean(x))/(sd(x)))
}
zscore(titanic_train$Fare)

z=(titanic_train$Fare-mean(titanic_train$Fare))/sd(titanic_train$Fare)
z
range(z)
range(titanic_train$Fare)

## 17.

sdn = (titanic_train$Fare-min(titanic_train$Fare))/(max(titanic_train$Fare)-min(titanic_train$Fare))
sdn
range(sdn)

minmax=function(x){
  return((x-min(x))/(max(x)-min(x)))
}
 
minmax(titanic_train$Fare)
View(titanic_train)


## 18.

aggregate(titanic_train$Age, by=list(titanic_train$Sex),FUN=mean,na.rm=TRUE)


## when there is "by" use aggregate

## 19.
 














