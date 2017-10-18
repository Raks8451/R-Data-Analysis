##############################################################################
# R Session						                                                       #
# Date:  19/08/2017									                                         #
# Author: Manish                              							                 #	
##############################################################################

##############################################################################
# This Session will cover:
#        Different Datatypes in R and basic functions
#        Different Data Structure in R and basic functions
##############################################################################

##R is an interpreted language, not a compiled one, meaning that all commands 
##typed on the keyboard are directly executed without requiring to build a 
##compiled program like in most computer languages

##All the actions of R are done on objects stored in the active memory of
##the computer: no temporary files are used

################################################################################
#          Data Types in R  (Atomic Data type:) Starts
#               Logical, Numeric,Integer, Character, Complex
################################################################################

##R has following datatypes:
#1. Logical
#2. Numeric
#3. Integer
#4. Character
#5. Complex
#6. raw


##Logical Datatype
x <- TRUE
class(x)
TRUE
class(TRUE)
FALSE
#R is case sensitive
false = 3
false
class(false)

class(FALSE)
class(NA)
y<-T
class(y)
class(T)
class(F)
T
F

##Numeric
2
2.5
class(2)
class(2.5)

2L##integer
class(2L)

is.numeric(2)
is.numeric(2L)

is.integer(2)
is.integer(2L)






##integers are numeric but not all numeric are integers

##Character
"I love data science"
class("I love data science")
class("2")
class(2)


##coercion Function to convert one type to another
as.numeric(FALSE)


as.character(4)
as.numeric("4.5")
as.integer("4.5")
as.numeric("hi")


#Complex Values (complex numbers with real and imaginary part)
z = 1 + 2i     # create a complex number 
z              # print the value of z 
class(z)       # print the class name of z 
sqrt(-1)       # square root of -1 
sqrt(-1+0i)    # square root of -1+0i 
sqrt(as.complex(-1)) 

##Extract Real Component of a Complex Number
Re(z)

##Extract Imaginary Component of a Complex Number
Im(z)


#The modulus and argument are also called the polar coordinates.
#If z = x + i y with real x and y, for r = Mod(z) = √(x^2 + y^2), 
#and φ = Arg(z), x = r*cos(φ) and y = r*sin(φ).

#Modulus of a Complex Number
Mod(z)

#Argument of a complex  Number - φ
Arg(z)

##
v <- charToRaw("Hello")
class(v)
v
#######################################################################################
#          Data Types in R  (Atomic Data type:) Ends
#               By end to this exercise you will be able to understand:
#                  What are Boolean Data type
#                  What are Numeric Data type
#                  What are Integer Data type  
#                  Difference between Numeric and Integer Data type
#                  How to check what is the data type of a varaiable
#                  Convert one data type into another data type (coercion Function)
#                  What are Complex Data type 
######################################################################################

################################################################################
#          Data Structure in R  - Starts
#               Vector
#                 What are Vectors?
#                 How to create a Vector?
#                 How to check if datastructure is vector?
#                 How to give name to a vector?
#                 Vectors manipulation?
################################################################################

## Vector: Sequence of data element of same basic datatype
##Create a vector --> we need c() which allows combine values to a vector

c("heart", "diamond", "spades", "diamonds", "spades")
##We can assign this to some varaible
draw_suite <- c("heart","diamonds","spades","diamonds","spades")
draw_suite
class(draw_suite)
is.vector(draw_suite)

## you can also create a vector of Numeric
remain <- c(11,12,11,13)
remain
class(remain)

## you can also create a vector of Integer
remain_another <- c(11L,12L,11L,13L)
remain_another
class(remain_another)

remain
##This is not very informative, we need to give names to each card type.
##names() can help us to do that




suite <- c("heart","diamonds","spades","clubs")
names(remain) <- suite
remain

##Another way to create Name Vector
remain1 <- c(heart = 11, diamonds = 12, spades = 11, clubs = 13)
remain1

remain2 <- c("heart" = 11, "diamonds" = 12, "spades" = 11, "clubs" = 13)
remain2

is.vector(remain)
length(remain)

##Single Value = Vector
my_apple <- 5
my_oranges <- "six"

is.vector(my_apple)
is.vector(my_oranges)

length(my_apple)
length(my_oranges)

length(draw_suite)

basket1 <- c(12,4,4,6,9,3)
basket2 <- c(5,3,2,2,12,9)

more<-basket1>=basket2 #logical vector- vectorized operations
more

basket1+basket2
#comparison operator
c(1,2,3,4,5)<=3
temp <- c(1,2,3,4,5)
temp1 <- c(2,3,0,0,0)
temp <= temp1

##vector are homogenous
#Only one element of same type
##Coercion for vectors

draw_ranks <- c(2,3,5,6,"k")
draw_ranks
class(draw_ranks)

x <- 0:5
x

sum(x)

#Total Number of records that satisfies the condition
sum(x>1)

sum(x[x>3])
sum(x[x<3])

x[x>3]
x<3

sort(x,decreasing = FALSE)
sort(x,decreasing = T)
sort(x)

sort(x)[2:3]
sum(sort(x)[2:3])

##Trimming the Vector

x <- c(1,2,3,4)
x[1]
x[4]
x[-1]
x[-1:-2]
x[c(-2,-4)]

#Dynamically creating a vector instead of using c()
##scan(file,what)
colors_new = scan('',what='')
colors_new = scan('',what=integer())



################################################################################################

#Matrix

##Create a Name Matrices
##Matrix is a big brother of vector
##Vector: 1D array of data element
##Matrix: 2D array of data element - One atomic vector type
##matrix is a natuaral extension of Vector going from 1D to 2D

## TO build a matrix, we use matrix() function
matrix(1:6,nrow=2)
matrix(1:6,ncol=3)

matrix(1:3,nrow=3,ncol=3)
matrix(1:3,ncol=3,nrow=2)

matrix(1:4,nrow=2,ncol=4)


##There is another easy method to create matrix by binding vectors
##cbind() and rbind() functions can be used.

cbind(1:3,1:3)
rbind(1:3,1:3)

cbind(c(1,2,3,4,5),c(11,12,13,14,15))
rbind(c(1,2,3,4,5),c(11,12,13,14,15))

#by row
matrix(1:6, nrow=2)
matrix(1:6,byrow = TRUE, nrow=2)

m <- matrix(1:6,byrow = TRUE, nrow=2)
rbind(m,7:9)
cbind(m,c(10,11))
m

##Naming a Matrix using rownames() and colnames()
rownames(m) <- c("row1","row2")
colnames(m) <- c("col1","col2","col3")
m

##or use dimnames attribute

m <- matrix(1:6,byrow = TRUE,nrow =2, dimnames = 
              list(c("row1","row2"),c("col1","col2","col3")))
m

#Check if data structure is a matrix
is.matrix(m)


char <- matrix(LETTERS[1:6],nrow = 4,ncol = 3)
char




##Subset element
m <- matrix(sample(1:15, 12), nrow =3)
m[1,3]

##Select entire row or entire column
m[,1]
m[1,]
m[4]
m[9]

##Subsetting multiple elements
m[1,c(2,3)]
m[c(1,2),c(2,3)]


##Subset by name
m <- matrix(1:12,nrow = 3)
rownames(m) <- c("row1","row2","row3")
colnames(m) <- c("col1","col2","col3","col4")

m["row1","col2"]

#############################################################################################

##List
##List is a generic vector containing other objects
##A list is an R-object which can contain many different types of elements inside it 
#like number,string, vector and even anohter list inside it. 
#A list can also contain a matrix or a function as it's element
##The list is created using list().

list1 <- list(c(2,5,3),21.3,sin)
list1

n <- c(2,3,4)
s <- c("aa","bb","cc","dd")
b <- c(T,T,T,F)
x <- list(n,s,b,3)
x
class(x)
#y = data.frame(n,s,b)

##List Slicing
#We retrieve a list slice with a single square bracket "[]" operator.
#Thefollowing is hte slice containing hte second member of x, which is a copy of s

x[2]
x[1]
x[3]

#With the index vector, we can retrieve a slice with multiple members. 
#Here a slice containing the second and fourth member
x[c(2,4)]

##Member Reference
#In order to reference a list member directly, we have to use the double square bracket "[[]]" operator
#The following object x[[2]] is a second member of x. x[[2]] is a a copy of s, but is not a slice 
#containing s

x[[2]]
x[2]
#We can modify it's content directly
x[[2]][1] <- "ta"
x[[4]] <- 4
x[[4]][1] <- 3
x[[4]][2] <- 4
x

s##s is uneffected

##We can assign name to list member and reference them by names instead of numeric indexes
v <- list(bob=c(2,3,4),john = c("aa","bb"))
v

##We can retrieve a list slice with the single square bracket "[]" operator. Here is the list of
##slice containing a member of v named "bob"

v["bob"]
v[["bob"]]

##With the index vector, we can retrieve a slice with multiple members. Here is hte list slice with both
#members of v. Notice how they are reversed from their original position in v

v[c("john","bob")]


##Member Reference
#In order to reference a list member directly, we have to use a double square bracket "[[]]" operator
v[["bob"]]


#The named list member can also be referenced directly with the "$" operator
v$bob

##Search Path Attachement
#We can attach a list to the R search path and access its members without explicitly mentioning
#the list
attach(v)
bob
detach(v)

