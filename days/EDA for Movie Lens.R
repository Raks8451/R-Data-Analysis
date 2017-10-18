setwd("D:\\Rakshith\\Documents\\R programming\\NEW\\ml-100k\\ml-100k")

users=read.csv("u.user",sep="|",header = F)

## set columnames to the file
## user_id
## age
## gender
## occupation
## zip-code

View(users)

colnames(users) <- c("user_id","age","gender","occupation","zip-code")

names(users) <- c("user_id","age","gender","occupation","zip-code")

View(users)

## rating data file


rating <- read.csv("u.data",sep = "\t",header = F)
View(rating)

names(rating) <- c("user_id","movie_id","rating","unix_timestamp") 
View(rating)


movies<- read.csv("u.item",sep = "|",header = F)

View(movies)


## remove the extra variables from data frame movies
## consider only first 5 variables for analysis

movies <- movies[,1:5]


View(movies)

names(movies) <- c("movie_id","title","release_date","video_release_date","imdb_url")



## merge all three files
## movies and ratings file using movie ID
## call new df as MV_RATINGS

MV_RATINGS = merge(rating,movies,by="movie_id")

## movies with rating and user by user_id
## call new df MV_RATINGS_USR

MV_RATINGS_USR <- merge(users,rating,by="user_id") 
View(MV_RATINGS_USR)

MV_RATINGS_USR <- merge(users,MV_RATINGS,by="user_id")

## if required delete the other files after merging all the files
## list all the current objects in the session

ls()

## removes all the objects in the session

rm("movies","rating","users")
ls()


## add a column in MV_RATING_USR and name it dummy
## assign value 1 to all the rows of the column dummy

str(MV_RATINGS_USR)

MV_RATINGS_USR$dummy
MV_RATINGS_USR$dummy=1

View(MV_RATINGS_USR)

## exploration
## get the count of unique titles in the MV_RATINGS_USR data frame

unique(MV_RATINGS_USR$title)
     
tab1 <- table(MV_RATINGS_USR$title)
tab1

tab <- as.data.frame(tab1)
tab

## another way to do the same



# tab <- aggregate(MV_RATINGS_USR$dummy,by=list(unique.values=MV_RATINGS_USR$title), FUN=sum)
# tab
# View(tab)


## change the data frame in desc freq order


tab <- tab[order(tab$Freq,decreasing = T),]
View(tab)

## calculate the mean of each rating by title

mean(MV_RATINGS_USR$rating,by="title")
 
tab2 <- aggregate(MV_RATINGS_USR$rating,by=list(MV_RATINGS_USR$title),FUN=mean)
View(tab2)

## calculate the mean of each rating by gender

tab3 <- aggregate(MV_RATINGS_USR$rating,by=list(MV_RATINGS_USR$gender),FUN=mean)
View(tab3)

## calculate the mean of each rating by occupation

tab4 <- aggregate(MV_RATINGS_USR$rating,by=list(MV_RATINGS_USR$occupation),FUN=mean)
tab4<- tab4[order(tab4$x,decreasing = T),]
View(tab4)

## merge the number of ratings with avg rating

movies_num_avg_rating=merge(tab,tab2,by.x="Var1",by.y="Group.1")

View(movies_num_avg_rating)

names(movies_num_avg_rating) <- c("movie_name","Freq","avg_rating")
View(movies_num_avg_rating)

movies_num_avg_rating <- movies_num_avg_rating[order(movies_num_avg_rating$Freq,decreasing = F),]

movies_num_avg_rating <- movies_num_avg_rating[order(movies_num_avg_rating$Freq,decreasing = T),]

movies_num_avg_rating <- movies_num_avg_rating[order(movies_num_avg_rating$x,decreasing = T),]


## Visual EDA

library(ggplot2)

## build an histogram "movies_num_avg_rating$avgrating"
## dataset with bandwidth=.5

ggplot(movies_num_avg_rating,aes(x=avg_rating))+geom_histogram(binwidth=0.5)


## looks skewed to the left. what about after normal distibution








## draw a scatter plot between freq and avg rating


ggplot(movies_num_avg_rating,aes(Freq,avg_rating))+geom_point()

ggplot(movies_num_avg_rating,aes(Freq,avg_rating))+geom_point()+geom_smooth()




names(MV_RATINGS_USR)

MV_RATINGS_USR$year=as.numeric(substr(MV_RATINGS_USR$release_date,8,11))
head(MV_RATINGS_USR$year)
View(MV_RATINGS_USR)



## calculate the mean of each ration by year

tab5 <- aggregate(MV_RATINGS_USR$rating,by=list(MV_RATINGS_USR$year),FUN=mean)
View(tab5)


## deletion
tab5 <- tab5[-1,]
View(tab5)

## updation

tab5$Group.1(971,)<-tab5$Group.1(1971,)



