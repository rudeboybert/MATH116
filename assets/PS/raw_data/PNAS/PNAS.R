library(haven)
library(dplyr)
library(ggplot2)
library(readr)

hiring <- read_sav("./assets/PS/raw_data/PNAS/Moss-Racusin_etal_replicate.sav") %>%
  tbl_df() %>%
  mutate(
    applicant_gender = ifelse(cond==0, "male", "female"),
    evaluator_gender = ifelse(gender==0, "male", "female")
    ) %>%
  select(Subject, applicant_gender, evaluator_gender, likeable, hireable, competence, competence2, salary, mentoring) %>%
  arrange(Subject)
write_csv(hiring, path="./assets/PS/hiring.csv")
