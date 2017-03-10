library(dplyr)
library(ggplot2)
crime_survey <- da36448.0004 %>% 
  as_data_frame()

crime_survey <- crime_survey %>% 
  select(V4014,V4015, V4016, V4021B, V4024, V4025, V4041A, V4041B, V4049, V4069, V4070, V4078, V4081, V4082, V4083, V4089, V4094, V4095, V4096) %>% 
  rename(
    month = V4014,
    year_incident = V4015,
    no_times_occured_6mo = V4016,
    time_incident_occured = V4021B,
    where_incident_happened = V4024,
    offender_right_tobethere = V4025,
    school=V4041A,
    part_of_school = V4041B, 
    weapon = V4049,
    sexual_contact_force = V4069,
    sexual_contact_wo_force = V4070,
    rape_threat = V4078,
    sexual_assault_threat = V4081,
    threat_sexual_contact_force = V4082,
    threat_sexual_contact_noforce = V4083,
    threat_followed_surrounded= V4089, 
    rape = V4094,
    attempted_rape = V4095,
    sexual_assault = V4096
    )

