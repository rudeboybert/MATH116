example <- data_frame(
  name = c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010),
  gender = c("m", "f", "m", "f", "m", "f","m", "f","m", "f","m", "f","m", "f","m", "f","m", "f","m", "f"),
  prop = c(0.7230805, 0.2769195, 0.7327779, 0.2672221, 0.7436935, 0.2563065, 0.7297949, 0.2702051, 0.7219176, 0.2780824, 0.7213558, 0.2786442, 0.7359378, 0.2640622, 0.7853941, 0.2146059,0.8108004, 0.1891996, 0.8430264, 0.1569736, 0.9251258, 0.0748742)
)
View(example)



Joined_Gender_lead_combined <- Joined_Gender_Lead_Female %>% left_join(Joined_Gender_Lead_Male, by = c("Year", "date")) %>% ungroup %>% select(Female_Count, Male_Count, Year, date)

View(Joined_Gender_Lead_Female)
View(Joined_Gender_Lead_Male)

Joined_Gender_lead_combined_difference2 <- Joined_Gender_lead_combined %>% mutate(Male_Difference=Male_Count/(Male_Count+Female_Count)) %>%  filter(Year>=2000 & Year<= 2009)

Joined_Gender_lead_combined_difference3 <- Joined_Gender_lead_combined %>% mutate(Female_Difference=Female_Count/(Male_Count+Female_Count)) %>% filter(Year>=2000 & Year<= 2009) 
?union

union <- union(Joined_Gender_lead_combined_difference3, Joined_Gender_lead_combined_difference2)
View(union)

View(Joined_Gender_lead_combined_difference2)


