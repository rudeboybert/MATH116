library(dplyr)
library(ggplot2)
library(scales)
library(plotly)

#Environment word cluster
word_root_environment <- data %>% 
  filter((words == "environment") | (words == "environmental")
         |(words == "carbon")|(words == "environmentalism")|
           (words == "sustainability")| (words == "ecofriendly")) %>%
  group_by(words) %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))

ggplot(word_root_environment, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE) + labs(title = "Environment", x = "Date", y = "Frequency")


#Environment separated by word
word_root_environment <- data %>% 
  filter((words == "environment") | (words == "environmental")
           |(words == "carbon")|(words == "environmentalism")|
           (words == "sustainability")| (words == "ecofriendly"))

ggplot(word_root_environment, aes(x = date, y = counts, col=words)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="Environment")

ggplotly()

#Alcohol
word_root_alcohol <- data %>%
  filter((words == "alcohol") | (words == "liquor") | (words == "beer") |
           (words == "drunk") | (words == "alcoholpoisoning") | (words == "BAC") | (words == "underagedrinking") ) %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_alcohol, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="Alcohol")

ggplotly()

#Alcohol separated by word
word_root_alcohol <- data %>%
  filter((words == "alcohol") | (words == "liquor") | (words == "beer") |
           (words == "drunk") | (words == "alcoholpoisoning") | (words == "BAC") | (words == "underagedrinking"))

ggplot(word_root_alcohol, aes(x = date, y = counts, col=words)) + geom_point() + 
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="Alcohol")

ggplotly()

#Vandalism word cluster
word_root_vandalism <- data %>%
  filter((words == "vandal") | (words == "vandalism") | (words == "vandalize") |
           (words == "vandals") | (words == "deface") | (words == "vandalized") |
           (words == "vandalizing") | (words == "graffiti")  | (words == "defaced") |
           (words == "defacing")) %>% 
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_vandalism, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="Vandalism")

ggplotly()

