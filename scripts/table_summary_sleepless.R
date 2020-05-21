#table of summary information

library(dplyr)

time_americans_sleep <- read.csv("Time_Americans_Spend_Sleeping.csv",
                                 stringsAsFactors = FALSE)

data_table <- time_americans_sleep %>%
  select(Year, Sex, Age.Group, Average.sleep = Avg.hrs.per.day.sleeping,
         Type.of.Days) %>%
  group_by(Age.Group)
