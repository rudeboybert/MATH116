library(ggplot2)
library(dplyr)
library(mosaic)

# Single cup outcome, where
# -1 indicates correct
# -0 indicates incorrect
single_cup_outcome <- c(1, 0)




# 8 guesses:
do(8) * resample(single_cup_outcome, size=1)
resample(single_cup_outcome, size=8)

# 8 guesses, many, many, many times:
simulation <- do(10000) * resample(single_cup_outcome, size=8)
View(simulation)

# Count the number right by adding the columns. Note 
# summarise(sum=sum(variable)) only works for summing rows not columns:
simulation <- simulation %>% 
  mutate(n_correct = V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8) 
View(simulation)

# Visualize:
ggplot(simulation, aes(x=n_correct)) + 
  geom_bar() +
  labs(x="Number of Guesses Correct", title="Assuming she is guessing at random")


















ggplot(simulation, aes(x=n_correct)) + 
  geom_bar() +
  labs(x="Number of Guesses Correct", title="Assuming she is guessing at random") +
  geom_vline(xintercept = 8, col="red")
