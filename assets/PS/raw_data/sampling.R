get_sample_of_congress <- function(n){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- suppressMessages(readr::read_csv(url))
  sample_of_congress <- dplyr::sample_n(congress, n)
  return(sample_of_congress)
}

get_sample_of_congress_113 <- function(n){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress_113 <- suppressMessages(readr::read_csv(url)) %>% 
    filter(congress==113)
  sample_of_congress_113 <- dplyr::sample_n(congress_113, n)
  return(sample_of_congress_113)
}

