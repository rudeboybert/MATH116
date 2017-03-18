# Please Indicate
# -Your name: 
# -Who you collaborated with:
# -Approximately how much time did you spend on this problem set:
# -What, if anything, gave you the most trouble:

# Needed packages
library(ggplot2)
library(dplyr)

# You will need to install these packages first:
library(fivethirtyeight)
library(Quandl)
library(lubridate)
library(tidyr)



# Question 1: Bechdel Test ------------------------------------------------

# a) What is the Bechdel test? Hint: Read the first three paragraphs of the news
# article linked in the help file for the bechdel data set.


# b) The following bit of code takes the bechdel data set, limits to movies made
# in 1972 or later, and for each year reports the proportion of movies where 
# binary is equal to PASS. Run this code (such code is the focus of Chapter 5:
# Data Wrangling):
bechdel_cleaned <- bechdel %>% 
  select(year, binary) %>% 
  filter(year >= 1972) %>% 
  group_by(year) %>% 
  summarize(prop_pass_bechdel=sum(binary=="PASS")/n())

# After View()'ing the data, create an appropriate plot that shows the time 
# trend of the proportion of movies that pass the Bechdel test. 



# c) Say you're an individual who is concerned with underrepresentation of women
# in movies. Based on these results, are you optimistic about the state of the
# movie industry?





# Question 2: Cheese and Milk Production ----------------------------------

# Run the code below. It will create a data frame food contains cheese and milk
# production in the United States for every year since 1925. See these links for
# more info:
# -https://www.quandl.com/data/USDANASS/NASS_CHEESEPRODUCTIONMEASUREDINLB
# -https://www.quandl.com/data/NASS_MILKPRODUCTIONMEASUREDINLB

cheese <- 
  Quandl("USDANASS/NASS_CHEESEPRODUCTIONMEASUREDINLB", start_date="1925-01-01") %>% 
  mutate(type="cheese", date=ymd(Date), value=Value) %>%
  select(type, date, value) 
milk <- 
  Quandl("USDANASS/NASS_MILKPRODUCTIONMEASUREDINLB", start_date="1925-01-01") %>% 
  mutate(type="milk", date=ymd(Date), value=Value) %>%
  select(type, date, value) 
food <- bind_rows(cheese, milk) %>% 
  tbl_df()

# a) Between cheese and milk, relatively speaking, which agricultural good has
# seen the bigger overall increases in production? Write your code below:





# Question 3: Histogram ---------------------------------------------------

# a) Recreate the histogram in Question 2 of the midterm using the following data
example <- data_frame(
  x = c(rep(3, 1), rep(4, 4), rep(5, 10), rep(6, 4), rep(7, 1), rep(3:7, each=4)),
  group = c(rep(1, 20), rep(2, 20))
)





# Question 4: Drinks ------------------------------------------------------

# Let's look at the data set drinks from the fivethirtyeight package.
data(drinks)

# a) Which 3 countries drink the most total alcohol according to this data?

# b) The following bit of code uses the gather() function from the tidyr package
# to convert the data to tidy format and then arranges it by country. Do
# Question 3.b) from the midterm
drinks_tidy <- drinks %>%
  gather(type, servings, -c(country, total_litres_of_pure_alcohol)) %>%
  arrange(country)


# c) What type of alcoholic beverage is the most consumed on earth?






# BONUS -------------------------------------------------------------------
# In the TED talk "The best stats you've ever seen" at
# https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen
# Hans Rosling (RIP 2017) presents human and international development data. The
# data seen in the video is accessible in the gapminder data set within the 
# gapminder package:
library(gapminder)
data(gapminder)

# The next bit of code
# -Filters the data set to only consider observations for two years: 1952 & 2007
# -Renames the "pop" variable to "population"
gapminder <- 
  filter(gapminder, year==1952 | year==2007) %>% 
  rename(population=pop)

# a) Recreate the scatterplot of "Child Survival (%)" over "GDP per capita ($)"
# seen at 12:00 in the video, but
# * Making a comparison between 1952 and 2007
# * Displaying "life expectancy" instead of "Child Survival"
# Do so by changing the code snippet below:
ggplot(data=DATASETNAME, aes(AES1=VAR1, AES2=VAR2, AES3=VAR3, AES4=VAR4)) +
  geom_point() + 
  facet_wrap(~VAR5) +
  scale_x_log10() + 
  labs(x="WRITE INFORMATIVE LABEL HERE", y="WRITE INFORMATIVE LABEL HERE", title="WRITE INFORMATIVE TITLE HERE")


# b) Describe two facts that would be of interest to international development organizations.



