library("scales")
library("dplyr")
library("ggplot2")
library("tidyverse")

df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

df <- mutate(df, date = paste0(CheckoutMonth, "-01-", CheckoutYear))

df$date <- as.Date(df$date, format = "%m-%d-%Y")

physical_checkouts <- nrow(df %>%
  filter(UsageClass == "Physical"))

digital_checkouts <- nrow(df %>%
  filter(UsageClass == "Digital"))

highest_checkout <- df %>%
  filter(Checkouts == max(Checkouts, na.rm = T))

highest_checkout_item <- highest_checkout %>%
  pull(Title)

highest_checkout_date <- highest_checkout %>%
  pull(date)
  
highest_checkout_times <- highest_checkout %>%
  pull(Checkouts)

month_most_checkouts <- df %>%
  group_by(date) %>%
  summarize(totalCheckouts = sum(Checkouts)) %>%
  filter(totalCheckouts == max(totalCheckouts, na.rm = T))

month_least_checkouts <- df %>%
  group_by(date) %>%
  summarize(totalCheckouts = sum(Checkouts)) %>%
  filter(totalCheckouts == min(totalCheckouts, na.rm = T))
