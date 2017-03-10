load("~/Final Project/campusdata/campusdatawfloor.RData")
library(dplyr)
library(lubridate)

word_changes <- data %>%
  group_by(words) %>%
  arrange(date) %>% 
  mutate(percent_diff = 100*(counts-lag(counts))/lag(counts)) %>% 
  tbl_df() 


View(word_changes)
#yik yak
yikyak<-data %>% 
  filter(words=="yik"| words=="yak"|words=="yik-yak"|words=="yikyak") %>% 
  group_by(date) %>% 
  summarize(count=n())

ggplot(data=yikyak, aes(x=date,y=count))+geom_point()+geom_smooth(se=FALSE)

#feminism

feminism<-data %>% 
  filter(words=="feminism"|words=="feminist"|words=="sexism"|words=="patriarchy"|words=="misogyny") %>% 
  group_by(date,words)
  
feminism_changes <- feminism %>% 
  arrange(date) %>% 
  mutate(percent_diff = 100*(count-lag(count))/lag(count)) %>% 
  tbl_df() 

ggplot(data=feminism, aes(x=date, y=count,color=words))+geom_point()+geom_smooth()


ggplot(data=feminism_changes, aes(x=date,y=percent_diff))+geom_point()+geom_smooth()

#election
election<-data %>% 
  filter(words=="clinton"|words=="trump"|words=="sanders"|words=="obama"|words=="romney") 

election2016<-data %>% 
  filter(words=="clinton"|words=="trump"|words=="sanders") %>% 
  filter(year>=2015)

ggplot(data=election2016, aes(x=date,y=counts,color=words))+geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)

ggplot(data=election, aes(x=date,y=counts,color=words))+geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)+ylim(0,30)
#refugee

refugee<-data %>% 
  filter(words=="refuge"|words=="refugee"|words=="asylum") %>% 
  group_by(date) %>% 
  summarize(count=n())

ggplot(data=refugee, aes(x=date,y=count))+geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)



SGA<-data %>% 
  filter(words=="sga")

ggplot(data=SGA, aes(x=date,y=counts)) +geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)


data2<-data %>%
  rename(word=words)

sentiment_data<-data2 %>% 
  inner_join(get_sentiments("bing"))

ggplot(data=sentiment_data, aes(x=score, y=count))+geom_point()


sentiment_data %>%
  filter(n > 150) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_bar(alpha = 0.8, stat = "identity") +
  labs(y = "Contribution to sentiment",
       x = NULL) +
  coord_flip()






data2 %>%
  with(wordcloud(words, count, max.words = 100))


data2 %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("#F8766D", "#00BFC4"),
                   max.words = 100)



bingnegative <- get_sentiments("bing") %>% 
  filter(sentiment == "negative")

wordcounts <- tidy_books %>%
  group_by(book, chapter) %>%
  summarize(words = n())

data2 %>%
  semi_join(bingnegative) %>%
  group_by(word, date) %>%
  summarize(negativewords = n()) %>%
  mutate(ratio = negativewords/counts) %>%
  filter(chapter != 0) %>%
  top_n(1) %>%
  ungroup