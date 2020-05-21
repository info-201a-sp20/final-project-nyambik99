# Summary Information Calculation

library(dplyr)

dataset <- read.csv("Time_Americans_Spend_Sleeping.csv",
                    stringsAsFactors = FALSE)
View(dataset)

## Average amount of sleep of age group 15-24 compared to other age groups
sleep_15_24 <- dataset %>%
  filter(Age.Group == "15 to 24 years") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

sleep_apart_15_24 <- dataset %>%
  filter(Age.Group != "15 to 24 years") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

## Does one gender gets more sleep than the other?
sleep_men <- dataset %>%
  filter(Sex == "Men") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

sleep_women <- dataset %>%
  filter(Sex == "Women") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

## Which year had the highest average amount of sleep per day for all
## days observation
highest_avg_year <- dataset %>%
  filter(Type.of.Days == "All days") %>%
  group_by(Year) %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  filter(avg_sleep == max(avg_sleep)) %>%
  pull(Year)

lowest_avg_year <- dataset %>%
  filter(Type.of.Days == "All days") %>%
  group_by(Year) %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  filter(avg_sleep == min(avg_sleep)) %>%
  pull(Year)

## Which age group had the highest average amount of sleep
highest_avg_age <- dataset %>%
  group_by(Age.Group) %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  filter(avg_sleep == max(avg_sleep)) %>%
  pull(Age.Group)

## Does weekdays observation yields more sleeping time compared to
## weekends observation?
weekday_obv <- dataset %>%
  filter(Type.of.Days == "Nonholiday weekdays") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

holiday_obv <- dataset %>%
  filter(Type.of.Days == "Weekend days and holidays") %>%
  summarize(avg_sleep = mean(Avg.hrs.per.day.sleeping)) %>%
  pull(avg_sleep)

which_obv_more <- function(weekday, holiday) {
  if (weekday > holiday) {
    return("Yes, weekday observation yields more sleeping time")
  } else if (weekday < holiday) {
    return("No, weekend observation yields more sleeping time")
  } else {
    return("No, both observation yields the same amount of sleeping time")
  }
}

is_weekday_more <- which_obv_more(weekday_obv, holiday_obv)
