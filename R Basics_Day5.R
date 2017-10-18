##############################################################################
# R Session						                                                       #
# Date:  26/07/2017									                                         #
# Author: Manish                              							                 #	
##############################################################################

##############################################################################
# This Session will cover:
#        R Packages 
#        Functions 
#        User Defined Functions
#       
##############################################################################

##Packages are the collection of functions
##They are stored in the "library" in the R env.

## Check available path
.libPaths()

##Get the list of all packages installed
library()

##Get the packages currently loaded in te R environment
search()

##Install a package

##Load Package to Library
  ##Before the package can be used in the code, it must be loaded in the
  ##current R environment.

## Important Packages to be considered.
#1. ggplot
#2. plyr/dplyr
#3. sqldf
#4. reshape/reshape2

##########################################dplyr Starts##################################################

#dplyr is a new package which provides a set of tools for efficiently 
#manipulating datasets in R. dplyr is the next iteration of plyr, 
#focussing on only data frames. 
#dplyr is faster, has a more consistent API and should be easier to use.

##Handy in:
   #Filter
   #Select
   #Arrange
   #Mutate
   #Distinct
   #Summarise

########################################################################################################

#install.packages("dplyr")
library(dplyr)
data(mtcars)
head(mtcars)
str(mtcars)
View(mtcars)

#local_df <- tbl_df(mtcars)
#View(local_df)

#1. Filter or subset
#Base R approach to filter dataset
mtcars[mtcars$cyl==8 & mtcars$gear==5,]
#Use subset function
subset(mtcars,mtcars$cyl==8 & mtcars$gear==5)

#dplyr approach
#You can use "," or "&" to use and condition
filter(mtcars,cyl==8,gear==5)
filter(mtcars,cyl==8&gear==5)

filter(mtcars,cyl==8|cyl==6)

##Converting row names into column
temp <- mtcars
temp$myNames <- rownames(temp)
filter(temp,cyl==8,gear==5)

#2. Select: Pick columns by name
#Base R approach
mtcars[,c("mpg","cyl","gear")]

#dplyr Approach
select(mtcars,mpg,cyl,gear)

# Use ":" to select multiple contiguous columns, and use "contains" to match columns by name
select(mtcars,mpg:disp,contains("gear"),contains("carb"))

filter(select(mtcars,gear,carb,cyl),cyl==8|cyl==6)


#3. Arrange : Reorder rows
#base Approach
mtcars[order(mtcars$cyl),c("cyl","gear")]

#dplyr Approach
#Syntax:
#arrange(dataframe,orderby)
arrange(select(mtcars,"cyl","gear"),cyl)
arrange(select(mtcars,"cyl","gear"),cyl,gear)
arrange(select(mtcars,"cyl","gear"),desc(cyl))
arrange(select(mtcars,"cyl","gear"),desc(cyl),gear)


#mutate: Add new variable
#Base R Approach
temp <- mtcars
temp$new_variable <- temp$hp + temp$wt
str(temp)

##dplyr Approach
temp <- mutate(temp,mutate_new = temp$hp + temp$wt)


# Fetch the unique values in dataframe

#Base Package approach - unique function
#unique()

unique(mtcars$cyl)
unique(mtcars["cyl"])
unique(mtcars[c("cyl","gear")])

#dplyr approach

#distinct() 
distinct(mtcars["cyl"])
distinct(mtcars[c("cyl","gear")])


#aggregate()
##base R approach (package:stats)
aggregate(mtcars, by=list(mtcars$cyl), FUN=mean, na.rm=TRUE)
aggregate(mtcars[,c("mpg","disp","hp")], 
          by=list(mtcars$cyl,mtcars$gear), FUN=mean, na.rm=TRUE)

#dplyr approach
#Summarise : Reduce variable to values
summarise(temp,avg_mpg = mean(mpg))
summarise(group_by(mtcars,cyl),avg_mpg = mean(mpg))

#Table is very handy to find the frequencies (mode)
#Base Package Approach 
table(mtcars$cyl)

#dplyr approach
summarise(group_by(mtcars,cyl),freq=n())


##Merge two data frames
name = c("Anne", "Pete", "Cath", "Cath1", "Cath2")

age = c(28,30,25,29,35)
child <- c(FALSE,TRUE,FALSE,TRUE,TRUE)
df <- data.frame(name,age,child)

name1 = c("Anne1", "Pete", "Cath", "Cath1", "Cath2")

occupation = c("Engg","Doc","CA","Forces","Engg")
df1 = data.frame(name1,age,occupation)

#Base Package Approach
merge(df,df1)


##dplyr approach
inner_join(df,df1)
inner_join(df,df1,by = "name")
left_join(df,df1,by = c("name" = "name1"))
left_join(df,df1,by = c("age" = "age" , "name" = "name1"))


#Try
#left_join()
#full_join()


##########################################dplyr Ends##################################################



##########################################sqldf Starts##################################################
#install.packages("sqldf")
library(sqldf)

# Single Table Operations

sqldf("SELECT * FROM mtcars WHERE gear ==4")

# Get the count of obs
sqldf("SELECT gear, COUNT(gear) as occurances 
      FROM mtcars GROUP BY gear")

##Use a CASE statemetn to define a new data column in dataframe
temp2 <- mtcars
temp <- sqldf("SELECT *,
               CASE
                   WHEN gear > 4 THEN 'T'
                   WHEN cyl > 4 THEN 'T'
                   ELSE 'F'
               END as Advanced
               FROM temp2
              ")

temp3 <- sqldf("SELECT *,
               CASE
              WHEN gear > 4 THEN 'T'
              WHEN cyl > 4 THEN 'T'
              ELSE 'F'
              END as Advanced
              FROM temp2
              ORDER BY Advanced , cyl DESC LIMIT 10
              ")


##Multi Table Operations:

df1 <- data.frame(ID = c(1:10),
                  Name = LETTERS[1:10],Bol = rep(c(T,F),5))

df2 <- data.frame(ID = c(5:15),ParentName = LETTERS[5:15])

#Left join: Keeps all record from LEFT table 
#and matching records from right table

left_join <- sqldf(" SELECT *
                     FROM df1 a 
                     LEFT JOIN df2 b ON a.ID = b.ID
                   "
                   )

##Right joins are not supported by sqldf package. 

inner_join <- sqldf(" SELECT *
                     FROM df1 a 
                   INNER JOIN df2 b ON a.ID = b.ID
                   "
)
##########################################sqldf Ends##################################################

#########################################reshape Starts################################################
#Cast and Melt Functions

reshape_demo <- data.frame(Country=c("India","US","India","US","UK"),
Dept = c("IT","IT","Fin","Fin","IT"),
Expense = c(1234,2345,3456,4567,5678),
No_Months = c(22,24,25,34,56)
)


reshape_demo

#install.packages("reshape")
library(reshape)

#Transpose Function
t(reshape_demo)

# Melt the dataframe
melt(reshape_demo)
temp_wide <- melt(reshape_demo,c("Country","Dept"))
temp_wide


#Cast the melted data
#cast(data,formula,function)
cast(temp_wide,Country~variable,mean)

cast(temp_wide,Dept~variable,mean)

#########################################reshape Ends################################################




##################################################################################################

##User Defined Function
##################################################################################################

aaa <- function(){
  print("Hi this is user defined function")
}

#Calling a function
aaa()







#Create a function to print square of a number
aaa <- function(a){
  #b = list()
  for(i in 1:a){
    b[i] <- i^2
    #print(b)
  }
  return(b)
}

#Calling a function
aaa(5)



