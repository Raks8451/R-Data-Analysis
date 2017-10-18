#VECTOR: SEQUENCE OF DATA ELEMENTS OF SAME BASIC DATATYPE
##CREATE A VECTOR -->  WE NEED C() WHICH ALLOWS COMBINE VALUES TO A VECTOR

c("heart", "diamond", "spades")
draw_suite <- c("heart", "diamond", "spades")
draw_suite
class(draw_suite)
is.vector(draw_suite)


##you can also create a vector of numeric 
remain <- c(11,12,13,14,"hi")
remain
class(remain)
is.vector(remain)

remain <- c(11,12,13,14)
remain
class(remain)
is.vector(remain)

##you can also create a vector of integer
remain_another <- c(11L,12L,13L,14L)
remain_another
class(remain_another)

remain

## giving name to the vector
##names() is the function 

suite <- c("heart", "diamond", "spades","clubs")
names(remain) <- suite
remain

##another way

remain1 <- c(heart=11,diamonds=12, spades=13, clubs=14)
remain1

## use of quotes or not doesn't matter

remain2 <- c("heart"=11, "diamonds"=12, spades=13)
remain2

is.vector(remain)

length(remain)

remain3 <- c(heart="a", diamonds="b")
remain3
remain4 <- c(heart=a, spades=b)
remain4


##single value = vector
my_apple <- 5
my_oranges <- "six"
is.vector(my_apple)
is.vector(my_oranges)

length(my_apple)
length(my_oranges)

length(draw_suite)

##logical vector - vvectorized operations

s1 <- c(12,4,4,6,9,3)
s2 <- c(5,3,2,2,12,9)

more <- s1>=s2
more

s3 <- c(2,5)
s4 <- c(1,9)

g <- s1*s4 >= s2*s3 
g

s1+s4 >= s2+s3

s1+s3 >= s2+s4

##comparision operator

c(1,2,3,4,5)<=3
  
temp = c(1,2,3,4,5)
  temp1 = c(2,3,0,0,0)
  temp <= temp1
  
as.integer(c(1,2,3,4,5)<=3) ##convert from boolean to numeric
as.character(c(1,2,3,4,5)<=3)

s1+s2
s1-s2
class(s1+s2)
as.charcter(s1+s2)

temp1+temp
 s1/s2
 
 as.integer(s1+s2)
 x=s1+s2
 x
as.character(x)
 

## vectors are homogenous
## only one element of same type
## coercion for vectors

draw_ranks = c(2,3,"k")
draw_ranks
class(draw_ranks)

## s=defines the permutations(sequence)
x = 0:5
x
sum(x)

seq <- 0:5
seq
sum(seq)

## total number of records that satisfies the condition
sum(x>1)      ## gives the total no of elemnts
x>1    ##gives the boolean values


sum(x[x>3])   ## gives the sum of elements
sum(x[x<3])
x<3
x[x>3]



## [] are used to fetch the values
x[3]
x[c(1,2)]

j = 1:100
j
sum(j)
 
## x[] --> for getting the values easy tasks and c()--> is for combining the elements

x[0]
x[1]
x[c(2,4)]

##to fetch a specific code we need to write a code

length(x)
length(3)
x[length(3)]
x[length(x)]

sort(x,decreasing = FALSE)
sort(x,decreasing = T)
sort(x)

sort(x)[2:3]
sum(sort(x)[2:3])

f <- c(14, 12, 87, 67,91,24)
sort(f,decreasing = FALSE)
sort(f, decreasing = T)
sort(f)

x <- c(1,2,3,4)
x[1]
x[4]
x[-1]
x[-1:-2]
x[c(-2,-4)]
x[-1:-2:-3:-4]


#dynamically creating avector instead of using c()
##scan(file,what)
colors_new = scan('',what='')
colors_new = scan('',what=integer())



##matrix

matrix(1:6,nrow=2)
matrix(1:6,ncol=3)

matrix(1:3,nrow=3,ncol=3)
matrix(1:3, nrow=3,ncol=2)

matrix(1:4,nrow=2,ncol=4)



##Cbind() and rbind() are functions

cbind(1:3,1:3)
rbind(1:3,1:3)
rbind(1:6)
cbind(1:3)

cbind(c(1,2,3,4,5),c(11,12,13,14,15))
rbind(c(1,2,3,4,5),c(11,12,13,14,15))

cbind(6:10,6:10)

#by row
matrix(1:6, nrow=2)
matrix(1:6,byrow=TRUE, nrow=2)

m <- matrix(1:6,byrow=TRUE, nrow=2)
rbind(m,7:9)
cbind(m,c(10,11))
m
rbind(7:9)

rbind(1:9,1:9)

m <- matrix(1:9, byrow=TRUE, nrow=3)
m
matrix(1:9, byrow=TRUE, nrow=3)
cbind(m,c(10:12))
rbind(m,c(10:12))

rownames(m) <- c("row1","row2")
colnames(m) <- c("col","col2","col3")
m

## or use dimnames attribute 
m <- matrix(1:9,byrow =TRUE,nrow = 3,dimnames = list(c("row1","row2","row3"),c("col1","col2","col3")))
m
is.matrix(m)

#check if datastructure is a matrix
is.matrix(m)

char <- matrix(LETTERS[1:6],nrow = 4,ncol=3)
char

char <- matrix(letters[1:6],nrow = 4,ncol = 3)
char

# subset element
char[1,1]

m <- matrix(sample(1:15, 12),byrow=TRUE,nrow=3)
m
m[1,3]


## select entire row or column
m[,1]
m[1,]
m[4,byrow=TRUE]
m[9]
m[13]


# subsetting the multiple elements
m[1,c(2,3)]
m
m[1,c(2,3)]
m[c(1,2),c(2,3)]

m[c(2,3),c(2,4)]


## subset by name
m <- matrix(1:12,nrow = 3)
rownames(m) <- c("row1","row2","row3")
colnames(m) <- c("col1","col2","col3","col4")
m

m["row1","col2"]
m["row3","col3"]


##LIST
list1 <- list(c(2,5,3),21.3,sin) # c(2,5,3) is a vector..... 21.3 is a numeric and sin is a function
list1

n <- c(2,3,4)
s <- c("aa","bb","cc")
b <- c(T,T,T,F)
x <- list(n,s,b,3)
x
class(x)
#y = data.frame(n,s,b)
 
#list slicing--> retreiving the information

x[2]
x[3]

## for retrieving the multiple elements
x[c(2,4)]
x[c(2,3)]

## member reference
x[[2]]
x[2]
x[[2,3]]
x[[c(2,3)]]

# we can modify its content directly
x[[2]][1] <- "ta"  
x[[4]] <- 4
x[[4]] <- 3
x[[4]][1] <- 3
x[[4]][2] <- 4
x
s## s is unaffected means it is located at some other memory

## assign a name to the list

v <- list(bob=c(2,3,4),john=c("aa","bb"))
v
v["bob"]
v[["bob"]]
v$bob
## v[[$bob]] --> doesn't produces output

##attach a list to the object

attach(v)
v
bob
detach(v)
v


list <- c("green",12.3)






list## accessing List elements  
# Create a list containing a vector, a matrix and a list

list_data <- list(c("jan","feb","mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("green",12.3))
names(list_data) <- c("1st quater", "a_ Matrix","An Inner List")
list_data

# access the third element

print(list_data[3])
print(list_data[3][[1]][[1]])
print(list_data[3][[1]][[2]])
str(list_data) ## str is for Data Structure


# add element at the end of the list
list_data[4] <- "new element"
print (list_data[4])
list_data

#remove the last element\
list_data[4] <- NULL

list_data


#merge list
list1 <- c(1,2,3)
list2 <- c("sun","mon")

merge <- c(list1,list2)
merge
length(merge)

##converting a list to vector
list <- list(1:5)
list

list2 <- (1:10)
list2

# converting the list into vector
v1 <- unlist(list)
v2 <- unlist(list2)
v1
v2

## merging and converting list into a vector
list1 <- c(1,2,3)
list2 <- c("sun","mon")
a1 <- unlist(list1)
a2 <- unlist(list2)

merge <- c(a1,a2)
merge
length(merge)


## DATA FRAMES 

## internally saves data as a list

## creating a data frame

name <- c("anne","pete","cath")
age <- c(28,30,34)
child <- c(F,T,F)
df <- data.frame(name,age,child)
df
class(df)
typeof(df)
View(df) ## for viewing the data frame (capital V)

## name the Data frame
names(df) <- c("NAMES", "AGE","CHILD")
df

## Data frame structure
str(df)

df$name
df$NAMES

## examples for R : factor
blood <- c("A","B+","O","AB","O")
blood
class(blood)
blood1 <- factor(blood)
blood1
class(blood1)
str(blood1)

# infinite values
inf <- 2/0
is.infinite(inf)
