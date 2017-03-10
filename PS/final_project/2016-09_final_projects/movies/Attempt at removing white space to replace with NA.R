
movie_edit_17 <- movie_edit %>%
  as_data_frame()

actor_edit_17 <- actor_edit %>%  
  as_data_frame() %>% 
  mutate(ID=factor(ID))

joined_data_17 <- full_join(movie_edit_17, actor_edit_17, by="ID") %>% 
  mutate(Title = as.character(Title)) %>% 
  mutate(Year = as.character(Year)) %>% 
  mutate(date = paste(Year, "01-01", sep="-")) %>% 
  mutate(date=ymd(date))

joined_data_17 <- joined_data_17$Year %>% tolower() %>% removePunctuation() %>% str_replace_all(" ", "")%>%stripWhitespace()

joined_data_17 <-  joined_data_17%>% mutate(Year=ifelse(is.na(Year), "N/A", Year))

View(joined_data_17)

test <- read.csv("test.csv", na.strings = "")