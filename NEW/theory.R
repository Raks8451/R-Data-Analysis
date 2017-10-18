##  help("mean") or ?mean
## ??mean for content search

#data------data types 1. logical   2. numeric/integer   3. character   4.  complex   5. raw

## difference between a character and a factor
## factor is more efficient comparatively to character
## as.factor and is.factor is possible
## factors can be used to more common value rather than unique values 


           #data structures    1.  vector(1d array)  HOMOGENEOUS(all must be same) DATA TYPE 
                        # VECTOR HAS AUTO-COERCION FUNCTIONALITY  ((1,2,3 "HI")->("1","2","3,","HI")
#DATA STRUCTURE IN R 


#Vector --> 1D ARRAY
#1. WHAT ARE VECTORS?
#2. HOW TO CREATE A VECTOR
#3. HOW TO CHECK IF DS IS A VECTOR?
#4. HOW TO GIVE NAME TO A VECTOR?
#5. VECTORS MANIPULATION?


##   vector <- c()
##             names() these two are functions
## in vectors all must be same data types


##MATRIX --> 2D ARRAY HOMOGENEOUS DATATYPE
##matrix() function is used to build a matrix

##another easy way to create a matrix
##Cbind()--> binds column wise
##rbind()--> binds row wise

#byrow= TRUE when we need elements in rowwise

## naming the matrices by rownames( ) and colnames( )
## or we can use dimnames attribute


#check if datastructure is a matrix
##  is.matrix(m)

## subset element
##  var[row,col

## sample() is a function used to generate a random value
## select an entire row or column --> m[,1],m[1,],m[4]

# subsetting the multiple elements
## m[1,c(2,3)]
## m
## m[1,c(2,3)]
## m[c(1,2),c(2,3)]

## LIST
## LIST IS A GENERIC VECTOR CONTAINING OTHER OBJECTS
## A LIST IS AN R-OBJECT WHICH CAN CONTAIN MANY DIFFERENT TYPES OF ELEMENTS LIKE NUMBER,STRING VECTOR AND EVEN ANOTHER LIST INSIDE IT.
## PEARED LIST IS AN EASY TRANSFORMATION OF THE DATA THAN LIST

## LIST CAN CONTAIN ANY TYPE OF DATA IT IS A HETEROGENEOUS DATASTRUCTURE
## LIST CAN ALSO CONTAIN A MATRIX OR A MATRIX AS IT'S ELEMENT
## LIST IS CREATED USING list()
## list is flexible and complex


## learn about paired list --> complex and faster insert and update are faster but information retrieval in slower comparitively

## class --> gives the higher hierarchy
## typeof --> gives the lower hierarchy
