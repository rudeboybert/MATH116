library(stringr)
library(dplyr)
library(tm)
library(tidytext)
library(lubridate)



# Split strings by whitespace. Returns a list of vectors.
split <-  function(strings) {
  str_split(str_subset(strings, "[^[:space:]]+"), "[[:space:]]+")
}

strip <- function(strings, remove) {
  str_replace(
    str_replace(strings, sprintf("^[%s]+", remove), " "),
    sprintf("[%s]+$", remove), "")
}


file_to_words <- function(filename) {
  con <- file(filename, open="r")
  lines <-readLines(con,warn=FALSE,encoding="UTF-8") %>%
        as.character()
  close(con)
  words<-unlist(split(lines), recursive = TRUE, use.names = TRUE)
  words<-words %>% 
    tolower() %>%
    removeNumbers() %>%
    removePunctuation() %>%
    removeWords(stopwords("english")) %>%
    removeWords(c("")) %>% 
    stripWhitespace()
  return(words)
}


count_and_date<- function(words, year, month, day) {
  words <- words %>% 
    as_data_frame()

  word_frame<-words %>% 
    group_by(value) %>% 
    summarize(count=n()) %>% 
    arrange(desc(count)) %>% 
    filter(value!="")
  
  word_frame["year"]<-c(rep(year, nrow(word_frame)))
  word_frame["month"]<-c(rep(month, nrow(word_frame)))
  word_frame["day"]<-c(rep(day, nrow(word_frame)))  
    
  return(word_frame)
}  


setwd("~/Final Project/campusdata/")
filelist <- dir()

for(i in 1:125){

  words<-file_to_words(filelist[i])
  month<-as.integer(substr(filelist[i], 1, 2))
  day<-as.integer(substr(filelist[i], 3, 4))
  year<-as.integer(substr(filelist[i], 5, 8))
  
  temp_data<- count_and_date(words,year,month,day)
  colnames(temp_data) <- c("words", "counts", "year","month","day")
  
  temp_data<-temp_data %>% 
    mutate(date=paste(year, month, day, sep="-")) %>% 
    mutate(date=ymd(date)) %>% 
    select(words,counts, date, year, month, day)
  
  if (i==1){
    data<-temp_data
  }
  
  else{
    data<-merge(data,temp_data,all=TRUE)
  }

}



data<-data %>% 
  as.data.frame()

save(data, file = "campusdataagain.RData")


