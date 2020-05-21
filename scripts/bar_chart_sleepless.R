Bar Chart

library(readxl)
library(ggplot2)
library(dplyr)

Time_Americans_Spend_Sleeping <- read_excel("final-project-nyambik99/data/sleepless_in_america/Time_Americans_Spend_Sleeping.xlsx")
View(Time_Americans_Spend_Sleeping)

days <- Time_Americans_Spend_Sleeping$`Type of Days`
hours <- Time_Americans_Spend_Sleeping$`Avg hrs per day sleeping`


ggplot(data = Time_Americans_Spend_Sleeping, aes(x = days, y = hours)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Hours of Sleep Based on Types of Days")


#This chart was intended to show the relationship between
# the number of hours slept by Americans based on the type of day (all days, nonholiday weekdays, weekends and holidays)

hours_mean <- Time_Americans_Spend_Sleeping[Time_Americans_Spend_Sleeping$`Avg hrs per day sleeping`, ]
hours_m <- mean(hours_mean)

ggplot(data = Time_Americans_Spend_Sleeping, aes(x = days, y = hours_m)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Hours of Sleep Based on Types of Days")