library(ggplot2)
library(dplyr)
library(mosaic)
library(tm)
library(stringr)
library(lubridate)
library(broom)
library(knitr)

Movie.Data.Set_Max.Woolf  <- readr::read_csv("/home/tinac/Final Project/Possible extra data set/Gender_Lead_in_Movies.csv")


tidy_movie_data <- select(Movie.Data.Set_Max.Woolf, Year, Gender, AdjBoxOffice)
View(tidy_movie_data)

tidy_movie_data<-tidy_movie_data$AdjBoxOffice %>% removePunctuation()
View(tidy_movie_data)

Factor_movie_data<- tidy_movie_data%>%  
  as_data_frame() %>% 
  mutate(AdjBoxOffice=factor(AdjBoxOffice)) %>% 
  mutate(Gender=factor(Gender)) %>% 
  mutate(Year=factor(Year))

Sum_ABO<- tidy_movie_data%>%select(Gender, Year, AdjBoxOffice)%>%group_by(Gender, Year)%>%summarise(sum=sum(AdjBoxOffice))

Test_abo_thing<-select(Movie.Data.Set_Max.Woolf, Year, Gender, AdjBoxOffice)
  

Test_abo_thing<-Test_abo_thing$AdjBoxOffice %>% removePunctuation()
View(Test_abo_thing)



Avg_movie_data <- tidy_movie_data%>%  
  as_data_frame() %>% 
  mutate(ABO=factor(AdjBoxOffice))

Avg_movie_data<-Avg_movie_data%>%mutate(mean=mean(ABO))
View(Avg_movie_data)


t11 <- tidy_movie_data %>% mutate( as.numeric())
#use str to see what format the vectors are in
#use as.numeric to turn vectors

str(tidy_movie_data)


t2 <- filter(tidy_movie_data, Year <= 2009)


ggplot(data = t2, aes(x = factor(Gender), y = AdjBoxOffice)) +
  geom_boxplot()


IDEA 2---------- Jared 
Ok i fixed it!!!! hahahah I think its not really how he wanted us to do it, 
but I took the data back to excell converted it so that it removed the $ sign 
which was causing problems.


Movie_simplified  <- readr::read_csv("/home/tinac/Final Project/Possible extra data set/Movie_simplified.csv")

AVG_Movie_S<-Movie_simplified%>%group_by(Year, Gender)%>%summarise(mean=mean(AdjBoxOffice))
View(AVG_Movie_S)
Filter_AVG_Movie_S <- filter(AVG_Movie_S, Year <= 2009)

ggplot(data = Filter_AVG_Movie_S, aes(x = Year, y = mean, fill=Gender)) +
  geom_bar(position="dodge", stat="identity")

