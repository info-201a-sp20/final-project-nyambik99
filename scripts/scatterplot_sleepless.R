## Scatterplot

library(readxl)
library(ggplot2)
library(dplyr)

time_americans_spend_sleeping <- read.csv("Time_Americans_Spend_Sleeping.csv")

time_americans_spend_sleeping

year <- time_americans_spend_sleeping$Year
year
hours <- time_americans_spend_sleeping$`Avg hrs per day sleeping`
hours

scatterplot_chart <- ggplot(data = time_americans_spend_sleeping,
                            aes(x = year, y = hours)) +
  geom_point() +
  labs(title = "Sleep Based on Type of Day")

# This scatter plot was intened to show the relationship between
# the year and the hours slept by Americans.
