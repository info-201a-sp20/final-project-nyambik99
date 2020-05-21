# Pie Chart
install.packages("ggplot2")
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
ggplot(data = all_days, aes(x = Type.of.Days, fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

nonholidays <- datatable %>% filter(Type.of.Days == "Nonholiday weekdays")
ggplot(data = nonholidays, aes(x = Type.of.Days, fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

weekends <- datatable %>% filter(Type.of.Days == "Weekend days and holidays")
ggplot(data = weekends, aes(x = Type.of.Days, fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
