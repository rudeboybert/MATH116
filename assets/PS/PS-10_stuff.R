library(dplyr)
library(ggplot2)
library(mosaic)
library(okcupiddata)
data(profiles)



sample_50 <- resample(profiles$height, size=50, replace=FALSE)
xbar <- mean(sample_50)
s <- sd(sample_50)

xbar - 2*s/sqrt(50)
xbar + 2*s/sqrt(50)


values <- c(67.9, 70.48, 
            67.2, 69.3,
            67.6, 69.4,
            66.4, 68.7,
            68.09, 70.30,
            67.03, 69.0,
            67.68, 69.06,
            67.7, 70.1)
n <- length(values)/2
ID <- rep(1:n, each=2)

CI <- data_frame(
  ID = ID,
  values=values
)

ggplot(CI, aes(y=as.factor(ID), x=values, group=ID)) +
  geom_line(size=1, col="red") +
  geom_vline(xintercept=68.3, linetype="dashed") +
  labs(title="Real Mean Height is Dashed Line")
  