## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
set.seed(76)
if(FALSE){
  # Run this line to render the document as running HTML document instead of
  # slides:
  rmarkdown::render("slides.Rmd", output_format = c("html_document"))
  knitr::purl("slides.Rmd")
  }

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(dplyr)
## 
## # Create data frame with two variables
## test_data <- data_frame(
##   name=c("Abbi", "Abbi ", "Ilana", "Ilana", "Ilana"),
##   value_1=c(0, 1, 0, 1, 0),
##   value_2=c(4, 6, 3, 2, 5)
## )
## 
## # See contents in console
## test_data

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## # 1: Arrange in ascending order
## test_data %>%
##   arrange(value_1)
## 
## # 2: Arrange in descending order
## test_data %>%
##   arrange(desc(value_1))
## 
## # 3: Arrange in decending order of value_1, and then within
## # value_1, arrange in ascending order of value_2
## test_data %>%
##   arrange(desc(value_1), value_2)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## x <- data_frame(x1=c("A","B","C"), x2=c(1,2,3))
## y <- data_frame(x1=c("A","B","D"), x3=c(TRUE,FALSE,TRUE))
## x
## y

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## left_join(x, y, by = "x1")
## full_join(x, y, by = "x1")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## i <- data_frame(a=c("A","B","C"), x2=c(1,2,3))
## j <- data_frame(b=c("A","B","D"), x3=c(TRUE,FALSE,TRUE))
## i
## j

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## left_join(i, j, by = c("a" = "b"))

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## inner_join(flights, airports, by = c("origin" = "faa"))

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(dplyr)
## 
## # Create data frame with two variables
## test_data <- data_frame(
##   name=c("Albert", "Albert", "Albert", "Yolanda", "Yolanda"),
##   value=c(2, 2, 2, 3, 3)
## )
## 
## # See contents in console
## test_data

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## test_data
## 
## test_data %>%
##   group_by(name)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## test_data %>%
##   summarise(overall_avg = mean(value))
## 
## test_data %>%
##   group_by(name) %>%
##   summarise(name_avg = mean(value))

## ---- eval=FALSE, echo=FALSE---------------------------------------------
##  group_by(categorical_var) %>%
##    summarize(output_name = many_to_one_function(numerical_var))

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## DATASET_NAME %>%
##   mutate(NEW_VARIABLE_NAME = OLD_VARIABLE_NAMES)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## test_data %>%
##   mutate(double_value = value * 2)
## 
## test_data %>%
##   mutate(double_value = value * 2) %>%
##   mutate(triple_value = value + double_value)

## ----eval=FALSE, echo=TRUE-----------------------------------------------
## library(dplyr)
## library(nycflights13)
## data(flights)
## 
## # Bit 1: No piping
## filter(flights, month == 1)
## 
## # Bit 2: Piping. Note no comma
## flights %>% filter(month == 1)
## 
## # Bit 3: Piping across multiple lines (preferred for legibility)
## flights %>%
##   filter(month==1)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(dplyr)
## library(nycflights13)
## data(flights)
## 
## flights %>%
##   filter(year == 2014)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(dplyr)
## library(nycflights13)
## data(weather)
## 
## weather %>%
##   summarize(mean_temp = mean(temp))

## ---- echo=FALSE, fig.height=4-------------------------------------------
library(tidyverse)
library(babynames)
# Bar Chart
babynames %>% 
  mutate(decade = round(year / 10) * 10) %>% 
  filter(name=="Hayden" | name == "Carlos" | name == "Ethan") %>% 
  filter(decade >= 1990) %>% 
  group_by(name) %>% 
  summarize(n=sum(n)) %>% 
  ggplot(data=., aes(x=name, y=n)) +
  geom_bar(stat="identity") +
  labs(x="Name", y="Count", title="Name Counts since 1990")

## ---- echo=FALSE---------------------------------------------------------
x <- data_frame(`Row Number`=1:5, name=c("Albert", "Albert", "Albert", "Mo", "Mo"))
knitr::kable(x)

## ---- echo=FALSE---------------------------------------------------------
x %>% 
  count(name) %>% 
  knitr::kable()

## ---- eval=FALSE---------------------------------------------------------
## library(fivethirtyeight)
## library(tidyverse)
## 
## current_congress <- congress_age %>%
##   filter(congress == 113) %>%
##   mutate(party=ifelse(party=="D", "Democrat", ifelse(party=="R", "Republican", "Independent")))
## ggplot(current_congress, aes(x=party, y=age)) +
##   geom_boxplot()

## ---- echo=FALSE---------------------------------------------------------
library(tidyverse)
library(okcupiddata)

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Histogram
profiles %>% 
  ggplot(data=., aes(x=height)) +
  geom_histogram(binwidth = 1) +
  labs(x="height (in inches)", y="count", title="Heights of San Francisco OkCupid Users")

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Histogram
profiles %>% 
  filter(between(height, 55, 80)) %>% 
  ggplot(data=., aes(x=height)) +
  geom_histogram(binwidth = 1) +
  labs(x="height (in inches)", y="count", title="Heights of San Francisco OkCupid Users")

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Histogram
profiles %>% 
  filter(between(height, 55, 80)) %>% 
  ggplot(data=., aes(x=height)) +
  geom_histogram(binwidth = 1) +
  labs(x="height (in inches)", y="count", title="Heights of San Francisco OkCupid Users") +
  facet_wrap(~sex)

## ---- eval=TRUE, echo=FALSE----------------------------------------------
# Load packages
library(dplyr)
library(ggplot2)

# Create data frame
simple_ex <-
  data_frame(
    A = c(1, 2, 3, 4),
    B = c(1, 2, 3, 4),
    C = c(3, 2, 1, 2),
    D = c("Hot", "Hot", "Cold", "Cold")
  )
simple_ex

## ---- echo=TRUE, fig.height=3--------------------------------------------
ggplot(data=simple_ex, aes(x=A, y=B, size=C, color=D )) + 
  geom_line()

## ------------------------------------------------------------------------
library(tidyverse)
library(nycflights13)

## ---- cache=TRUE---------------------------------------------------------
all_alaska_flights <- flights %>% 
  filter(carrier == "AS")
ggplot(data = all_alaska_flights, aes(x = dep_delay, y = arr_delay)) + 
  geom_point() +
  labs(x="Departure Delay", y="Arrival Delay", title="Departure/Arrival Delays for Alaska Airlines 2013 NYC Flights")

## ---- echo=FALSE, message=FALSE, warning=FALSE---------------------------
library(tidyverse)
library(knitr)

## ------------------------------------------------------------------------
simple <-
  data_frame(
    A = c(1, 2, 3, 4),
    B = c(1, 2, 3, 4),
    C = c(3, 2, 1, 2),
    D = c("Hot", "Hot", "Cold", "Cold")
  )
simple_ex %>% kable(format="markdown")

## ---- include=FALSE------------------------------------------------------
library(tidyverse)
library(lubridate)
library(stringr)
library(ggplot2movies)
library(nycflights13)
library(babynames)
library(fueleconomy)
library(okcupiddata)

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Scatterplot i.e. bivariate plot
movies %>% 
  ggplot(data=., aes(x=budget, y=rating)) +
  geom_point() +
  labs(x="Movie Budget", y="IMDB Rating", title="IMDB Rating vs Budget")

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Line graph
flights %>% 
  mutate(date=ymd(paste(year, month, day, sep="-"))) %>% 
  filter(month==1) %>% 
  group_by(date) %>% 
  tally() %>% 
  ggplot(data=., aes(x=date, y=n)) + 
  labs(x="Date", y="Number of Flights", title="Number of Daily Flights from NYC in Jan 2013") +
  geom_line()

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Histogram
profiles %>% 
  ggplot(data=., aes(x=height)) +
  geom_histogram() +
  labs(x="height (in inches)", y="count", title="Heights of San Francisco OkCupid Users")

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Boxplot
vehicles %>% 
  mutate(trans2 = ifelse(str_sub(trans, 1, 1) == "M", "Manual", "Automatic")) %>% 
  ggplot(data=., aes(x=trans2, y=hwy)) +
  geom_boxplot() +
  labs(y="Highway Mileage (miles/gallon)", x="Transmission Type",
       title="Highway Mileage of all Car Models 1984-2015") +
  coord_cartesian(ylim=c(5, 45))

## ---- echo=FALSE, cache=TRUE---------------------------------------------
# Bar Chart
babynames %>% 
  mutate(decade = round(year / 10) * 10) %>% 
  filter(name=="Hayden" | name == "Carlos" | name == "Ethan") %>% 
  filter(decade >= 1990) %>% 
  group_by(name) %>% 
  summarize(n=sum(n)) %>% 
  ggplot(data=., aes(x=name, y=n)) +
  geom_bar(stat="identity") +
  labs(x="Name", y="Count", title="Name Counts since 1990")

