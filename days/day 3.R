

##### 1. Operations    2. Basic  building Functions   3. Conditional Statements  4. Loops


### Operators   

## 1. Assignment Operator
## this is denoted by "<-" or "="

x <- 6
x = 6 
x

## 2. Arithmetic ( +, -, *, /, %% )

## Addition
3+3

## subtraction
5-2
2-5

# Multiplication
3*2

## Division
6/2
200/11

## Modulo
200 %/% 11  ## for Quotient part
200 %% 11   ## for reminder part

3 %/% 3 
3%%3


## 3. Relational Operator ( <, >, >=, <=, ==, != )

5 >= 3
5 <= 3
5 == 3
5 != 3 

## 4. Logical ( |, & )
## | --> any condition satisfies it is true
## & --> both condition must be satisfied

a <- 5
b <- 7

if((a>3) & (b>3))
  print("TRUE")
 

if((a>3) | (b>3))
  print("TRUE")

## 5. Model Formula(~)


## 6. List Indexing($)


name <- c("anne","pete","cath")
age <- c(28,30,34)
child <- c(F,T,F)
df <- data.frame(name,age,child)
df
class(df)
typeof(df)

df$name

## 7. Create a Sequence(:)
1:5 

## each line can have at most 128 charactesrs
## (use + sign to include to go in next line)


## two expressions are seperated by (;) on the same line

1+1 ; 2*3


#### Build in functions
## formatC(X. format="f", digits=10)

x = 4.6123888888888888
y = 104.12343543
n <- 2
log(x) # log  to base e of x
exp(x)
log(x,n) # log to base n of x
log10(x)# log to base 10 of x
sqrt(x)
factorial(4)


## Rounding functions
print(round(x,digit <- 5))
round(x,digit <- 5)

format(round(x,10),nsmall = 10)
a <- round(x,digit=10)
paste(as.numeric(a))
print(a)

options(digits = 15)
round(x,digit=12)


round(y,digit=-1)
round(y,digit=-2)

round(1005,digit=-1)
round(1109,digit=-2)
round(1109,digit=-3)
round(1109,digit=-4)


round(12, digit=-1)
round(150, digit=2)


round(1234,digit=-1)
round(1234,digit=-2)
round(1234,digit=-3)
round(1234,digit=-4)


## significant function ---> signif()

signif(x,digit=6) ; signif(x,digit=7) ; signif(x,digit=1) ; signif(y,digit=1) ; signif(y,digit=-1)


floor(x) #generate the integer < x
ceiling(x) #smallest integer > x
trunc(x) # closest integer between x and 0
trunc(-123.99)
trunc(123.99)
trunc(123.01)

runif(10) ## generate random numbers between 0 and 1 from a uniform distribution
cos(x) ; sin(x) ; tan(x)

abs(-2)


##generating regular sequence of numbers
1:10
seq(1:10)

## use the seq function to from 0 uoto 5 in step of 0.5
seq(0,5,.5)
seq(5,0,-.5)
seq(10,50,5)
seq(1,10,2)


## repeat or replication
x <- rep(6,4)
x

rep(c(11,12,13),3)
rep(1:5,3)
rep(-3:-1,4)
rep(c(11,12,13),each=2)

# sorting, ranking and Ordering
sales <- c(100,50,75,150,200,25,30)
ranking <- rank(sales) # rank tells you what order the numbers are in 
sorted <- sort(sales)
ranking
sorted
sort(sorted, decreasing = T)
ordered <- order(sales)
ordered
view <- data.frame(sales,rank,sorted,ordered)
view

## use %in% and which()
## to match between one character vector and another

sports <- c("cricket", "football","basketball","baseball","xyz")
popularsports <- c("rugby","cricket","badminton","football","baseball","tennis","basketball")
which(sports%in%popularsports)
which(popularsports%in%sports)
sports[which(sports%in%popularsports)]
popularsports[which(sports%in%popularsports)]
popularsports[which(popularsports%in%sports)]


## use paste function 
## the R function concatenate several strings into one string
a <- c("server", "client")
b <- c("1","2","3","4")
paste(a,b,sep= "-")## sep--> seperator
paste(a,b)

##use grep function for pattern matching
##this function searches for matches to pattern within each elements
## vector and returm as integer vector of elements of the vector


x <- c("apple","potato","grape","orange",10,5)
grep("a",x)
grep("a",x,value=T)
grep("[[:digit:]]",x,value=T)
x[grep("a",x)]
grep("[[:digit:]]",x,value=F)
grep("[[:digit:]]",x)## by default it takes as false
grep("z",x)

##search a special characters
s <- c("A","B+","c*","D","E*")
grep('\\*',s)
grep('\\*',s,value = T)

##using substr - to portion an index of a string
word <- "apple"
substr(word,start=2,stop=4)

## using the chartr to translate the list of characters to the correcponding  character

word <- "AppleA"
chartr(old="A",new="a",word)
chartr(old="A",new="a","Apple")


chartr(old="Ap",new="am","AppleApp")



## CONTROL STATEMENTS

?Control


## if example
x <- 30L
if(is.integer(x)){
  print("X is an integer")
}

#if-else
x <- c("whar","is","truth")
if("Truth" %in% x) {
  print("Truth is found in first time")
}else if ("truth" %in% x)  {
  print("truth is found in second time")
}else {
    print("No truth found")
}


# switch(statement,list)

switch("color","color"="red","shape"="square","length"=5)
switch("shape","color"="red","shape"="square","length"=5)
switch("length","color"="red","shape"="square","length"=5)


## LOOPS IN R

# Repeat Loop, While Loop, For Loop

##1. Repeat Loop Syntax

#          repeat{
#                 statements
#                }


## need to put exit criteria in the loop or else it will go on infinite loop
## In the statement block, you must use the break statement

v <- c("Hello", "Loop")
cnt <- 2
repeat{
print(v)
cnt=cnt+1
if(cnt>5){
  break
}
}

print(cnt)



cat(v,cnt) #concatinating the vector and counts


v <- c("Hello", "Loop")
cnt <- 6
repeat{
  print(v)
  cnt=cnt+1
  if(cnt>5){
    break
  }
}



v <- c("Hello", "Loop")
cnt <- 6
repeat{
  if(cnt>5){
    break
  }
  print(v)
  cnt=cnt+1
  
}


## while loop

#syntax
# while(test expression)
#  {
#    statements
#  }


v <- c("Hello","while loop")
cnt <- 2
while(cnt < 7){
  print(v)
  cnt=cnt+1
}

cat(v,cnt)
print(cnt)


v <- c("Hello","while loop")
cnt <- 8
while(cnt < 7){
  print(v)
  cnt=cnt+1
}


## for loop
# A for loop is used to iterate over a vector


#syntax
# for(val in vector)
#  {
#    statements
#  }

v <- LETTERS[1:4]
for(i in v){
  print(i)
}
  
v <- 1:6
for(i in v){
  print(i)
}

v <- LETTERS[1:4]
for(i in v){
  if(i=='C'){
    break
  }
  print(i)
}


v <- LETTERS[1:4]
for(i in v){
  if(i=='B'){
    next
  }
  print(i)
}



## Nested for loop


Nested_for <- matric(nrow = 10, ncol = 5)
for(i in 1:dim(Nested_for)[1]) {
  for(j in 1:dim(Nested_for)[2]) {
    Nested_for[i,j] = i*j
  }
}
 
Nested_for
View(Nested_for)


Nested_for <- matric(nrow = 10, ncol = 5)
for(i in 1:dim(Nested_for)) {
  for(j in 1:dim(Nested_for)) {
    Nested_for[i,j] = i*j
  }
}


## Break vs Next
x <- 1:5 
for(val in x) {
  if(val == 3) {
    next
  }
  print(val)
}

t <- 2:10
for(val in t) {
  if((val == 3) | (val == 6)) {
    next
  }
  print(val)
}




































