get_sample_of_congress <- function(n, seed){
  set.seed(seed)
  url <- "https://rudeboybert.github.io/MATH116/assets/PS/raw_data/congress.csv"
  congress <- suppressMessages(readr::read_csv(url))
  sample_congress <- dplyr::sample_n(congress, n)
  return(sample_congress)
}

