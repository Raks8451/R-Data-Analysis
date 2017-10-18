


## set working directory

setwd("D:/Rakshith/Documents/R programming")

setwd("D:\\Rakshith\\Documents\\R programming")



## getting the working directory

getwd()


## Read Input file - .csv

# Format: read.csv(file,header=TRUE, sep=",",stringsAsfactors = F)

# Example
advertising <- read.csv("me.csv",stringAsFactors = F)

getwd()

advertising <- read.csv("me.csv",stringsAsFactors = F)
str(advertising)
advertising <- read.csv("me.csv",stringsAsFactors = T) 
str(advertising)


## Write into CSV file
write.csv(mtcars,"write_csv_demo.csv")
write.csv(mtcars,"write_csv_demo1",row.names=F)

## Read Input file- .xls
install.packages("xlsx")
library(xlsx)

input_excel <- read.xlsx(".xlsx",sheetIndex=1)


## read table: .txt
getwd()
input_txt <- read.table("rakshith.txt",sep=',',stringsAsFactors = F) #scan 
write.table(mtcars,"yashna.txt")


View(input_txt)


## Read Input file- n.xml
install.packages("XML")
library(XML)
library(methods)

getwd()

xml_demo <- xmlParse(file = "demo.xml")
xml_demo

rootnode <- xmlRoot(xml_demo)

print(rootnode[1])
print(rootnode[2])
print(rootnode[3])

print(rootnode[[1]][2])## only for the name

print(rootnode[[1]][3])
print(rootnode[[3]][2])


xmldataframe <- xmlToDataFrame("demo.xml")
View(xmldataframe)



## connect with database - SQL Server
## RSQl SERVER
## RODBC  

install.packages("RSQLServer")
library(RSQLServer)
install.packages("RODBC")
library(RODBC)



################     R APPLY FAMILY


# construct a matrix

X <- matrix(rnorm(30),nrow=5,ncol=6) 
X
# sum the values of each column with apply()

Y <- apply(X,1,sum)
Y[1]


X1 <- data.frame(X)
View(X1)
Y1 <- apply(X1,1,sum)
Y1
Y1 <- apply(X1,2,sum)
Y1
View(Y1)



## lapply() can be used to other objects like data frame

## create a list of matrices

Mylist <- list(1:5,20:25)
lapply(Mylist,median)



## sapply function


## same as lapply but lapply return type is list and sapply return type is vector


sapply(Mylist,median)
sapply(Mylist,median,simplify = F)

### the tapply fuction works well with factors

ages <- c(25,26,31,35,42,46)
location <- c("Urban","Rural","Rural","Urban","Urban","Urban")

tapply(ages,location,mean)













#####################################

## 1. how many rows in mtcars data set

nrow(mtcars)
length(mtcars)   ## for columns
length(mtcars$mpg)



## 2.  how many rows are present in mtcars dataset with cyl=4

nrow(mtcars[mtcars$cyl==4,])


## 3. how many columns are present in mtcars datasets

ncol(mtcars)






















































