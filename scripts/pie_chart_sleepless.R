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


alldays <- datatable %>% filter(Type.of.Days == "All days")
all_days <- ggplot(data = alldays, aes(x = Type.of.Days, fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
print(all_days)

nonholidays <- datatable %>% filter(Type.of.Days == "Nonholiday weekdays")
non_holidays <- ggplot(data = nonholidays, aes(x = Type.of.Days,
                                               fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
print(non_holidays)

weekends <- datatable %>% filter(Type.of.Days == "Weekend days and holidays")
week_end <- ggplot(data = weekends, aes(x = Type.of.Days, fill = Age.Group)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
print(week_end)
