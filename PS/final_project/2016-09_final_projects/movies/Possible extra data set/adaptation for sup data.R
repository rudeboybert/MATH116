In case it is still not working hopefully this will.


Movie_simplified  <- readr::read_csv("/home/tinac/Final Project/Possible extra data set/Movie_simplified.csv")

AVG_Movie_S <- Movie_simplified %>% group_by(Year, Gender) %>% summarise(mean=mean(AdjBoxOffice))

Filter_AVG_Movie_S <- filter(AVG_Movie_S, Year <= 2009)

ggplot(data = Filter_AVG_Movie_S, aes(x = Year, y = mean, fill=Gender)) +
  geom_bar(position="dodge", stat="identity")