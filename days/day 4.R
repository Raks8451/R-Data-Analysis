## R Packages
## Functions
## User Defines Functions




# packages are tthe collection of functions
# they are stored in the "library" in the R env


## check available path
.libPaths()


## get the list of all packages installed
library()

## get the packages currently loaded in the R env
search()


## install a package (install.package(name of the functiom))
## important packages to be considered
## 1. ggplot for 2D transformations 
## 2. plyr/dplyr for Data manipulation  
## 3. sqldf
## 4. reshape/reshape2 for transpose of a matrix



## DPLYR PACKAGE

install.packages("dplyr")
library(dplyr)
data(mtcars)
head(mtcars)
str(mtcars)
View(mtcars)


local_df <- tbl_df(mtcars)
View(local_df)


# 1. Filter or Subset
# Base R approach to filter dataset
mtcars[mtcars$cyl==8 & mtcars$gear==5,]
# use subset function
subset(mtcars,mtcars$cyl==8 & mtcars$gear==5)

#dplyr approach
# you can use "," or "&" to use and condition

filter(mtcars,cyl==8,gear==5)
filter(mtcars,cyl==8&gear==5)

filter(mtcars,cyl==8|cyl==6)
View(mtcars)

## converting rows into columns

temp <- mtcars
temp$myNames <- rownames(temp)
filter(temp,cyl==8,gear==5)


# 2. select pick columns by name
# Base R approach
mtcars[,c("mpg","cyl","gear")]

#dplyr approach
select(mtcars,mpg,cyl,gear)

# Use":" to select multiple cintiguous columns and use"contains" for middle colums

select(mtcars,mpg:wt,contains("gear"),contains("carb"))

filter(select(mtcars,gear,carb,cyl),cyl==8|cyl==6)
filter(select(mtcars,gear,carb,cyl),cyl==8)
select((mtcars,gear,carb,cyl),filter(mtcars,cyl==8))   ## wrong
select(filter(mtcars,gear,carb,cyl),cyl==8)   ## wrong
View(mtcars)


#3. Arrange : Reorder rows
#base approach
mtcars[order(mtcars$cyl),c("cyl","gear")]

#dplyr approach
#arrange(dataframe,orderby)
arrange(select(mtcars,"cyl","gear"),cyl)
arrange(select(mtcars,"cyl","gear"),cyl,gear)
arrange(select(mtcars,"cyl","gear"),desc(cyl))
arrange(select(mtcars,"cyl","gear"),desc(cyl),gear)
arrange(select(mtcars,"cyl","gear"),desc(gear),cyl)
arrange(select(mtcars,"cyl","gear"),desc(gear),desc(cyl))


arrange(select(mtcars,"wt"),desc(wt))

## 4. Mutation  --> adding a new column................. rbind --> adding a new row
## Base R approach
temp <- mtcars
temp$new_varible <- temp$hp + temp$wt
str(temp)

#dplyr aprroach
temp <- mutate(temp,mutate_new = temp$hp + temp$wt)
temp
str(temp)
View(temp)


# 5.  fetch the unique values in dataframe

View(mtcars)


#Base R approach

unique(mtcars$cyl)
unique(mtcars["cyl"])
unique(mtcars[c("cyl","gear")])

# dplyr approach
#distinct()

distinct(mtcars["cyl"])
distinct(mtcars[c("cyl","gear")])


## 6.  aggregate uses for average
# base R approach (package:stats)
aggregate(mtcars, by=list(mtcars$cyl), FUN=mean,na.rm=TRUE)
aggregate(mtcars[,c("mpg","disp","hp")],by=list(mtcars$cyl,mtcars$gear), FUN=mean, na.rum=TRUE)
aggregate(mtcars, by=list(mtcars$cyl), FUN=mean)


2+3+NA,na.rm=TRUE

## na.rm --> removes the na values in the table




## dplyr approach
## summarise : Reduce variable to values
summarise(temp,avy_mpg = mean(mpg))

summarise(group_by(mtcars,cyl),avg_mpg = mean(mpg))

#7. table is handy to find frequencies(mode)
#Base R approach
table(mtcars$cyl)
 
View(mtcars)

table(mtcars$vs)

##dplyr approach

summarise(group_by(mtcars,cyl),freq=n())
summarise(group_by(mtcars,carb),freq=n())


## 8. Merge to data frames
name = c("Anne","Pete","Cath","cath1","Cath2")
age = c(28,30,25,29,35)
child <- c(F,T,F,T,T)
df <- data.frame(name,age,child)

occupation = c("Engg","Doc","CA","Forces","Engg")
df1=data.frame(name,occupation)

#Base R approach

merge(df,df1)


##dplyr approach

inner_join(df,df1)
inner_join(df,df1,by="name")

left_join(df,df1)
full_join(df,df1)



name = c("Anne","Pete","Cath","cath1","Cath2")

name1 = c("Anne1","Pete","Cath","cath1","Cath2")
age = c(28,30,25,29,35)
child <- c(F,T,F,T,T)
df <- data.frame(name,age,child)

occupation = c("Engg","Doc","CA","Forces","Engg")
df1=data.frame(name1,occupation)
left_join(df,df1,by=c("name" = "name1"))
inner_join(df,df1,by=c("name"="name1"))
merge(df,df1)
full_join(df,df1,by=c("name"="name1"))
right_join(df,df1,by=c("name"="name1"))









#### SQLDF PACKAGE





install.packages("sqldf")
library(sqldf)


mtcars


View(mtcars)

# 1.  Single table operations

sqldf("SELECT * FROM mtcars WHERE gear==4")

# get the count of obs
sqldf("SELECT gear, COUNT(gear) as occurances FROM mtcars GROUP BY gear")

sqldf("SELECT cyl, COUNT(cyl) as occurances FROM mtcars GROUP BY cyl")


## use a case statement to define new data column in data frame

temp2 <- mtcars
temp <- sqldf("SELECT *, 
              CASE
                  WHEN gear > 4 THEN 'T'
                  WHEN cyl > 4 THEN 'T'
                  ELSE 'F'
              END as Advanced
              FROM temp2
              ")



View(temp)


temp3 <- sqldf("SELECT *,
                CASE
                WHEN gear > 4 THEN 'T'
                WHEN cyl > 4 Then 'T'
                ELSE 'F'
                END as Advanced
                FROM temp2
                ORDER BY Advanced, cyl DESC
               ")



View(temp3)




## Multi Table operations

df1 <- data.frame(ID=c(1:10), Name= LETTERS[1:10], BOL=rep(c(T,F),5))


View(df1)

df2 <- data.frame(ID=c(5:15), ParentName=LETTERS[5:15]) 
View(df2)


## Left join ---> keeps all record from Left table and matching records from right table

left_join <- sqldf("SELECT * FROM df1 a LEFT JOIN df2 b on a.ID=b.ID")

View(left_join)

## inner joins

inner_join <- sqldf("SELECT * FROM df1 a INNER JOIN df2 b on a.ID=b.ID")
View(inner_join)

## no right joins in R but we can exchange the values

Right_join <- sqldf("SELECT * FROM df2 a LEFT JOIN df1 b on a.ID=b.ID")
View(Right_join)





### RESHAPE PACKAGE

install.packages("reshape")
library(reshape)



## cAST AND MELT FUNCTIONS

reshape_demo <- data.frame(country=c("INDIA","US","INDIA","US","UK"),
                           Dept=c("IT","IT","FIN","FIN","IT"),
                           Expenses=c(1234,2345,3456,4567,5678),
                           No_Months=c(22,24,25,34,56))


View(reshape_demo)

## Transpose Function

t(reshape_demo)

## Melt the data frame

melt(reshape_demo)
temp_wide <- melt(reshape_demo,c("country","Dept"))
temp_wide

## cast the melted data

## cast(data,formula,function)


cast(temp_wide,country~variable,mean)


cast(temp_wide,country~variable,sum)


cast(temp_wide,Dept~variable,mean)


cast(temp_wide,Dept~varible,sum)




#####  USER DEFINED FUNCTIONS

aaa <- function(){
  print("Hi this is user defined function")
}

# Calling a function

aaa()
  
## Create a function to print sqaure of a number

aaa <- function(a){
  for(i in 1:a)
    b <- i^2
  print(b)

}



aaa <- function(a){
  for(i in 1:a){
    b <- i^2
  print(b)
  }
  
}


## calling a function

a <- 3
aaa(a)

aaa(5)










































