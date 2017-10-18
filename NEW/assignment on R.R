setwd("D:\\Rakshith\\Documents\\R programming\\R exercise data")


getwd()
train <- read.csv("train.csv")
str(train)
View(train)




train1 <- head(train,20)



## 1.
train$Stay_In_Current_City_Years <- ifelse(train$Stay_In_Current_City_Years=="4+",4,train$Stay_In_Current_City_Years)
View(train)


## 2. 
nrow(train[train$Marital_Status==0,])
sum(train$Marital_Status==0)
sum(train$Age=="26-35")

## 3.
nrow(train[train$Marital_Status==0&train$Age=="26-35",])

##4.
unique(train$Marital_Status==0 & train$Age=="26-35")
unique(train[c("Age","Marital_Status")])

a=train[(train$Age=="26-35"& train$Marital_Status==0),]
a
length(unique(a$User_ID))

length(unique(train[train$Marital_Status==0&train$Age=="26-35","User_ID"]))


a1 <- filter(train,Age=="26-35" & Marital_Status==0)
a1
nrow(distinct(a1["User_ID"]))

##5. 
unique(train$Age)
length(unique(train$Age))

## 6.
unique(train$User_ID)
length(unique(train$User_ID))

##7. 
table(train$Product_ID)


summarise(group_by(train,Product_ID),freq=n())

##8.
aggregate(train, by=list(train$Gender), FUN=mean,na.rm=TRUE)

aggregate(train$Purchase, by=list(train$Gender), FUN=mean,na.rm=TRUE)

##9.
aggregate(train$Purchase,by=list(train$Gender=="F"| train$Age=="0-17"), FUN=mean,na.rm=TRUE)

##10.
oddrows <- train[seq(1,nrow(train),2),]
mean(oddrows$Purchase)

##11.
train2 <- na.omit(train)
View(train2)

sum(is.na(train2))
sum(is.na(train))

str(train)


##12.
summarise(group_by(train,City_Category,Age=="0-17"),freq=n())

table(train$City_Category,train$Age=="0-17")

##13.

sum(is.na(train$Product_Category_2))

##14.

temp <- is.na(train$Product_Category_2)
temp

table(train$Product_Category_1,temp)

table(train[is.na(train$Product_Category_2),"Product_Category_1"])



## test

test <- read.csv("test.csv")
View(test)

test1 <- head(test,20)


str(test)

##15 and 16.

a <- unique(train$User_ID)
b <- unique(test$User_ID)

length(a[which(a%in%b)])


length(b[which(b%in%a)])

length(b[which(a%in%b)])

length(a[which(b%in%a)])

intersect(train$User_ID,test$User_ID)

merge(train,test,by=("User_ID"))


##17.


train1 <- head(train,20)

test1 <- head(test,20)

a <- data.frame(train1$User_ID,train1$Purchase)
View(a)

b <- data.frame(test1$User_ID)
View(b)

names(a)[1]="User_ID"

names(b)[1]="User_ID"

m1 <- merge(x = a, y = b, by="User_ID", all.x = TRUE,all.y=FALSE)

mean(m1$train1.Purchase)




df<-merge(x=train,y=test,by="User_ID",all.x=TRUE)

m1 = merge(train[,c(1,12)],test,by="User_Id",all.x=T,all.y=F)


## 18.

distinct(train[c("User_ID","Product_ID")])

unique(train[c("User_ID","Product_ID")])

length(unique(paste(train$User_ID,train$Product_ID,sep="_")))


## 19(a).

for(i in 3:11)
{
  print(colnames(train[i]))
  ss= aggregate(train$Purchase,list(train[,i]),mean)
  print(ss)
}

## 19(b).

for(i in 3:11)
{
  print(colnames(train[i]))
  ss= aggregate(train$Purchase,list(train[,i]),mean)
  lift=(max(ss$x)-min(ss$x))/mean(train$Purchase)
  print(lift)
}


## 20. 




