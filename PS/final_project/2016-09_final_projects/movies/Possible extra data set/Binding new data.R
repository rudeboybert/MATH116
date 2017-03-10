# Binding new data sets together. 
library(tm)
library(stringr)
library(lubridate)


movie_edit3 <- movie_edit %>%
  as_data_frame() %>% 
  slice(1:1000)
  
actor_edit3 <- actor_edit %>%  
  as_data_frame() %>% 
  mutate(ID=factor(ID)) %>% 
  slice(1:1000)
  


joined_data <- full_join(movie_edit3, actor_edit3, by="ID") %>% 
  mutate(Title = as.character(Title)) %>% 
  mutate(Year = as.character(Year)) %>% 
  mutate(date = paste(Year, "01-01", sep="-")) %>% 
  mutate(date=ymd(date))

temp <- joined_data %>% 
  group_by(date) %>% 
  summarise(n=n())

ggplot(temp, aes(x=date, y=n)) +
  geom_point()

View(temp)

joined_data$Title %>% tolower() %>% removePunctuation() %>% str_replace_all(" ", "")

removeNumbers("A-B-C, 1-2-3, Baby you and me!")
removePunctuation("H./&e#@!llo Worl------><><><d!")
removeWords("Hello World", "World")
stripWhitespace("   lots    of  superfluous      whitespace ")




View(movie_edit3)

movie_edit_2<-movie_edit%>%mutate(ID="ID")
actor_edit_2<-actor_edit%>%mutate(ID="ID")

New_Movie_data <- movie_edit%>%
  left_join(actor_edit, by = c("ID"))
View(New_Movie_data)            
            
# Why do i keep gettting integer vs factor?????

Final_more_movies_data <- New_Movie_data%>%select(Year, Gender, Title, ID)           
View(Final_more_movies_data)    




library(ggplot2)
library(dplyr)
library(mosaic)
Gender_Lead_in_Movies  <- readr::read_csv("/home/tinac/Final Project/Possible extra data set/Gender_Lead_in_Movies.csv")

Joined_Gender_Lead<-joined_data%>%group_by(Gender, Year)%>%summarise(count=n())

Joined_Gender_Lead_Female<-Joined_Gender_Lead%>%filter(Gender=="f")%>%mutate(Female_Count=count)

Joined_Gender_Lead_Male<-Joined_Gender_Lead%>%filter(Gender=="m")%>%mutate(Male_Count=count)

Joined_Gender_lead_combined<-Joined_Gender_Lead_Female%>%left_join(Joined_Gender_Lead_Male, by = c("Year"))%>%ungroup%>%select(Female_Count, Male_Count, Year)

Joined_Gender_lead_combined_difference<-Joined_Gender_lead_combined%>%mutate(difference=Male_Count-Female_Count)
View(Joined_Gender_lead_combined_difference)

ggplot(data=Gender_lead_combined_difference, aes(x=Year, y=difference))+geom_bar(stat="identity")
THIS COULD BE ALL WE NEED

Interesting variations.....


Gender_lead_combined_difference_proportion<-Gender_lead_combined_difference%>%mutate(proportion=(difference/(Male_Count+Female_Count)))
View(Gender_lead_combined_difference_proportion)

ggplot(data=Gender_lead_combined_difference_proportion, aes(x=Year, y=proportion))+geom_bar(stat="identity")


Gender_lead_combined_proportion_male<-Gender_lead_combined_difference%>%mutate(proportion=(Male_Count/(Male_Count+Female_Count)))
ggplot(data=Gender_lead_combined_proportion_male, aes(x=Year, y=proportion))+geom_bar(stat="identity")

Gender_lead_combined_difference_proportion<-Gender_lead_combined_difference%>%mutate(proportion=(difference/(Male_Count+Female_Count))*100)

NULL DATA CREATION....

set.seed(76)
gender_lead_null_distribution<-Gender_Lead_in_Movies%>%
mutate(gender=shuffle(gender))%>%
select(gender, Year)%>%
summarise(count=n())

Gender_Lead_Null_Female<-gender_lead_null_distribution%>%filter(Gender=="f")%>%mutate(Female_Count=count)

Gender_Lead_Null_Male<-gender_lead_null_distribution%>%filter(Gender=="m")%>%mutate(Male_Count=count)

Gender_lead_Null_combined<-Gender_Lead_Null_Female%>%left_join(Gender_Lead_Null_Male, by = c("Year"))%>%ungroup%>%select(Female_Count, Male_Count, Year)

Gender_lead_Null_combined_difference<-Gender_lead_Null_combined%>%mutate(difference=Male_Count-Female_Count)




movie_edit7 <- movie_edit %>%
  as_data_frame()

actor_edit7 <- actor_edit %>%  
  as_data_frame() %>% 
  mutate(ID=factor(ID))

joined_data77 <- full_join(movie_edit7, actor_edit7, by="ID") %>% 
  mutate(Title = as.character(Title)) %>% 
  mutate(Year = as.character(Year)) %>% 
  mutate(date = paste(Year, "01-01", sep="-")) %>% 
  mutate(date=ymd(date))

joined_data_final <- joined_data77 %>% select(Gender, Year, date, Title) %>% as_data_frame() 
View(joined_data_final)

joined_data_final_1 <-joined_data_final %>% mutate(Year=ifelse(is.na(Year), "N/A", Year))
View(joined_data_final_1)

joined_data_final_2 <- (joined_data_final, missing = NA)

%>% slice(1:1000)

View(joined_data77)
