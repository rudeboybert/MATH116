get_sample_of_congress <- function(n){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- suppressMessages(readr::read_csv(url))
  congress <- dplyr::select(congress, -c(bioguide, middlename, suffix))
  
  sample_of_congress <- dplyr::sample_n(congress, n)
  return(sample_of_congress)
}

get_sample_of_congress_then_and_now <- function(n_80, n_113){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- suppressMessages(readr::read_csv(url))
  congress <- dplyr::select(congress, -c(bioguide, middlename, suffix))
  
  congress_80 <- dplyr::filter(congress, congress==80)
  congress_80 <- dplyr::sample_n(congress, n_80)
  congress_113 <- dplyr::filter(congress, congress==80)
  congress_113 <- dplyr::sample_n(congress, n_113)
  sample_of_congress_then_and_now <- dplyr::bind_rows(congress_80, congress_113)
  return(sample_of_congress_then_and_now)
}

get_sample_of_congress_113 <- function(n_113){
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- suppressMessages(readr::read_csv(url)) 
  congress <- dplyr::select(congress, -c(bioguide, middlename, suffix))
  
  congress_113 <- dplyr::filter(congress, congress==113)
  sample_of_congress_113 <- dplyr::sample_n(congress_113, n_113)
  return(sample_of_congress_113)
}

