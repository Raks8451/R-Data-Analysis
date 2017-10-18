##############################################################################
# R Session						                                                       #
# Date:  24/07/2017									                                         #
# Author: Manish                              							                 #	
##############################################################################

##############################################################################
# This Session will cover:
#        Operations 
#        Basic Building Functions. 
#        Conditional Statements
#        Loops 
##############################################################################


##Basic Operations
# Assignment:
# This is denoted by "<-" or "="
x <- 6
x = 6

#2. Arithmetic
#+, - , *, /, %%,  

#Addition
3+3

#Subtraction
5-2

#Multiplication
3*2

#Division
6/2
200/11

##Modulo
200 %/% 11 #quotient
200 %% 11  #remainder

3%/%3
3%%3

500%/%5
500%%5

#3. Relational
# >=, <=, ==, !=
5 >= 3
5 <= 3
5 == 3
5!= 3

#4. Logical
# |, &

a  <- 5
b <- 7
if ((a >3 )&(b>3))
  print("True")

if ((a >3 )|(b>3))
  print("True")

if ((a >10 )|(b>3))
  print("True")

if ((a >10 )&(b>10))
  print("True")


#5. Model Formula (~)

#6. List Indexing ($)

name = c("Anne", 
         "Pete", 
         "Cath", 
         "Cath", 
         "Cath")
age = c(28,30,25,29,35)
child <- c(FALSE,TRUE,FALSE,TRUE,TRUE)
df <- data.frame(name,age,child)
names(df) <- c("Name","Age","Child")

df$Name


#7. Create a sequence (:)
1:5

##Each line can have at most 128 characters 
##(use + sign to include to go in next line)
a = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq+
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'
#gsub("[+\n]", "", a)

##Two or more expression on the same line separated by ';' 
1+1 ; 2*3





######################################################################################################
#                                  Build in Function
######################################################################################################
#formatC(x, format="f", digits=10)


x = 4.6123888888888888
y = 104.12343543
n = 2
log(x) #log to base e of x
exp(x)
log(x,n) #log to base n of x
log10(x) #log to base 10 of x
sqrt(x)
factorial(4)

##Rounding Functions
#Although R can calculate accurately upto 16 digits, you dont always want to use that many 
#digits. In that case you can use couple of functions in R to round numbers
print(round(x,digit=5))
round(x,digit=5)

format(round(x,10),nsmall = 10)
a <- round(x,digit=10)
paste(as.numeric(a))
print(a)

options(digits = 15)
round(x,digit=12)

# you can also use the round() to round numbers to multiple of 0,10,100...
#For that you just need to add a negative number as a digit argument
round(y,digit=-1)
round(y,digit=-2)

round(1234,digit = -1)
round(1234,digit = -2)
round(1234,digit = -3)
round(1234,digit = -4)


round(12,digit = -1)
round(15,digit = -1)


#If you want to specify the number of significant digits to be retained, regardless of the 
#size of the number, you use the signif()
signif(x,digit = 6)
signif(y,digit = 9)
signif(y,digit = 3)
signif(y,digit = 2)
signif(y,digit = 1)
signif(y,digit = -1)
signif(y,digit = -6)



#Contrary to round(), three other functions always round in the same direction:

floor(x)  #generate integer <x
ceiling(x) #smallest integer > x
trunc(x) #Closest integer between x and 0
trunc(-123.99)
trunc(123.99)
trunc(123.01)

runif(10)##Generate random numbers between 0 and 1 from a uniform distribution

cos(x);sin(x);tan(x)


abs(-2)

##Generating Regular Sequence of Numbers

1:10
seq(1:10)

##use the seq function to go from 0 upto 5 in step of 0.5
seq(5,0,-.5)

##Repeat or Replication
x <- rep(6,4)
x

rep(c(11,12,13),3)

rep(1:2,3)

rep(c(11,12,13),each=2)

##Sorting, Ranking and Ordering
sales <- c(100,50,75,150,200,25,30)
rank <- rank(sales)#rank tells you what order the numbers are in.
sorted <- sort(sales)
ordered <- order(sales)
view <- data.frame(sales,rank,sorted,ordered)
view


##use %in% and which()
##To match between one character vector and another
sports <- c("cricket","football","basketball","baseball","XYZ")
popularsports <- c("rugby","cricket","badminton","football",
                   "baseball","Tennis","basketball")
which(sports%in%popularsports)
which(popularsports%in%sports)
sports[which(sports%in%popularsports)]


##Use paste function
##The R function to concatenate several strings into one string
a <- c("server","client")
b <- c("1","2","3","4")
paste(a,b,sep = "")
paste(a,b)




#Use grep function for pattern matching
##THis function searches for matches to pattern within each element of a character
##vector and return as integer vector of elements of the vector that contain a match

X <- c("apple","potato","grape",10)
grep("a",X)
grep("a",X,value = T)
grep("[[:digit:]]",X,value= T)
grep("[[:digit:]]",X)

##Search a special characters
s <- c("A","B","C*","D","E*")
grep('\\*', s)
grep('\\*', s,value = T)


##Using substr - to portion an index of a string
word <- "apple"
substr(word,start=2,stop=4)



##Using the chartr to translate the list of characters to the corresponding characters

word <- "AppleA"
chartr(old = "A",new="a",word)
chartr(old = "A",new="a","Apple")


chartr(old = "Ap",new="am","AppleAp")

##############################################################################
#
#                  if ; is-else ; switch operators 
#
##############################################################################
#Control commands are the commands that enable the program to take decisions
#YOu can also see these control flow by invoking ?Control

?Control

#if example
x <- 30L
if(is.integer(x)){
  print("X is an integer")
}




#if-else
x <- c("what","is","truth")

if("Truth" %in% x){
  print("Truth is found in first time")
} else if ("truth" %in% x) {
  print("truth is found in second time")
} else {
  print("No truth found")
}


#Switch: A switch statement allows a varaible to be 
#tested for equality against a list of value
#Each value is called a case and the varaible 
#being switched on is checekd for each case.

#switch(statement,list)


switch("color", "color" = "red", "shape" = "square", "length" = 5)
switch("shape", "color" = "red", "shape" = "square", "length" = 5)
switch("length", "color" = "red", "shape" = "square", "length" = 5)