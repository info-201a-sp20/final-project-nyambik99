## Bar Chart

library(readxl)
library(ggplot2)
library(dplyr)

time_americans_spend_sleeping <- read.csv("Time_Americans_Spend_Sleeping.csv")

days <- time_americans_spend_sleeping$Type.of.Days
hours <- time_americans_spend_sleeping$Avg.hrs.per.day.sleeping


bar_chart <- ggplot(data = time_americans_spend_sleeping,
                    aes(x = days, y = hours)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Hours of Sleep Based on Types of Days")
