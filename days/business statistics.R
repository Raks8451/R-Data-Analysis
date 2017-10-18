#####         Statistics


## 1. Quantitative variables --> these are measurable

#####  i.   continuous variables --> measurable values eg: height(5,5.5,6.2), age(21.5,54.6), experience(1.15,4.5,6.2) --> Float data types
#####  ii.  ordinal variables --> (derieved variables do not follow mathematical order) character or numeric in nature but follow typical order --> eg: rank1,rank2...
#####  iii. Bionomial --> 1 or 0 binary values (active and inactive)



# 2. Qualitative Variables -->not measurable defines the quality-->representing the information

#####  i.  discrete or categorical --> some discrete values (no dependency)

### binomial and multinomial

#########################################################################################################

#####  i.   continuous variables



####   Descriptive Statistics --> Describes some Data --> picking one observation that describes every obs in thr group

##### Mean, Median --> Measures of central tendencies
#####  the obs which is far away is called outliars.
#####   Median is the 50th percentile
#####   Q1 is the 25th percentile
#####   Q3 is the 75th percentile



###### Measures of spread ---> Standard Deviation, Variance


a <- c(10,15,16,17,34,35,56,78,65,78)

a <- c(10,15,16,21,22,25,26,31,32,33,34,35,36,37,38,44,46,48,49,50,55,56)

#### descriptive statistics
summary(a)

## Measures of spread
var(a)## variance 
sd(a)## standard distribution

## distribution

hist(a)
hist(a, breaks=10)

sd(a)
mean(a)


## shape of the distribution using density function

k = dnorm(a,mean = 34.6,sd=13.4) 
k

plot(a,k,type="l")

?dnorm


## probability of a normal distribution

pnorm(40, mean=34.6,sd=13.6)

### probability of having a salary of atleast 30L when meam=25L sd=5L

pnorm(3000000, mean=2500000, sd=500000)

### probability (percentage of emp) having a salary b/w 32L and 30L

pnorm(3200000,mean=2500000,sd=500000)-pnorm(3000000,mean=2500000,sd=500000)



### probability (percentage of emp) having a salary b/w 30L and 25L

pnorm(3000000,mean=2500000,sd=500000)-pnorm(2500000,mean=2500000,sd=500000)


## probability of having a salary of gt 40L

1- pnorm(4000000, mean=2500000,sd=500000)


 1 + pnorm(1500000, mean=2500000,sd=500000)
 
 
 1- pnorm(1500000, mean=2500000,sd=500000)
 





### qnorm is the opposite of pnorm

qnorm(0.3,mean=2500000,sd=500000)

qnorm(0.84,mean=2500000,sd=500000)

qnorm(0.25,mean=2500000,sd=500000)

qnorm(0.99,mean=2500000,sd=500000)

qnorm(0.75,mean=2500000,sd=500000)

qnorm(0.5,mean=2500000,sd=500000)

qnorm(0.6,mean=2500000,sd=500000)-qnorm(0.4,mean=2500000,sd=500000)

qnorm(0.4,mean=2500000,sd=500000)-qnorm(0.6,mean=2500000,sd=500000)

## hypothesis testing


girls=c(7,8,9,9,6,7,8,5,6,8,9,8,6,7,8,6,7,9,9)
length(girls)
boys=c(5,4,5,4,6,7,8,7,8,7,9,8,7,6,8,9,8,7,6)
length(boys)




mean(girls)
mean(boys)

## t test
t.test(girls,boys,alternative = "greater")
t.test(boys,girls,alternative = "greater")


setwd("D:\\Rakshith\\Documents\\R programming\\R exercise data")
getwd()

## chisq test
credit <- read.csv("CREDIT.csv")
tb1 <- table(credit)
tb1





install.packages("MASS")
library(MASS)
data("survey")
head(survey)
View(survey)
tbl <- table(survey$Smoke, survey$Exer) 
tbl

chisq.test(table(survey$Smoke, survey$Exer))
 
## ANOVA
## f-test

a = c(24,26,31,27,8)

b = c(29,31,30,36,33)

c = c(29,27,34,26,23)
 
df=data.frame(a,b,c)

fit = aov(c ~ a+b,data = df) 
summary(fit)

fit2=lm(c~a+b,data=df)
summary(fit2)























