library(ggplot2)
library(dplyr)
library(mosaic)
library(readr)

grades <- read_csv("grades.csv")
ggplot(data=grades, aes(x=even, y=final)) +
  geom_boxplot()


# The following two bits of code produce the same results, but formatted
# differently:

# Bit 1: Using the dplyr tools
grades %>% 
  group_by(even) %>% 
  summarise(mean=mean(final))

# Bit 2: Using the wrapper function:
mean(final ~ even, data=grades)




# Step 1: Compute the Observed Difference ---------------------------------

# We introduce the diff() function. Watch out for the order!
c(1, 3)
c(1, 3) %>% diff()


# Now let's take the difference in means
mean(final ~ even, data=grades)
mean(final ~ even, data=grades) %>% diff()

# Assign this to observed_diff
observed_diff <- mean(final ~ even, data=grades) %>% diff()
observed_diff



# Simulate the Null Distribution ------------------------------------------

# We do() the shuffle many, many, many times.
simulations <- do(10000) * mean(final ~ shuffle(even), data=grades)

# Let's look at the contents:
simulations

# Gah! This makes the screen explode:
# By running as_data_frame() on it, we're not changing anything about the data,
# but instead 
simulations <- simulations %>% 
  as_data_frame()





set.seed(76)
grades %>% 
  mutate(even=shuffle(even)) %>%   
  group_by(even) %>% 
  summarise(mean=mean(final))

set.seed(76)
mean(final ~ shuffle(even), data=grades)

# observed difference


simulations <- do(10000) * mean(final ~ shuffle(even), data=grades)
simulations <- simulations %>% 
  as_data_frame()
simulations <- simulations %>% 
  mutate(diff=even-odd)

ggplot(data=simulations , aes(x=diff)) +
  geom_histogram() +
  geom_vline(xintercept = observed_diff, col="red")


# This sucks:
simulations <- do(10) * (
  grades %>% 
    mutate(even=shuffle(even)) %>% 
    group_by(even) %>% 
    summarise(mean=mean(final)) %>% 
    tidyr::spread(even, mean)
)
simulations <- simulations %>% 
  select(even, odd)
simulations