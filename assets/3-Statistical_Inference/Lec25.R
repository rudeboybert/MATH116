library(ggplot2)
library(dplyr)
library(mosaic)
library(readr)

# Load the grades.csv file as described in Lec18. This is also practice for your
# final projects:







# Step 0: Exploratory Data Analysis ---------------------------------------

# Before doing any statistical testing, always do an Exploratory Data Analysis.
# The answer might be so stinking obvious, you don't need use stats.

# ALWAYS View() your data
View(grades)

# Learning Check 1: Create a visualization that attempts to graphically answer
# the question of "Did students with an even number of letters in their last
# name do better on the final exam than those who didn't?" Can you answer the
# question? Write your code below:







# Step 1: Compute the Observed Difference ---------------------------------

# Let's compute the observed difference in means. i.e. what really happened. But
# first, two sidenotes:


# Sidenote 1.1: Wrapper Functions ---------------------------------------------

# The following two bits of code produce the exact same results, but formatted
# differently: the difference in mean final scores

# Bit 1: Using the dplyr tools
grades %>%
  group_by(even_vs_odd) %>%
  summarise(mean=mean(final))

# Bit 2: Using the wrapper function
mean(final ~ even_vs_odd, data=grades)

# Because the wrapper function does the same task, but in much more succinct
# fashion, we'll use the Bit 2 approach.


# Sidenote 1.2: Computing differences ----------------------------------------

# We introduce the diff() function to take the difference of two values stored
# in a vector. Watch out for the order!
c(1, 3)
c(1, 3) %>% diff()
c(3, 1) %>% diff()


# Back to Step 1: ---------------------------------------------

# Now let's take the difference in means and compute the difference. Note the
# order of the subtraction! odd-even
mean(final ~ even_vs_odd, data=grades)
mean(final ~ even_vs_odd, data=grades) %>% diff()

# Students with an odd number of letters did on average 7.3% worse on the final
# than those with an even number! But is this difference of 7.2% statistically
# significant? Or is it just due to random chance? This is where statistics
# comes in.

# Assign this difference to observed_diff. We will use this later.
observed_diff <- mean(final ~ even_vs_odd, data=grades) %>% diff()
observed_diff







# Step 2: Simulate the Null Distribution ------------------------------------

# Recall that assuming the null hypothesis, we can permute/shuffle the variable
# even_vs_odd and it doesn't matter! A sidenote first on using shuffle() as our
# simulation tool


# Sidenote 2.1: shuffle() ---------------------------------------------
shuffled_grades <- grades %>%
  mutate(even_vs_odd = shuffle(even_vs_odd))

# Compare the two. What is different about them?
View(grades)
View(shuffled_grades)


# Sidenote 2.2: Wrapper functions and setting seeds -----------------

# The following two bits of code produce the exact same results, but formatted
# differently: the difference in mean final scores AFTER shuffling the variable
# even_vs_odd. Again, we'll use the wrapper function version going forward as
# it is more succinct.

# Bit 1: Using the dplyr tools
set.seed(76)
grades %>%
  mutate(even_vs_odd=shuffle(even_vs_odd)) %>%
  group_by(even_vs_odd) %>%
  summarise(mean=mean(final))

# Bit 2: Using the wrapper function
set.seed(76)
mean(final ~ shuffle(even_vs_odd), data=grades)

# Learning Check: We are trying to show that the long code and the wrapper
# function produce the same results. Why did we set the seed value before each
# simulation?


# Back to Step 2: ---------------------------------------------

# This is one simulated shuffle, assuming H0 is true
mean(final ~ shuffle(even_vs_odd), data=grades)

# But think to the lady tasting tea, we need to do this many, many, many times
# to get a sense of the typical random behavior! i.e. the null distribution
# We do() the shuffle many, many, many times.
simulations <- do(10000) * mean(final ~ shuffle(even_vs_odd), data=grades)

# Let's look at the contents:
simulations

# Gah! This makes the screen explode! By running as_data_frame() on it, we're
# not changing anything about the data, but instead make it all fit into our
# screen. This is only a formatting tool
simulations <- simulations %>%
  as_data_frame()
simulations

# Now for each of the 10000 shuffles, let's compute the difference MAKING SURE
# it matches the order from when we computed the observed_diff. i.e. odd-even
# and NOT even-odd
simulations <- simulations %>%
  mutate(difference=odd-even)
simulations


# Learning Checks:
# 1. Plot the results by changing the three SOMETHINGS with the appropriate
# "something"s
ggplot(data=SOMETHING , aes(x=SOMETHING)) +
  geom_SOMETHING() +
  geom_vline(xintercept = SOMETHING, col="red")

# 2. What is your answer to the question "Did students with an even number of
# letters in their last name do better on the final exam than those who didn't?"

# 3. Why is the "null distribution" centered where it is?





# Problem Set 09 ------------------------------------------

# Only one question: did econ majors do better than non-econ majors? To be
# posted later tonite.






