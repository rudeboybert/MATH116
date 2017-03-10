Extra data removed in case we need to look back at it.

ggplot(data=Joined_Gender_lead_combined_difference, aes(x=date, y=Male_Difference))+geom_line(stat="identity")+
  geom_smooth(method="lm", se=FALSE)

ggplot(data=Joined_Gender_lead_filtered, aes(x=date, y=Male_Difference))+geom_point(stat="identity")+
  geom_smooth(method="lm", se=FALSE)

ggplot(data=Joined_Gender_lead_combined_difference, aes(x=date, y=Female_Difference))+geom_line(stat="identity")+
  geom_smooth(method="lm", se=FALSE)

Slope_M <- lm(Male_Difference ~ date, data=Joined_Gender_lead_filtered)
Slope_output_M <- tidy(Slope_M, conf.int = TRUE)
kable(Slope_output_M, digits=3)