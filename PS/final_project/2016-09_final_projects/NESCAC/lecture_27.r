
Bowdoin
Political Science and Government, General,16%
Economics, General,13%
Mathematics, General,10%
Biology/Biological Sciences, General,7%

Colby College
Social Sciences,25%
Multi/Interdisciplinary Studies,11%
Biological and Biomedical Sciences,10%
English Language and Literature/Letters,7%
Physical Sciences,7%


library(mosaic)
library(dplyr)
library(ggplot2)

library(okcupiddata)
data(profiles)


n <- 1
samples <- do(10000) * 
  mean(resample(profiles$height, size=n, replace=TRUE))
samples <- samples %>% 
  as_data_frame()

ggplot(samples, aes(x=mean)) +
  geom_histogram(binwidth = 1) +
  xlim(c(40,90))




