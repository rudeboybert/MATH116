library(tidyverse)
setwd("~/Downloads/Final Projects/")

titles <- c(
  "Where Should MiddKids Ski This J-Term?",
  "Drug Use Within Age Groups",
  "Quantifying Middlebury's Collective Consciousness",
  "Who Sits at the Top of NESCAC Stack?",
  "Sexism on the Silver Screen: Exploring Film's Gender Divide",
  "Marijuana Retail and Production Dispersal in Colorado",
  "Unemployment and Migration in the United States",
  "Will Your Major Field Change Your Prospects for Employment?",
  "Looking for Mental Health Care? West is Best",
  "The Systematic Gender Gap in STEM Fields: Why Should We Care?"
  )
folder <- c("skiing", "drug_use", "middlebury_campus", "NESCAC",
            "movies", "marijuana", "unemployment", "college_majors",
            "mental_health", "gender_STEM")


final_projects <- read_csv("groups.csv") %>%
  mutate(
    Title=titles,
    Folder=folder
    )

