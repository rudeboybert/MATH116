
Question 1: Which words are the most popular in general?


Question: Have there been trends in certain topics? 
ie. racial awareness, sustainability, sexual assault, certain types of social media 

In order to address questions:
  - remove English stop words (done!)
  - choose whether we compare things by month or by year or over 5 years
      - make tables:
        - mutate to create a proportion of specific words to total words (by time unit)
        - issue-ly: raw counts by issue (done)
        - monthly: group by word, year, month sum count 
        - yearly: group by word and year, sum count --> 5 observations with counts for each year
        - group by word, sum count --> total count for each word over 5 years

#data <-data %>% 
#mutate(date=paste(year, month, day, sep="-")) %>% 
#mutate(date=ymd(date)) %>% 
#mutate(month=floor_date(date, unit="month")) %>% 
#select(words,counts,month) %>% 
#group_by(words,month) %>% 
#mutate(counts=sum(counts))
***keep year month day variables and then to plot use lubridate
        - change between year: visualizations of certain words 
  - select the words with the highest proportions to investigate
  -Fix n/a problem?

How quickly do we get over things
what effects students
internal and external stimulai 

In order to address Question 2:
  - racism: include words of same root, except for race? Sarah (filter and then sum)
  - netflix Caroline
  - yik-yak Rebecca
  - feminism/feminist Rebecca 
  - AAL Caroline    
  - Clinton/Sanders (by month) LATER!
  - Root word vandal Caroline
  - Assault Sarah
  - election  Rebecca
  - environment root words/footprint/carbon neutrality Caroline
  - mental health (depression, anxiety, suicide) Sarah
  - refugee(s) Rebecca
  - terrorism Sarah

TASKS:
  - make visualizations for counts by year 
  - visualizations for percent change calculation (percent difference)
  - add percent change column to original data set
  - executive summary for each table

by_year <- data %>% 
  group_by(year, words) %>% 
  summarize (year_count=sum(counts))


library(dplyr)
word_changes <- by_year %>%
  group_by(words) %>%
  arrange(year) %>% 
  mutate(percent_diff = 100*(year_count-lag(year_count))/lag(year_count)) %>% 
  tbl_df() 

top_diffs<-word_changes %>% 
  top_n(n = 10, wt = percent_diff)

View(word_changes)


  