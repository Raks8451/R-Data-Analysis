



###   https://cran.r-project.org/web/packages/available_packages_by_name.html#available-packages-R











x <- TRUE
class(x)
TRUE
class(TRUE)
FALSE
false=3
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

2L##numeric
class(2L)

is.numeric(2)
is.numeric(2L)

is.integer(2)
is.integer(2L)

##character
"I love data science"
class("i love data science")
class("2")
class(2)
class(i love data science)

##coercion function to convert one type to another
as.numeric(FALSE)


as.character(4)
as.numeric("4.5")
as.integer("4.5")
as.numeric("hi")
as.numeric(TRUE)
as.character(TRUE)
as.integer(TRUE)
as.integer(hi)

is.numeric(as.numeric("hi"))
is.numeric(as.numeric("4.5"))
is.numeric(as.character("hi"))
a <- is.numeric(as.numeric("hi"))
class(a)

#complex values(complex numbers with real and imaginary)

z = 1+2i      #create a complex number
z             #print the value of Z
class(z)     #print the class name of Z
sqrt(-1)     
sqrt(-1+0i)
sqrt(as.complex(-1))

##extract real component of a complex number
Re(z)

##extract imaginary component
Im(z)

#the modulus and argument are also called the polar coordinates.
#if z=x+iy  with real ax and y for r= Mod(z) = sqrt(x^2+y^2)
#and 


Mod(z)


Arg(z)



v <- charToRaw("Hello")
class(v)
v

v = charToRaw("rakshith")
class(v)
v
