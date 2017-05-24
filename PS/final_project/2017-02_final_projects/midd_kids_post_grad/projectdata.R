library(ggplot2)
library(dplyr)
library(readr)
library(stringr)
library(tidyr)

civdata_stats <- read_csv("~/Dropbox/Stats Project/civdata_stats.csv")
View(civdata_stats)

drinking_data <- read_csv("~/Dropbox/Stats Project/drinking_data.csv")
View(drinkingdata)

crimedata <- read_csv("~/Dropbox/Stats Project/crimedata.csv")
View(crimedata)

#GRAPHS

# Education

civdata_stats <- civdata_stats %>% 
  mutate(some_college_prop=`Population 25 Years and Over: Some college`/ `Population 25 Years and Over:`)

education_graph <- civdata_stats %>% 
  ggplot(aes(x=reorder(`Qualifying Name`, -some_college_prop), y=some_college_prop)) + geom_col()+ labs(y="Proportion of Population 25 and Older with Some College") +labs (x="")

education_graph

# Age

civdata_stats_2 <- civdata_stats %>% 
  select(`Qualifying Name`,`Total Population: 18 to 24 Years`,`Total Population: 25 to 34 Years`, `Total Population: 35 to 44 Years`, `Total Population: 45 to 54 Years`, 
         `Total Population: 55 to 64 Years`) %>% 
  gather("age_bracket", "counts", -`Qualifying Name`) %>% 
  arrange(`Qualifying Name`, age_bracket)

total_pop <- ggplot(civdata_stats_2, aes(x=factor(`Qualifying Name`), y=counts, fill=age_bracket)) +
  geom_col(position="dodge")
total_pop

civdata_stats_3 <- civdata_stats %>% 
  select(`Qualifying Name`,`Total Population:`,`Total Population: 18 to 24 Years`,`Total Population: 25 to 34 Years`, `Total Population: 35 to 44 Years`, `Total Population: 45 to 54 Years`, 
         `Total Population: 55 to 64 Years`) %>% 
  gather("age_bracket", "counts", -`Qualifying Name`,-`Total Population:`) %>% 
  arrange(`Qualifying Name`, age_bracket) %>% 
  mutate(age_pct = counts/`Total Population:`)

pct_pop <- ggplot(civdata_stats_3, aes(x=`Qualifying Name`, y=age_pct, fill=age_bracket)) +
  geom_col(position="dodge")

pct_pop


# Unemployment

civ_data_employment <- civdata_stats %>% 
  mutate(unemployment_rate = `Civilian Population in Labor Force 16 Years and Over: Unemployed`/`Total Population:`)

unemployment <- ggplot(data = civ_data_employment, aes(x = `Qualifying Name`,y = unemployment_rate)) + geom_col()
unemployment

# Commute
commute_data <- read_csv("~/Desktop/commute_data.csv")

commute_join <- commute_data %>% 
  select(`Qualifying Name`,`Less than 10 Minutes`, `20 to 29 minutes`, `60 to 89 Minutes`, `90 or more minutes`) %>% 
  gather("Commute", "Number of Commuters", -`Qualifying Name`) %>% 
  arrange(`Qualifying Name`, `Commute`)

ggplot(data = commute_join, mapping = aes(x = `Qualifying Name`, y = `Number of Commuters`, fill = `Commute`)) +
  geom_col(position="dodge")

# Rent/Property Value
Rent_2006 <- read_csv("~/Desktop/Rent 2006.csv")
Rent_2008 <- read_csv("~/Desktop/Rent 2008.csv")
Rent_2010 <-  read_csv("~/Desktop/Rent_2010.csv")
Rent_2012<- read_csv("~/Desktop/Rent 2012.csv")

rent_full <- Rent_2006 %>%
  left_join(Rent_2008, by = "Name of Area")
rent_one <- rent_full %>%
  left_join(Rent_2010, by = "Name of Area")
rent_two <- rent_one %>%
  left_join(Rent_2012, by = "Name of Area")

rent_three <- civdata_stats %>%
  left_join(rent_two, by = "Name of Area") %>%
  rename(`Median Gross Rent 2015` = `Median Gross Rent`)

rent_join <- rent_three %>% 
  rename(qualifying_name=`Qualifying Name`, year_2015 = `Median Gross Rent 2015`, 2012=`Median Gross Rent 2012` )
  select(qualifying_name ,2015, 2012, `Median Gross Rent 2010`, `Median Gross Rent 2008`, `Median Gross Rent 2006`) %>% 
  gather("Year", "Median Rent", -`Qualifying Name`) %>% 
  arrange(`Qualifying Name`, `Year`)

ggplot(data = rent_join, mapping = aes(x = `Year`, y = `Median Rent`, color = `Qualifying Name`)) +
  geom_line()

# Crime Rate
  
crime_data_better <- crimedata %>%
  rename(qualifying_name  = `Qualifying Name`, violent_crimes =`Total Violent Crimes Rate`, property_crimes =
           `Total Property Crimes Rate`) %>% 
  select(qualifying_name, violent_crimes, property_crimes) %>% 
  gather("type", "count", c(2:3)) %>% 
  mutate(rate=count/100000)

ggplot(crime_data_better, aes(x=reorder(qualifying_name, rate), y=rate, fill=type)) +
  geom_col(position="dodge")

# Nighlife

nightlife_data <- drinkingdata %>%
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
  gather("num_employees", "count", c(2:10)) %>% 
  arrange(qualifying_name, num_employees)

ggplot(nightlife_data, aes(x=num_employees, y=count, color=qualifying_name)) + geom_col(position="dodge")
  
# Entertainment Data

entertainment_data <- drinkingdata %>%
  rename(qualifying_name=`Qualifying Name`, entertainment_1_4= `Number of Establishments with 1 to 4 Employees: Arts, Entertainment, and Recreation`,
         entertainment_5_9= `Number of Establishments with 5 to 9 Employees: Arts, Entertainment, and Recreation`, 
         entertainment_10_19= `Number of Establishments with 10 to 19 Employees: Arts, Entertainment, and Recreation`,
         entertainment_20_49= `Number of Establishments with 20 to 49 Employees: Arts, Entertainment, and Recreation`,
         entertainment_50_99= `Number of Establishments with 50 to 99 Employees: Arts, Entertainment, and Recreation`,
         entertainment_100_249= `Number of Establishments with 100 to 249 Employees: Arts, Entertainment, and Recreation`,
         entertainment_250_499= `Number of Establishments with 250 to 499 Employees: Arts, Entertainment, and Recreation`,
         entertainment_500_999= `Number of Establishments with 500 to 999 Employees: Arts, Entertainment, and Recreation`,
         entertainment_1000= `Number of Establishments with 1,000 Employees or More: Arts, Entertainment, and Recreation`) %>% 
  select(qualifying_name, entertainment_1_4, entertainment_5_9, entertainment_10_19, entertainment_20_49, entertainment_50_99, 
         entertainment_100_249, entertainment_250_499, entertainment_500_999, entertainment_1000) %>% 
  gather("num_employees", "count", c(2:10))

ggplot(entertainment_data, aes(x=num_employees, y=count, color=qualifying_name)) + geom_col(position="dodge") 


# You can ignore everything below this

# histogram age
age_data <- civdata_stats %>% 
  mutate(pct_young = (("Total Population: 25 to 34 Years")/("Total Population")))


pops <- as.integer(civdata_stats$`Total Population: 25 to 34 Years`)
total_pop <- as.integer(civdata_stats$`Total Population:`)

young_data <- (pops/total_pop)

age_plot <- age_data %>% 
  ggplot(aes(x = "Name of Area", y = pct_young ))

# drinking
ggplot(data = drinkingdata_stats, aes(x= "Name of Area",y = as.integer("Total Annual Payroll: All Establishments: Food Services and Drinking Places")))




