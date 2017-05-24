crime_data_better <- crimedata %>%
  rename(qualifying_name  = `Qualifying Name`, violent_crimes =`Total Violent Crimes Rate`, property_crimes =
           `Total Property Crimes Rate`, arson= `Arsons Rate`) %>% 
  select(qualifying_name, violent_crimes, property_crimes, arson) %>% 
  gather("type", "rate", c(2:4))

ggplot(crime_data2, aes(x=qualifying_name, y=rate, fill=type)) +
  geom_col(position="dodge")

# Nighlife

entertainment_data <- drinkingdata %>%
  rename(qualifying_name=`Qualifying Name`, num_place_1_4= `Number of Establishments with 1 to 4 Employees: Food Services and Drinking Places`,
         num_place_5_9= `Number of Establishments with 5 to 9 Employees: Food Services and Drinking Places`, 
         num_place_10_19= `Number of Establishments with 10 to 19 Employees: Food Services and Drinking Places`,
         num_place_20_49= `Number of Establishments with 20 to 49 Employees: Food Services and Drinking Places`,
         num_place_50_99= `Number of Establishments with 50 to 99 Employees: Food Services and Drinking Places`,
         num_place_100_249= `Number of Establishments with 100 to 249 Employees: Food Services and Drinking Places`,
         num_place_250_499= `Number of Establishments with 250 to 499 Employees: Food Services and Drinking Places`,
         num_place_500_999= `Number of Establishments with 500 to 999 Employees: Food Services and Drinking Places`,
         num_place_1000= `Number of Establishments with 1,000 Employees or More: Food Services and Drinking Places`) %>% 
  select(qualifying_name, num_place_1_4, num_place_5_9, num_place_10_19, num_place_20_49, num_place_50_99, 
         num_place_100_249, num_place_250_499, num_place_500_999, num_place_1000) %>% 
  gather("num_employees", "count", c(2:10))

ggplot(entertainment_data, aes(x=num_employees, y=count)) + geom_col() + facet_wrap(~qualifying_name)








