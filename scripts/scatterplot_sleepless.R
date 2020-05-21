Scatterplot

library(readxl)
library(ggplot2)
library(dplyr)

Time_Americans_Spend_Sleeping <- read_excel("final-project-nyambik99/data/sleepless_in_america/Time_Americans_Spend_Sleeping.xlsx")
View(Time_Americans_Spend_Sleeping)

Time_Americans_Spend_Sleeping

year <- Time_Americans_Spend_Sleeping$Year
year
hours <-Time_Americans_Spend_Sleeping$`Avg hrs per day sleeping`
hours

ggplot(data = Time_Americans_Spend_Sleeping, aes(x = year, y = hours)) +
  geom_point() +
  labs(title = "Sleep Based on Type of Day")

#This scatter plot was intened to show the relationship between the year and the hours slept by Americans.