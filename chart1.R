library("dplyr")
library("ggplot2")
library("plotly")

df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

df <- mutate(df, date = paste0(CheckoutMonth, "-01-", CheckoutYear))

df$date <- as.Date(df$date, format = "%m-%d-%Y")

avg_checkout <- df %>%
  group_by(date) %>%
  summarize(avgCheckouts = mean(Checkouts))

average <- ggplot(data = avg_checkout) +
  geom_line(aes(x = date, y = avgCheckouts)) + 
  geom_point(aes(x = date, y = avgCheckouts)) +
  labs(title = "Monthly Average Checkouts per Item",
       x = "Date",
       y= "Average Checkouts of an Item in a Month") 

average
