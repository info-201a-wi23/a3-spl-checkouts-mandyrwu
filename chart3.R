library("dplyr")
library("ggplot2")
library("plotly")
library("scales")

df <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

types <- df %>%
  group_by(MaterialType) %>%
  summarize(totalCheckouts = sum(Checkouts, na.rm = TRUE)) %>%
  arrange(desc(totalCheckouts))

types <- head(types, 10)

piechart <- ggplot(data = types, aes(x = "", y = totalCheckouts, fill = MaterialType)) +
  labs(title = "Most Checked Out Material Types", fill = "Material Type") +
  geom_col(color = "black") +
  coord_polar(theta = "y") +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  scale_y_continuous(labels = label_number_si())


piechart
