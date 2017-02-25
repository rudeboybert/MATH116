# Please Indicate
# -Your name: 
# -Who you collaborated with:
# -Approximately how much time did you spend on this problem set:
# -What, if anything, gave you the most trouble:

# Needed packages
library(ggplot2)
library(dplyr)



# Question 1: Movie Ratings

# The `movies` data set in the `ggplot2movies` package has information and
# ratings on 28,819 movies. This many data points is a bit unwieldy, so let's
# take a random sample of 1000 of these movies. Furthermore, let's take the
# variable `Comedy` and convert it to a `yes` vs `no` (binary) categorical
# variable. Note: you don't need to understand this code for now, we'll see this
# when we study data manipulation in Chapter 5.
library(ggplot2movies)
data(movies)
movies <- movies %>%
  sample_n(1000) %>%
  mutate(Comedy=ifelse(Comedy==1, "yes", "no"))


# a) You want to know for these 1000 randomly chosen movies: What is the 
# relationship between the year the movie was made and the IMDB rating? 
# Furthermore, I want to distinguish between comedies and non-comedies. In the 
# code block below, write the code that generates a graphic that will answer 
# this for you. Write your code here:


# b) As best you can, answer this question: Within these 1000 movies, do
# comedies get rated higher than non-comedies?



# Question 2: Babynames

# Considering the `babynames` data set in the `babynames` package again, we will
# limit consideration to only the name "Casey".
library(babynames)
data(babynames)
babynames <- babynames %>%
  filter(name=="Casey")


# a) I want to know about popularity trends of the name "Casey" as a male name
# and as a female name over the years. In the code block below, write the code
# that generates a graphic that will answer this for you. Write your code here:


# b) Given this graphic, what can you say about the name "Casey"? Don't merely
# describe elements on graphic, but make a broader statement. For example, what
# would you tell a parent who is interested in naming their child "Casey"?


