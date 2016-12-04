library(dplyr)

get_sample_of_congress <- function(n){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- readr::read_csv(url, col_types = cols()) %>% 
    select(-c(bioguide, middlename, suffix))
    
  sample_of_congress <- congress %>%  
    sample_n(n)
  return(sample_of_congress)
}

get_sample_of_congress_80_and_113 <- function(n_80, n_113){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- readr::read_csv(url, col_types = cols()) %>% 
    select(-c(bioguide, middlename, suffix))
  
  congress_80 <- congress %>% 
    filter(congress==80) %>% 
    sample_n(n_80)
  
  congress_113 <- congress %>% 
    filter(congress==113) %>% 
    sample_n(n_113)
  
  sample_of_congress_80_and_113 <- bind_rows(congress_80, congress_113) %>% 
    sample_n(n_80+n_113)
  
  return(sample_of_congress_80_and_113)
}

get_sample_of_congress_113 <- function(n_113){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- readr::read_csv(url, col_types = cols()) %>% 
    select(-c(bioguide, middlename, suffix))
  
  sample_of_congress_113 <- congress %>% 
    filter(congress==113) %>% 
    sample_n(n_113)
  return(sample_of_congress_113)
}

SE_diff_means <- function(data, variable, group_by_variable){
  summaries <- data %>% 
    rename_(x=variable) %>% 
    group_by_(group_by_variable) %>% 
    summarise(n=n(), s=sd(x))

  n1 <- summaries$n[1]
  n2 <- summaries$n[2]
  s1 <- summaries$s[1]
  s2 <- summaries$s[2]
  
  a <- (n1-1)*s1^2 + (n2-1)*s2^2
  b <- n1 + n2 -2
  c <- 1/n1 + 1/n2
  
  SE <- sqrt((a/b)*c)
  return(SE)
}





