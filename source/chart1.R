# Chart 1 (B4)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(shiny)


population_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ah/main/data/populationDataset.csv") %>% 
  data.frame()
View(population_data)

by_country <- population_data[, c(2, 4, 7)] 
by_country <- filter(by_country, Code != "CHN")
by_country <- filter(by_country, Code != "IND")
View(by_country)

population_trend_plot <- ggplot(by_country, aes(x=Year, y=Population.size.in.millions, color = Code)) + geom_line() + ggtitle("Population Trends of Every Country in Asia Excluding China and India") + labs(y = "Population Size in Millions")
print(population_trend_plot)

# This chart shows the population trends for every single country in Asia excluding China and India.
# We decided to exclude China and India for this plot because they created too large of an outlier.
# Other values were unreadable when China and India were included because the difference was too large.
# We included this chart because it shows the overall trend of every country, and also the noticeable outliers.
# 
# Some noticeable information we found from this plot is that the general population trend of most countries in Asia 
# has an increasing trend aside form a couple that show a slight decline around the beginning of 21st Century. 
# We also noticed that the countries that show a slight decline around the beginning of 21st Century are 
# generally wealthier countries. 