#Root Words Race:
  
  word_root_race_total <- data %>% 
    filter((words == "antiracism") | (words == "antiracist") | (words == "nonracist")|
             (words == "postracial")|(words == "postracialism")|(words == "racial")|
             (words == "racialized")|(words == "racially")|(words == "racism")|
             (words == "racist")|(words == "racists")|(words == "raciallycharged")) %>%
    group_by(date) %>% 
    summarize(Total_counts = sum(counts))
  
  ggplot(word_root_race_total, aes(x = date, y = Total_counts)) + geom_point() +
    geom_smooth(se=FALSE) +
    labs(x="Issue", y="Frequency", title ="Race Root Words")
  
  word_root_race <- data %>% 
    filter((words == "antiracism") | (words == "antiracist") | (words == "nonracist")|
             (words == "postracial")|(words == "postracialism")|(words == "racial")|
             (words == "racialized")|(words == "racially")|(words == "racism")|
             (words == "racist")|(words == "racists")|(words == "raciallycharged")) 
  
  ggplot(word_root_race, aes(x = date, y = counts, col=words)) + geom_point() +
    geom_smooth(se=FALSE) +
    labs(x="Issue", y="Frequency", title ="Race Root Words")

#Mental Health:
  
mental_health <- data %>% 
  filter((words == "anxiety") | (words == "depression") | (words == "suicide")) 

ggplot(mental_health, aes(x = date, y = counts, col=words)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x = "Issue", y = "Frequence", title = "Mental Health")

mental_health_total <- data %>% 
  filter((words == "anxiety") | (words == "depression") | (words == "suicide")) %>% 
  group_by(date) %>% 
  mutate(Total_Counts = sum(counts))

ggplot(mental_health_total, aes(x = date, y = Total_Counts)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x = "Issue", y = "Frequence", title = "Mental Health")

#Terrorism 
terrorism_total <- data %>% 
  filter((words == "terrorism") | (words == "terrorist") | (words == "terroists")) %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))

ggplot(terrorism_total, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth() +
  labs(x="Issue", y="Frequency", title="Terrorism")
