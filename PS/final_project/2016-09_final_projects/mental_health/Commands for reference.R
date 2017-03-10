 survey <- mh2012_puf %>% 
  rename(state=LST) 

 Things to do:
- Select the variables we want to focus on
- Group by the region
- summarise(categories)
- End outcome is one big table with 4 regions and select variables 
-how to add variable to main dataset which would be "region"
 -or, how to 

South <- filter(mh2012_puf, LST == "TX" |LST == "OK" | LST == "AR"| LST == "LA"| LST == "MS"| LST == "TN"| LST == "AL"| LST == "KY"| LST == "WV"| LST == "FL"| LST == "GA"| LST == "SC"| LST == "NC"| LST == "VA"| LST == "DC"| LST =="MD"| LST =="DE")
South <- mh2012_puf %>% group_by

Midwest <- filter(mh2012_puf, LST == "ND" | LST == "SD" | LST == "NE" | LST == "KS" | LST == "MO" | LST == "IA" | LST == "MN" | LST == "WI" | LST == "IL" | LST == "IN" | LST =="MI" | LST =="OH")
Midwest <- mh2012_puf %>% group_by

This is how I got it to work^ - pretty tedious | 
  
ggplot(data = West, aes(x=sum(MH_intake), y= )) + geom_histogram()
+ geom_point(data = Northeast, colour = "red")

ggplotly()

ggplot(data = West, aes(x=sum(MH_intake)/length(MH_intake))) + geom_histogram() + geom_histogram(data = Northeast, fill = "red") + geom_histogram(data = South, fill = "green") + geom_histogram(data = midwest, fill = "blue") + xlab("Mental Health intake facilities by region")

ggplot(data = West, aes(x=sum(Substance_treatmnt)/length(Substance_treatmnt))) + geom_histogram() + geom_histogram(data = Northeast, fill = "red") + geom_histogram(data = South, fill = "green") + geom_histogram(data = midwest, fill = "blue") + xlab("Substance abuse treatment facilities by region")
