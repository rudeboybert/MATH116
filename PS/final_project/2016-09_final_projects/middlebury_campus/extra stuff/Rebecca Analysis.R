library(dplyr)
library(lubridate)
library(ggplot2)
library(plotly)


load("~/Final Project/campusdata/campusdataagain.RData")

#THIS IS WRONG: SUMMARIZE??
by_month<- data %>% 
  group_by(year, month,words) %>% 
  summarize(counts=sum(counts))

word_changes <- by_month %>%
  group_by(words) %>%
  arrange(date) %>% 
  mutate(percent_diff = 100*(counts-lag(counts))/lag(counts)) %>% 
  tbl_df() 


#YIKYAK
yikyak<-data %>% 
  filter(words=="yik"| words=="yak"|words=="yik-yak"|words=="yikyak") %>% 
  group_by(date) %>% 
  summarize(count=n())

ggplot(data=yikyak, aes(x=date,y=count))+geom_point()+geom_smooth()


#FEMINISM


feminism<-data %>% 
  filter(words=="feminism"|words=="feminist"|words=="sexism"|words=="patriarchy"|words=="misogyny") %>% 
  group_by(date) %>% 
  summarize(count=n()) 

mean<-feminism %>% 
  summarize(mean(count))
se<-feminism %>% 
  summarize(se=sd(counts)/(68))
1.808824

ggplot(data=feminism, aes(x=date,y=count))+geom_point()+geom_smooth(se=FALSE)+ylim(0,4)


The discussion around women's issues appears to be consistent but somewhat limited. The average issue that mentions this topic will mention it about two times.  Additionally, about half of the issues from the past five years mentioned this topic. Why is the discussion of such a prevalent issue behaving in this way? We see it as a reflection of the fact that while problems of sexism and misogyny are far from absent at Middlebury, they don't often emerge as moments of direct conflict.


#Election
# look @ macro then look at past ~1-1.5 years to see close up trends.
# Compare to general perception of mass media coverage: too much trump, favor clinton over sanders. 
# Any discrepancies, Why?

election<-data %>% 
  filter(words=="obama"|words=="romney"|words=="clinton"|words=="trump"|words=="sanders") %>% 
  filter(year>2010|year<=2013)
 

election2016<-election %>% 
  filter(words=="clinton"|words=="trump"|words=="sanders") %>% 
  filter(year>=2015)
  
ggplot(data=election, aes(x=date,y=counts,color=words))+geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)


ggplot(data=election2016, aes(x=date,y=counts,color=words))+geom_point(na.rm=TRUE)+geom_smooth(se=FALSE,na.rm=TRUE)


Here we see that the dynamics of election coverage in the campus divereged from wider national trends. For most of the campaign, Senator Sanders was mentioned more often than any of the candidates. This is not true of the national news media, where coverage of trump dominated. But, in some ways this mirrors trends that took place in extremely liberal dominated communities. The possibility of Trump winning the presidency appeared so absurd that most didn't give it any thought. Thus, when he did win 








data2<-data %>% 
  rename(word=words) %>% 
  inner_join(get_sentiments("bing")) %>% 
  group_by(sentiment) %>% 
  summarize(count=n())





