## base plotting in R

## at first it was ggplot2 but now it is ggplot  --> gg:grammer of graphics

## use iris dataset

attach(iris)
Iris_demo <- iris
View(Iris_demo)
str(Iris_demo)
?plot

## scatter plot --> this is mainly used for finding the correlation between the values

## syntax <-  plot(X,Y,.....)

plot(Iris_demo$Sepal.Length,Iris_demo$Sepal.Width)

points(Iris_demo$Petal.Length,Iris_demo$Petal.Width,col="blue")

## for finding the correlation values
cor(Iris_demo$Sepal.Length,Iris_demo$Sepal.Width)



plot(Iris_demo$Petal.Length,Iris_demo$Petal.Width)

points(Iris_demo$Sepal.Length,Iris_demo$Sepal.Width,col="red")

## identify the three species

plot(Iris_demo$Sepal.Length,Iris_demo$Sepal.Width,col=Iris_demo$Species)
legend(7.0,4.5,legend=c("setosa","versicolor","virginica"),col=c("black","red","green"),pch=0.4)

plot(Iris_demo$Sepal.Length,col=Iris_demo$Species)
plot(Iris_demo$Sepal.Length,Iris_demo$Sepal.Width,type="p",col=Iris_demo$Species,main = "Demo Plot in Iris Dataset",sub="Plot example",xlab="Length",ylab = "width")


## histogram


## sytax --> hist(x,.....)

?hist

hist(Iris_demo$Sepal.Width)
max(Iris_demo$Sepal.Width)
min(Iris_demo$Sepal.Width)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",breaks = c(1,2,3,4,5,6),freq = F)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",breaks = c(1:6),freq = F)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",breaks = c(1,2,3,4,5,6),freq = F)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",breaks = 5,freq = F)

## density=counts/n*diff(breaks)

## density as parameter

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",density = 20)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",density = 2000)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",density = 50)

hist(Iris_demo$Sepal.Width, main = "Demo histogram in IRIS dataset",xlab = "width",border = "black",col = "green",density = 200)


## box plots --> useful for latge quantitative information

# syntax --> boxplot()

boxplot(Iris_demo$Sepal.Length)
boxplot(Iris_demo)

## to display name vertically
boxplot(Iris_demo,las=2)

boxplot(Iris_demo,las=1)

boxplot(Iris_demo,las=3)

## to rename each variable
boxplot(Iris_demo,las=1,names = c("S_L","S_w","P_L","P_W","species"))

boxplot(Iris_demo,las=2,names = c("S_L","S_w","P_L","P_W","species"))

boxplot(Iris_demo,las=3,names = c("S_L","S_w","P_L","P_W","species"))



boxplot(Iris_demo,las=1,names = c("S_L","S_w","P_L","P_W","species"),col = c("red","green","blue","black","pink"))

## grab the outlier

outlier <- boxplot(Iris_demo$Sepal.Width)
outlier

outlier1 <- boxplot(Iris_demo$Sepal.Width,plot = F)$out
outlier1


## compare each species type and petal length

boxplot(Iris_demo$Petal.Length ~ Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"))

## notched boxplot --> display the confidence interval
## the median

boxplot(Iris_demo$Petal.Length,Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"),notch=F)

boxplot(Iris_demo$Petal.Length ~ Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"),notch=T)

x <- boxplot(Iris_demo$Petal.Length ~ Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"),notch=T)
x


## horizontal boxplot

boxplot(Iris_demo$Petal.Length ~ Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"),notch=T,horizontal = T)

boxplot(Iris_demo$Petal.Length ~ Iris_demo$Species,xlab="Species Type",ylab="petal length",main="Iris Data",col=c("red","green","blue"),notch=F,horizontal=T)


## pie charts

## syntax--> pies(x,labels)

## x: vector containing the numeric value
## labels: give the descriptions

mytable <- table(iris$Species)
mytable
pie(mytable,labels =c("setosa","versicolo","virginica"))
pie(mytable,labels = Iris_demo$Species)
str(iris)

## use pie percent
pie(mytable,labels = round(100*mytable/sum(mytable),1))

## use Legends

pie(mytable,labels = round(100*mytable/sum(mytable),1),col = c("red","green","blue"))

pie(mytable,labels = round(100*mytable/sum(mytable),1),col = c("red","green","blue"),density=50)
legend("topright",c("setosa","versivolor","virginica"),cex = 1.5,fill = c("red","green","blue"))


## limitation of base package 
## static graphs
## can not use to create complex visualization
## just an image can't be manipulated

## ggplot --> grammer of graphics

install.packages("ggplot2")
library(ggplot2)

help.search("geom_",package = "ggplot2")

## create visualization using ggplot
View(mtcars)

attach(mtcars)
library(ggplot2)
ggplot(data = mtcars,aes(x=cyl,y=mpg))+geom_point()

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg))+geom_point()


## scatter plots in ggplot
## add additional parameter called shape

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg))+ geom_point(shape=1,size=2)

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg))+ geom_point(shape=2,size=2)

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg))+ geom_point(shape=3,size=2)

## size parameter in aesthetics


ggplot(data = mtcars,aes(x=factor(cyl),y=mpg,size=hp)) + geom_point()

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg,size=hp)) + geom_point(shape=1)

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg,size=hp)) + geom_point(shape=2)

ggplot(data = mtcars,aes(x=factor(cyl),y=mpg,size=hp)) + geom_point(shape=3)

?factor

## apply multiple variablesin 2 D space

ggplot(data = mtcars,aes(x=wt,y=mpg,col=hp,size=disp))+geom_point()


## size parameter in the geom will override the size parameter of aes

## use geom text in plot

ggplot(data = mtcars,aes(x=wt,y=mpg))+geom_text(aes(label=gear))

ggplot(data = mtcars,aes(x=wt,y=mpg))+geom_text(aes(label=cyl))


View(mtcars)


## where ever you want to introduce variability we can use aesthetic

ggplot(data = mtcars,aes(x=wt,y=mpg))+geom_point()+geom_line(aes(y=qsec))

##########################################

## exercise 1
## 1. use reshape2 package
install.packages("reshape2")
library(reshape2)

## 2.use tips data set
attach(tips)
View(tips)

## 3.create a scatter plot with "total bill" in x and "tip" in y
ggplot(data = tips,aes(x=total_bill,y=tip))+geom_point()

## 4.color all points blue
ggplot(data = tips,aes(x=total_bill,y=tip))+geom_point(color="blue")


##5.make all the points bigger by setting size=3
ggplot(data = tips,aes(x=total_bill,y=tip))+geom_point()
ggplot(data = tips,aes(x=total_bill,y=tip))+geom_point(color="blue",size=3)

## 6.vary the size of the points on the size of the party
ggplot(data = tips,aes(x=total_bill,y=tip,size=size))+geom_point()


#############################################


## visualizing the large dataset
View(diamonds)
attach(diamonds)
str(diamonds)

ggplot(data = diamonds,aes(x=carat,y=price))+geom_point()

## when the points in the scatter plots are cluttered use smooth line can visualize the underlying relationship between the variables


ggplot(data = diamonds,aes(x=carat,y=price))+geom_point()+ geom_smooth()

## points are not adding much value we can remove those
ggplot(data = diamonds,aes(x=carat,y=price))+ geom_smooth()

## add clarity variable in our graph

temp <- ggplot(data = diamonds,aes(x=carat,y=price,col=clarity))+geom_smooth() 
temp




install.packages("directlabels")
library(directlabels)
direct.label(temp,list(last.points,hjust=.5,vjust=.5))


## add clarity in our point graph

ggplot(data = diamonds,aes(x=carat,y=price,col=clarity))+geom_point()

## add transparency factor using alpha 

ggplot(data = diamonds,aes(x=carat,y=price,col=clarity))+geom_point(alpha=0.4)

### lets see how can we use ggplot in more
## plots as object

diamond_plot <- ggplot(diamonds,aes(x=carat,y=price))

diamond_plot+geom_smooth()

## bar chart

cyl_am <- ggplot(mtcars,aes(x=factor(cyl)))
cyl_am+geom_bar()

cyl_am <- cyl_am+aes(fill=factor(am))

## absolute bar chart

cyl_am+geom_bar()

## if we are not intrested in actual values
## stacked bar chart


ggplot(mtcars,aes(x=factor(cyl),fill=factor(am)))+geom_bar(position = "stack")

cyl_am+geom_bar(position = "fill")


## dodge bar graph

cyl_am+geom_bar(position = "dodge")


## histogram

ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 4)

mycolor="blue"
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 4,fill=mycolor)

## working on time series data


attach(economics)
str(economics)
View(economics)
head(economics)

ggplot(economics,aes(x=date,y=unemploy))+geom_line()

ggplot(economics,aes(x=date,y=unemploy/pop))+geom_line()

ggplot(economics,aes(x=date,y=unemploy/pop,col=psavert))+geom_line()

ggplot(economics,aes(x=date,y=unemploy/pop,col=psavert))+geom_line()+geom_point()




### statistical transformation

## theme

temp <- ggplot(economics,aes(x=date,y=pop)) + theme(legend.position = "top")+geom_point(aes(color=unemploy))
temp

temp+scale_color_continuous(name="",breaks=c(3000,10000,15000),labels=c("3000","10000","15000"))

temp+scale_color_continuous(name="",breaks=c(3000,10000,15000),labels=c("3000","10000","15000"),low="blue",high="red")

## faceting

## create seperate graphs for subsets of data

temp1 <- ggplot(tips,aes(x=total_bill,y=tip))
temp1+geom_line(aes(color=size))

temp1+geom_line()+facet_wrap(~size,ncol=6)









































