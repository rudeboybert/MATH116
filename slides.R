## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE, fig.width=8, fig.height=4.5)
if(FALSE){
  # HEADS UP
  # Run these lines to render the document as running HTML document instead of
  # slides:
  rmarkdown::render("slides.Rmd", output_format = c("html_document"))
  knitr::purl("slides.Rmd")
}

## ---- echo=FALSE, message=FALSE------------------------------------------
library(tidyverse)
library(mosaic)
library(stringr)
library(okcupiddata)
library(knitr)

## ---- echo=FALSE---------------------------------------------------------
library(nycflights13)
data(flights)
alaska_flights <- flights %>% 
  filter(carrier == "AS") %>% 
  filter(!is.na(dep_delay) & !is.na(arr_delay))
ggplot(data=alaska_flights, aes(x = dep_delay, y = arr_delay)) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

## ---- echo=FALSE---------------------------------------------------------
alaska_frontier_flights <- flights %>% 
  filter(carrier == "AS" | carrier == "F9") %>% 
  filter(dep_delay<250)

ggplot(alaska_frontier_flights, aes(x=dep_delay, y=arr_delay, col=carrier)) +
  geom_point()

## ---- echo=FALSE---------------------------------------------------------
alaska_frontier_flights <- flights %>% 
  filter(carrier == "AS" | carrier == "F9") %>% 
  filter(dep_delay<250)

ggplot(alaska_frontier_flights, aes(x=dep_delay, y=arr_delay, col=carrier)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE, fullrange=TRUE)

## ---- echo=FALSE, message=FALSE------------------------------------------
data(profiles)
profiles <- profiles %>% 
  mutate(is_female = ifelse(sex == "f", 1, 0))

p <- mean(profiles$is_female)

set.seed(89)
samples <- do(8)*mean(resample(profiles$is_female, size=100, replace=FALSE))
aykim_phat <- data_frame(
  email = "aykim",
  p_hat = samples$mean
)

## ---- message=FALSE------------------------------------------------------
p_hat <- read_csv("assets/data/Lec35_LC.csv") %>% 
  select(`What is your Midd Email?`, `Sample proportion p-hat`) %>% 
  rename(email = `What is your Midd Email?`, p_hat = `Sample proportion p-hat`) %>% 
  mutate(email = str_sub(email, end=-16)) %>% 
  arrange(email)
p_hat %>% 
  kable(digits=3)

## ---- message=FALSE------------------------------------------------------
p_hat <- p_hat %>% 
  bind_rows(aykim_phat) 
p_hat %>% 
  kable(digits=3)

## ---- message=FALSE, echo=TRUE-------------------------------------------
p_hat <- p_hat %>% 
  mutate(
    n = 100,
    SE = sqrt(p_hat*(1-p_hat)/n)
  )

## ---- message=FALSE, echo=FALSE------------------------------------------
p_hat %>% 
  kable(digits=3)

## ---- message=FALSE, echo=TRUE-------------------------------------------
p_hat <- p_hat %>% 
  mutate(
    left = p_hat - 1.96*SE,
    right = p_hat + 1.96*SE
  )

## ---- message=FALSE, echo=FALSE------------------------------------------
p_hat %>% 
  kable(digits=3)

## ---- message=FALSE------------------------------------------------------
p_hat <- p_hat %>% 
  tibble::rownames_to_column() %>% 
  select(rowname, email, p_hat, left, right) %>% 
  mutate(`Captured True p?` = left <= p & p <= right) %>% 
  gather(endpoint, value, -c(rowname, email, p_hat, `Captured True p?`)) %>% 
  arrange(desc(email), rowname) %>% 
  mutate(rowname = rep(1:20, each=2))

ggplot(data=p_hat) +
  geom_line(aes(x=value, y=rowname, group=rowname, col=`Captured True p?`)) +
  geom_point(aes(x=p_hat, y=rowname, group=rowname)) +
  geom_vline(xintercept = p, linetype="dashed") +
  labs(x="Proportion Female", y="", title="Confidence Intervals Based on n=100") +
  geom_text(aes(x=0.15, y=rowname, label=email)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


## ---- echo=FALSE, warning=FALSE------------------------------------------
library(mvtnorm) 
correlation <- c(-0.9999, -0.9, -0.75, -0.3, 0, 0.3, 0.75, 0.9, 0.9999)
n_sim <- 100

values <- NULL
for(i in 1:length(correlation)){
  rho <- correlation[i]
  sigma <- matrix(c(5, rho*sqrt(50), rho*sqrt(50), 10), 2, 2) 
  sim <- rmvnorm(
    n=n_sim,
    mean=c(20,40),
    sigma=sigma
    ) %>%
    as_data_frame() %>% 
    mutate(correlation=round(rho,2))
  
  values <- bind_rows(values, sim)
}

ggplot(data=values, aes(V1,V2)) +
  geom_point() +
  facet_wrap(~correlation, ncol=5) +
  labs(x="", y="", title="Different Correlation Coefficients") + 
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank()
  )

## ---- warning=FALSE, eval=FALSE------------------------------------------
## library(nycflights13)
## data(flights)
## 
## # Load Alaska data, deleting rows that have missing dep or arr data
## alaska_flights <- flights %>%
##   filter(carrier == "AS") %>%
##   filter(!is.na(dep_delay) & !is.na(arr_delay))
## 
## ggplot(data=alaska_flights, aes(x = dep_delay, y = arr_delay)) +
##    geom_point()

## ---- warning=FALSE, echo=FALSE------------------------------------------
library(nycflights13)
data(flights)
alaska_flights <- flights %>% 
  filter(carrier == "AS") %>% 
  filter(!is.na(dep_delay) & !is.na(arr_delay))
ggplot(data=alaska_flights, aes(x = dep_delay, y = arr_delay)) + 
   geom_point()

## ---- warning=FALSE, echo=TRUE-------------------------------------------
cor(alaska_flights$dep_delay, alaska_flights$arr_delay)

## ---- echo=FALSE, warning=FALSE, eval=FALSE------------------------------
## vals <- seq(-2, 2, length=20)
## example <- data_frame(
##   x=rep(vals, 3),
##   y=c(0.01*vals, 1*vals, 3*vals),
##   slope=factor(rep(c(0.01, 1, 3), each=length(vals)))
## )
## ggplot(example, aes(x=x, y=y, col=slope)) +
##   geom_point(size=2) +
##   theme(legend.position="none")

## ---- echo=FALSE, warning=FALSE, eval=FALSE------------------------------
## ggplot(example, aes(x=x, y=y, col=slope)) +
##   geom_point(size=2) +
##   geom_smooth(method="lm", se=FALSE)

## ---- eval=TRUE, echo=FALSE----------------------------------------------
library(okcupiddata)
data(profiles)

## ---- eval=TRUE, echo=FALSE, cache=TRUE----------------------------------
samples_5 <- do(1000) * mean(resample(profiles$height, size=5, replace=TRUE))
samples_10 <- do(1000) * mean(resample(profiles$height, size=10, replace=TRUE))
samples_100 <- do(1000) * mean(resample(profiles$height, size=100, replace=TRUE))

results <- data_frame(
  n = c(rep(5, 1000), rep(10, 1000), rep(100, 1000))
)
results <- results %>% 
  bind_cols(
    bind_rows(samples_5, samples_10, samples_100)
  )

# Part 4:
ggplot(results, aes(x=mean)) +
  geom_histogram(binwidth = 0.75) +
  labs(x="sample mean height") + 
  facet_wrap(~n) + 
  xlim(c(50,80)) +
  geom_vline(xintercept=mean(profiles$height, na.rm=TRUE), col="red")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(lubridate)
## library(mosaic)
## library(dplyr)
## 
## # Randomly sample three people:
## students <-
##   c("Arthur", "Caroline", "Claire", "Clare", "Conor", "Daniel",
##     "Dylan", "Elana", "Jacob", "Jay", "Joe", "Julian", "Kelsie",
##     "Lisa", "Maya", "Naing", "Parker", "Rebecca", "Ry", "Theodora",
##     "Zebediah", "Albert")
## resample(students, size=3, replace=FALSE)
## 
## # Get average age:
## birthdays <- c("1980-11-05", "2000-01-01", "1955-08-05")
## ages <- as.numeric(as.Date("2017-04-27") - as.Date(birthdays))/365.25
## ages
## mean(ages)

## ---- echo=FALSE---------------------------------------------------------
grades <- read_csv(file="assets/data/grades.csv") %>% 
  slice(4:8) %>% 
  select(-major) %>% 
  mutate(final = round(final, 2))

## ---- echo=FALSE---------------------------------------------------------
grades %>% 
  mutate(even_vs_odd=shuffle(even_vs_odd))

## ---- echo=FALSE---------------------------------------------------------
grades %>% 
  mutate(even_vs_odd=shuffle(even_vs_odd))

## ---- echo=FALSE---------------------------------------------------------
grades %>% 
  mutate(even_vs_odd=shuffle(even_vs_odd))

## ---- echo=FALSE---------------------------------------------------------
grades %>% 
  mutate(even_vs_odd=shuffle(even_vs_odd))

## ------------------------------------------------------------------------
set.seed(76)

## ---- cache=TRUE---------------------------------------------------------
single_cup_outcome <- c(1, 0)
simulation <- do(10000) * resample(single_cup_outcome, size=8)
simulation <- simulation %>% 
  mutate(n_correct = V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8) 
ggplot(simulation, aes(x=n_correct)) + 
  geom_bar() +
  labs(x="Number of Guesses Correct")

## ------------------------------------------------------------------------
set.seed(76)

## ---- cache=TRUE---------------------------------------------------------
single_cup_outcome <- c(1, 0)
simulation <- do(10000) * resample(single_cup_outcome, size=8)
simulation <- simulation %>% 
  mutate(n_correct = V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8) %>% 
  group_by(n_correct)

## ---- cache=TRUE---------------------------------------------------------
ggplot(simulation, aes(x=n_correct, y=n_correct)) + 
  geom_bar(stat="identity") +
  labs(x="Number of Guesses Correct", y="Count") +
  geom_vline(xintercept=8, col="red") 

## ------------------------------------------------------------------------
set.seed(76)

## ---- cache=TRUE---------------------------------------------------------
single_cup_outcome <- c(1, 0)
simulation <- do(10000) * resample(single_cup_outcome, size=8)
simulation <- simulation %>% 
  mutate(n_correct = V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8) 
ggplot(simulation, aes(x=n_correct)) + 
  geom_bar() +
  labs(x="Number of Guesses Correct")

## ---- cache=TRUE---------------------------------------------------------
ggplot(simulation, aes(x=n_correct)) + 
  geom_bar() +
  labs(x="Number of Guesses Correct") +
  geom_vline(xintercept = 8, col="red")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(mosaic)
## # Define a vector fruit
## fruit <- c("apple", "orange", "mango")
## 
## # Do this multiple times:
## shuffle(fruit)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## resample(fruit)

## ---- eval=FALSE, echo=FALSE---------------------------------------------
## resample(x=fruit, size=length(fruit), replace=TRUE,
##          prob=rep(1/length(fruit), length(fruit)) )

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(readxl)
## example <- read_excel("example.xlsx")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## DD_vs_SB <- read_csv("~/Problem_Sets/DD_vs_SB.csv")

## ---- echo=FALSE---------------------------------------------------------
DD_vs_SB <- readr::read_csv("assets/data/DD_vs_SB.csv")

## ---- echo=FALSE, eval=TRUE----------------------------------------------
library(ggplot2)
ggplot(DD_vs_SB, aes(x=median_income, y=shops_per_1000)) +
  geom_point(aes(col=Type)) + 
  facet_wrap(~Type) +
  geom_smooth(method="lm", se=FALSE) + 
  labs(x="Median Household Income", y="# of shops per 1000 people", 
       title="Coffee/Cafe Comparison in Eastern MA") +
  scale_color_manual(values=c("orange", "forestgreen"))

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## library(ggplot2)
## ggplot(DD_vs_SB, aes(x=median_income, y=shops_per_1000)) +
##   geom_point(aes(col=Type)) +
##   facet_wrap(~Type) +
##   geom_smooth(method="lm", se=FALSE) +
##   labs(x="Median Household Income", y="# of shops per 1000 people",
##        title="Coffee/Cafe Comparison in Eastern MA") +
##   scale_color_manual(values=c("orange", "forestgreen"))

## ---- eval=FALSE, echo=TRUE----------------------------------------------
## library(dplyr)
## 
## # Create data frame with two variables
## test_data <- data_frame(
##   name=c("Abbi", "Abbi", "Ilana", "Ilana", "Ilana"),
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

