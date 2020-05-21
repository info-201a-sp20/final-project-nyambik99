# Pie Chart
install.packages("ggplot2")
library("ggplot2")
library("dplyr")

dt <- read.csv("data/sleeepless in america/Time Americans Spend Sleeping.csv")


ggplot(data = dt, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")