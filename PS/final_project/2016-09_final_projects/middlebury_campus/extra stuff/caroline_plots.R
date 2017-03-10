library(dplyr)
library(ggplot2)
library(scales)
library(plotly)



#Environment word cluster
word_root_environment <- data %>% 
  filter((words == "environment") | (words == "environmental") | (words == "carbonneutral")|
           (words == "carbonneutrality")|(words == "carbon")|(words == "environmentalism")|
           (words == "sustainability")|(words == "environmentally")|(words == "environmentalist")|
           (words == "environmentalists")|(words == "ecofriendly")) %>%
  group_by(words) %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))

ggplot(word_root_environment, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE) + labs(title = "Environment", x = "Date", y = "Frequency")

#Environment separated by word
word_root_environment <- data %>% 
  filter((words == "environment") | (words == "environmental") | (words == "carbonneutral")|
           (words == "carbonneutrality")|(words == "carbon")|(words == "environmentalism")|
           (words == "sustainability")|(words == "environmentally")|(words == "environmentalist")|
           (words == "environmentalists")|(words == "ecofriendly"))

ggplot(word_root_environment, aes(x = date, y = counts, col=words)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="Environment")


#Television word cluser
word_root_TV <- data %>%
  filter((words == "netflix") | (words == "hbo") | (words == "streaming")|
           (words == "movie")|(words == "movies")|(words == "tvshow")) %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_TV, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE)

#Television separated by word
word_root_TV <- data %>%
  filter((words == "netflix") | (words == "hbo") | (words == "streaming")|
           (words == "movie")|(words == "movies")|(words == "tvshow"))

ggplot(word_root_TV, aes(x = date, y = counts, col=words)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="TV")

#Vandalism word cluster
word_root_vandalism <- data %>%
  filter((words == "vandal") | (words == "vandalism") | (words == "vandalize") |
           (words == "vandals") | (words == "deface") | (words == "vandalized") | (words == "vandalizing") | (words == "graffiti")  | (words == "defaced") | (words == "defacing")) %>% 
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_vandalism, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE)

#Vandalism separated by word
word_root_vandalism <- data %>%
  filter((words == "vandal") | (words == "vandalism") | (words == "vandalize") |
           (words == "vandals") | (words == "deface") | (words == "vandalized") | (words == "vandalizing") | (words == "graffiti") | (words == "defaced") | (words == "defacing"))

ggplot(word_root_vandalism, aes(x = date, y = counts, col=words)) + geom_point() + scale_y_continuous(limits = c(0, 75)) +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="vandalism")

#Male word cluster
word_root_male <- data %>%
  filter((words == "male") | (words == "men") | (words == "man") |
           (words == "boy") | (words == "he") | (words == "him") | (words == "his") | (words == "mens") | (words == "masculine") | (words == "masculinity")) %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_male, aes(x = date, y = Total_counts)) + geom_point() + scale_y_continuous(limits = c(0, 100)) +
  geom_smooth(se=FALSE)

#male separated by word
word_root_male <- data %>%
  filter((words == "male") | (words == "men") | (words == "man") |
           (words == "boy") | (words == "he") | (words == "him") | (words == "his") | (words == "mens") | (words == "masculine") | (words == "masculinity"))

ggplot(word_root_male, aes(x = date, y = counts, col=words)) + geom_point() + scale_y_continuous(limits = c(0, 75)) +
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="male")

#Female word cluster
word_root_female <- data %>%
  filter((words == "female") | (words == "women") | (words == "woman") |
           (words == "girl") | (words == "she") | (words == "her") | (words == "hers") | (words == "womens") | (words == "feminine") | (words == "femininity")) %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_female, aes(x = date, y = Total_counts)) + geom_point() + scale_y_continuous(limits = c(0, 100)) +
  geom_smooth(se=FALSE)

#female separated by word
word_root_female <- data %>%
  filter((words == "female") | (words == "women") | (words == "woman") |
           (words == "girl") | (words == "she") | (words == "her") | (words == "hers") | (words == "womens") | (words == "feminine") | (words == "femininity"))

ggplot(word_root_female, aes(x = date, y = counts, col=words)) + geom_point() + scale_y_continuous(limits = c(0, 75)) +
  geom_smooth(se=FALSE) 
  labs(x="Date", y="Frequency", title ="female")

#AAL
word_root_aal <- data %>%
  filter(words == "aal") %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_aal, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE)

#Alcohol
word_root_alcohol <- data %>%
  filter((words == "alcohol") | (words == "liquor") | (words == "beer") |
                 (words == "drunk") | (words == "alcoholpoisoning") | (words == "BAC") | (words == "underagedrinking") ) %>%
  group_by(date) %>%
  summarize(Total_counts = sum(counts))

ggplot(word_root_alcohol, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth(se=FALSE)

#Alcohol separated by word
word_root_alcohol <- data %>%
  filter((words == "alcohol") | (words == "liquor") | (words == "beer") |
           (words == "drunk") | (words == "alcoholpoisoning") | (words == "BAC") | (words == "underagedrinking"))

ggplot(word_root_alcohol, aes(x = date, y = counts, col=words)) + geom_point() + 
  geom_smooth(se=FALSE) +
  labs(x="Date", y="Frequency", title ="alcohol")