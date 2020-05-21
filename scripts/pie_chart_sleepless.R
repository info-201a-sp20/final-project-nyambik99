# Pie Chart
library("dplyr")
library("ggplot2")
library("stringr")
library("leaflet")
library("plotly")


datatable <- read.csv("Time_Americans_Spend_Sleeping.csv",
  stringsAsFactors = FALSE
)
View(datatable)


all_days <- datatable %>% filter(Type.of.Days == "All days")
all_day_pie <- ggplot(data = all_days, aes(x = Type.of.Days,
                                           fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Age distribution for all day observation")

nonholidays <- datatable %>% filter(Type.of.Days == "Nonholiday weekdays")
non_holiday_pie <- ggplot(data = nonholidays, aes(x = Type.of.Days,
                                                  fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Age distribution for non holiday weekdays observation")

weekends <- datatable %>% filter(Type.of.Days == "Weekend days and holidays")
weekend_pie <- ggplot(data = weekends, aes(x = Type.of.Days,
                                           fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Age distribution for holidays observation")
