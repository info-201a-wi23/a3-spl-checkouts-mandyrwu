library("dplyr")
library("ggplot2")
library("plotly")

df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

df <- mutate(df, date = paste0(CheckoutMonth, "-01-", CheckoutYear))

df$date <- as.Date(df$date, format = "%m-%d-%Y")

barplot <- ggplot(data = df) +
  geom_col(aes(x = CheckoutYear, y = Checkouts, fill = UsageClass)) +
  labs(title = "Annual Checkout Count by Item Type",
      x = "Date",
      y = "Total Number of Checkouts in a Year",
      fill = "Item Type") +
  scale_y_continuous(labels = label_number_si())

barplot

