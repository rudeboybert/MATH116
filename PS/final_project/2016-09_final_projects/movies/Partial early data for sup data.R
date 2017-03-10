library(ggplot2)
library(dplyr)
library(mosaic)
Gender_Lead_in_Movies  <- readr::read_csv("/home/tinac/Final Project/Possible extra data set/Gender_Lead_in_Movies.csv")

View(Gender_Lead_in_Movies)

Joined_Gender_Lead_in_Movies<-Gender_Lead_in_Movies%>%group_by(Gender, Year)%>%summarise(count=n())

Joined_Gender_Lead_Female_in_Movies<-Joined_Gender_Lead_in_Movies%>%filter(Gender=="f")%>%mutate(Female_Count=count)

Joined_Gender_Lead_Male_in_Movies<-Joined_Gender_Lead_in_Movies%>%filter(Gender=="m")%>%mutate(Male_Count=count)

Joined_Gender_lead_combined_in_Movies<-Joined_Gender_Lead_Female_in_Movies%>%left_join(Joined_Gender_Lead_Male_in_Movies, by = c("Year"))%>%ungroup%>%select(Female_Count, Male_Count, Year)

Joined_Gender_lead_combined_difference_in_Movies<-Joined_Gender_lead_combined_in_Movies%>%mutate(difference=Male_Count-Female_Count)
View(Joined_Gender_lead_combined_difference_in_Movies)

