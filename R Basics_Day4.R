
###################################################################################################

##Loop in R
#Repeat Loop
#while Loop
#For loop
###################################################################################################
#Syntax:
#repeat{
#Statement
#}
a <- 3
b<- 4
a
b
#Tip: In the Statement block, you must use the break statement to exit the loop

#Example
v <- c("Hello","Loop")
cnt <- 2
repeat{
  print(v)
  cnt = cnt+1
  if (cnt >5){
    break
  }
}



#While Loop
#While loop evaluate the test and then enter in the body of the loop.

#Syntax:
# while (test expression)
#{
# statement
#}

#Example   
v <- c("Hello","while loop")
cnt <- 2
while (cnt < 7){
  print(v)
  cnt = cnt + 1
}


#For Loop
#A for loop is used to iterate over a vector

#for (val in Vector)
#{
#  statement
#}

#Examples

v <- LETTERS[1:4]
for ( i in v) {
  print(i)
}


##Nested FOR loop
Nested_for <- matrix(nrow = 10,ncol = 5)
for(i in 1:dim(Nested_for)[1]) {
  for(j in 1:dim(Nested_for)[2]) {
    Nested_for[i,j] = i*j
  }
}

Nested_for


##############################Difference Between For Loop and While Loop######################
#
#           While loop is used in situation where we do not know how many times
#           loop needs to be executed beforehand
#
#           For loop is used where we already know about the number of times loop
#           need to be executed. TYpically index is used in iteration
#
# Example While Loop:
#      Suppose you are making a game, in which you ask the player to input a number, if 
#      that number is positive number, then the game continues, and you perform some action
#      inside the body of the loop, but if user enters a zero then it means that user wants
#      to quit the game, so you want to stop the loop. In this scenario while loop will be a good
#     choice since you do not know how many times user wants to execute the loop
#


#Example of For loop:
#     Suppose you want to write a program, that takes a digit and gives it's table upto 10
#     times. Then using the For loop will be the good choice, since you already know
#     that loop needs to be executed 10 times.


##############################Difference Between Repeat and While Loop######################
#Repeat loop is similar to while loop, but body in the repeat loop
#executes atleast once, no matter what the result of the condition.

v <- c("Hello","Loop")
cnt <- 10
repeat{
  print(v)
  cnt = cnt+1
  if (cnt >5){
    break
  }
}


##Break v/s Next:

x <- 1:5

for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}



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
