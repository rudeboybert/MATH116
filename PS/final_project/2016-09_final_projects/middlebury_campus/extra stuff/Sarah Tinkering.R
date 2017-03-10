library(dplyr)
library(ggplot2)

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

word_root_race_change <- month_word_changes %>% 
  filter((words == "antiracism") | (words == "antiracist") | (s == "nonracist")|
           (words == "postracial")|(words == "postracialism")|(words == "racial")|
           (words == "racialized")|(words == "racially")|(words == "racism")|
           (words == "racist")|(words == "racists")|(words == "raciallycharged")) %>% 
  summarize(Change = mean(percent_diff))
View(word_root_race_change)

ggplot(word_root_race_change, aes(x = date, y = Change)) + geom_line()

word_changes <- word_changes %>% 
  filter(percent_diff != "NA")
View(word_changes)

word_root_assault <- data %>% 
  filter((words == "assault") | (words == "assaulted") | (words == "assaulting")|
           (words == "assaults")) %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))

View(word_root_assault)
ggplot(word_root_assault, aes(x = date, y = Total_counts)) + geom_point() +
  geom_smooth()

mental_health <- data %>% 
  filter((words == "anxiety") | (words == "depression") | (words == "suicide")) 


mental_health_total <- data %>% 
  filter((words == "anxiety") | (words == "depression") | (words == "suicide")) %>% 
  group_by(date) %>% 
  mutate(Total_Counts = sum(counts))

View(mental_health)
ggplot(mental_health, aes(x = date, y = counts, col=words)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x = "Issue", y = "Frequence", title = "Mental Health")

View(mental_health_total)

ggplot(mental_health_total, aes(x = date, y = Total_Counts)) + geom_point() +
  geom_smooth(se=FALSE) +
  labs(x = "Issue", y = "Frequence", title = "Mental Health")

terrorism_total <- data %>% 
  filter((words == "terrorism") | (words == "terrorist") | (words == "terroists")) %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))

ggplot(terrorism_total, aes(x = date, y = Total_counts)) + geom_line() +
  labs(x="Issue", y="Frequency", title="Terrorism")

terrorism <- data %>% 
  filter((words == "terrorism") | (words == "terrorist") | (words == "terroists")) 

ggplot(terrorism, aes(x = date, y = counts, col=words)) + geom_point() +
  labs(x="Issue", y="Frequency", title="Terrorism")

word_changes_year <- word_changes %>% 
  grop_by(year)
word_SGA <-data %>% 
  filter(words == "sga") %>% 
  group_by(date) %>% 
  summarize(Total_counts = sum(counts))
word_SGA

ggplot(word_SGA, aes(x=date, y=Total_counts)) + geom_line()

Ideas:
  Root word rac(ial)(ism)(ialized)
Root word vandal
Yik yak 
Assault
feminis root words
election
sanders vs. clinton month by month
AAL
environment root words/footprint/carbon neutrality
mental health (depression, anxiety, suicide)
refugee(s)
terrorism

percent_diff_year <- bind_rows(bitcoin, gold) %>%
  group_by(type) %>%
  arrange(type, date) %>% 
  mutate(percent_diff = 100*(price-lag(price))/lag(price)) %>% 
  tbl_df()


month_word_changes <- by_month %>%
  group_by(words) %>%
  arrange(year,month) %>% 
  mutate(percent_diff = 100*(counts-lag(counts))/lag(counts)) %>% 
  tbl_df() 

by_month <- data %>% 
  group_by(year, month, words) %>% 
  summarize(counts=sum(counts))