##### data Preparation(pre-processing)

## 1. data cleaning
## 2. Feature Engineering


########################
#            DATA CLEANING
########################

##  In this section we will see
   ## important data

## basic data cleaning

## 1. de-duplication'
## 2. removing redundancy
## 3. correcting data types

## Feature specific data cleaning

# 1. missing value treatment
# 2. outlier treatment



setwd("D:\\Rakshith\\Documents\\R programming\\R exercise data")
census <- read.csv("income_Census.csv",header=F)

View(census)

names(census)<- c("age","industrycode","education","educationnum","maritalstatus","relationship","race","gender","capitalgain","capitalloss","hoursperweek","GT50K")
str(census)


## 1. de-duplication --> manual process, 



## check the duplicate

sum(duplicated(census))

## removing duplicates - first way
df <- unique(census)
df
View(df)
sum(duplicated(df))

## second one

df1<- census[!duplicated(census),]
sum(duplicated(df1))

## third way--> only if primary key exists
## df1<- census[!duplicated(census$PrimaryKeyColumn)]

## 2. removing redundancy
## homonyms (same columns names but different informations)
## synonyms (different columns names but same informations)


## to deal with homonyms --> change column names

colnames(census)[1] <- "AGE"

colnames(census)[c(1,2,3)] <- c("AGE","IndustryCode","Education")

## to deal with synonyms--> delete one column

## correct format
str(census)
census$educationnum <- as.factor(census$educationnum)
View(census)
str(census)

## correct the date format

as.Date('1/15/2001',format='%m/%d/%Y')
as.Date('April 26 2001',format='%B %d %Y')
as.Date('22Jun01',format='%d%b%y')


## change the default format of R
format(as.Date('1/13/99',format='%m/%d/%y'),'%d-%m-%Y')

## why missing values and outlier occur?
 ## way of collection
 ## method of the storage in wharehouse
 ## way of importing from different sources

## impact of outlier
## wrong information(but not always)

## impact of missing value
 ## represents a loss of information
 ## reduce accuracy

## missing value treatment
## 1. remove the missing values 
## impact(loss of information)
## 2. replace with appropriate values - (zero, mean) --> numeric values, mode--> categorical variables

sum(is.na(census$AGE))

## calculate the mean

instance.mean <- round(mean(census$AGE,na.rm=T),0)
instance.mean

## replace the missing value with mean

census$AGE[is.na(census$AGE)] <- instance.mean 

census$capitalgain[is.na(census$capitalgain)]<-0
sum(is.na(census$capitalgain))

View(census)

census$gender[census$gender=='?']<-NA
sum(census$gender=='?')
table(census$gender)

sum(is.na(census$gender))
str(census)
census$gender<-as.character(census$gender)
table(census$gender)
## mode--> male

census$gender[is.na(census$gender)]<-"Male"
census$gender<-as.factor(census$gender)
str(census)
table(census$gender)
unique(census$gender)


### factor is for uniques varibles and also used for plotting the graphs in a right manner

## 3. regression technique (advance)

## outlier treatment

setwd("D:\\Rakshith\\Documents\\R programming\\NEW")
## importing the dataset

credit<-read.csv("credit (3).csv")

## outlier identification and treatment

## 1. outliers can be detected using boxplot or by generating normal distribution
## 2. to treat the outlier, flooring and capping can be 


boxplot(credit$amount)

outlier_values<- boxplot.stats(credit$amount)$out

## outlier treatment
## imputation
## capping and flooring

x<-credit$amount
boxplot(x)
qnt<-quantile(x,probs=c(.01,.02,.03,.04,.05,.1,.15,.2,.25,.3,.35,.4,.45,.5,.55,.6,.65,.7,.75,.8,.85,.9,.95,1),na.rm=T)

qnt
caps<- quantile(x,probs=c(.05,.95),na.rm=T)
caps
H <- 1.5*IQR(x,na.rm = T) 
H

x[x<(qnt[1]-H)]<-caps[1]
x[x>(qnt[2]+H)]<-caps[2]


boxplot(x)

#################################################3

## feature engineering
## feature extraction


census$Workload[census$hoursperweek>45] <- "High"
census$Workload[census$hoursperweek<40] <- "Low"
census$Workload[which(census$hoursperweek<=45 & census$hoursperweek>=40)] <- "Med"
str(census)
View(census)

## feature transformation

## log transformation --> for right skewed

## square --> for left skewed
## square root --> right skewed
## reciprocal --> makes bigger points smaller and vice cersa

## feature standardization--> mean=0, sd=1
## feature normalization(z-score normalization =())

























