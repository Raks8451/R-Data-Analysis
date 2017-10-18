## Analysis on movielens datasets 

##Set the working directory





setwd("C:\\Analytics\\Personal\\Machine Learning\\Training\\R\\Code Example\\Basic R\\Analytics Path\\Visualization\\EDA & VIZ\\ml-100k")



##Read the "u.user" file into users dataframe
## Note: separator is "|"
##       No header



users = read.csv("u.user", sep="|", header = F ) 

## Set columnames to the file 
#user_id
#age
#gender
#occupation
#zip-code



names(users) = c('user_id', 'age', 
                 'gender', 'occupation',
                 'zip_code')

## ratings data file 

##Read the "u.data" file into ratings dataframe
## Note: separator is "\t"
##       No header



ratings = read.csv("u.data", 
                   sep = "\t",
                   header=F)



## Set columnames to the file 
#user_id
#movie_id
#rating
#unix_timestamp


names(ratings) = c('user_id', 'movie_id', 
                   'rating', 'unix_timestamp')



##Read the "u.item" file into movies dataframe
## Note: separator is "|"
##       No header


movies = read.csv("u.item", 
                  sep="|", 
                  header=F) #


## REMOVE THE EXTRA VARIABLES FROM dataframe movies
## Consider only first 5 variables for 
#analysis



movies = movies[ , 1:5]


## Set columnames to the file 
#movie_id
#title
#release_date
#video_release_date
#imdb_url


movie_file_names = c('movie_id', 
                     'title', 
                     'release_date', 
                     'video_release_date', 
                     'imdb_url')
names(movies) = movie_file_names

## merge all three files 
## MOVIES AND RATINGS FILE USING MOVIE ID 
##Call new df as MV_RATINGS




MV_RATINGS = merge( ratings, movies ,
                    by = "movie_id")

### movies with rating and users by user id 
### Call new df - MV_RATINGS_USR



MV_RATINGS_USR = merge( MV_RATINGS,  
                        users , by = "user_id")

## IF required delet the other files after merging all the files )
## lists all the current objects in the session


ls()  

## removes all the objects in the session 



rm( "movies", "ratings", "users") 


##Add a column in MV_RATING_USR and name it dummy
## Assign value = 1 to all the rows of column dummy

str(MV_RATINGS_USR)


MV_RATINGS_USR$dummy = 1
### exploration 


##Get the count of unique titles in the MV_Rating_USR dataframe 

tab1 <- table(MV_RATINGS_USR$title)

tab <- as.data.frame(tab1)
#tab = aggregate( MV_RATINGS_USR$dummy , 
#                 by=list(unique.values = MV_RATINGS_USR$title) 
#                 , FUN = sum )
 


##Change the dataframe in decreasing order



tab =  tab[order(tab$Freq, decreasing =TRUE), ]


##Calculate the mean of each rating by title




tab2 = aggregate(MV_RATINGS_USR$rating, 
                 by=list(MV_RATINGS_USR$title), 
                 FUN=mean )

names(tab2)

names(tab)


tab3 = aggregate(MV_RATINGS_USR$rating, 
                 by=list(MV_RATINGS_USR$gender), 
                 FUN=mean )

tab4 = aggregate(MV_RATINGS_USR$rating, 
                 by=list(MV_RATINGS_USR$occupation), 
                 FUN=mean )

###merge number of ratings with avg rating 



movies_num_avg_rtng = merge(tab, 
                            tab2, 
                            by.y = "Group.1",
                            by.x = "Var1")



# Give a name to each column
# movie_name
# total_rating
# avg_rating




names(movies_num_avg_rtng) = c("movie_name", "total_rating", "avg_rating")


#Visual EDA



library(ggplot2)

ggplot(movies_num_avg_rtng, aes(avg_rating)) +
  geom_histogram(binwidth = .5)

#Looks skewed to the left. What about after normalization?






##Draw a scatter plot between total_rating and avg_rating

ggplot(movies_num_avg_rtng, aes(total_rating, avg_rating)) +
  geom_point()


names(MV_RATINGS_USR)


## Add one column in MV_RATINGS_USR called "year" and 
##populate release year in that



MV_RATINGS_USR$year = as.numeric(
  substr(
    MV_RATINGS_USR$release_date, 8, 11))


head(MV_RATINGS_USR$year)



##Calculate the mean of each rating by year




year_avg = aggregate(MV_RATINGS_USR$rating, 
                     by=list(MV_RATINGS_USR$year), 
                     FUN=mean)
 
View(year_avg)

## delete the first record to avoid 971(which is a typo)




year_avg = year_avg[-1,]


##Give names to the column of year_avg as:
##Year
##avg_rating


names(year_avg ) = c("Year", "avg_rating")


##Draw a scatter plot between Year and avg_rating




ggplot( year_avg, aes(Year, avg_rating)) + geom_point()




