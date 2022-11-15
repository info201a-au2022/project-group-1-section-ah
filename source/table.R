# Table (B3)
library(dplyr)
library(tidyverse)
populationData <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ah/main/data/populationDataset.csv")
View(populationData)

aggregate(Population.growth.percent ~ Country, populationData, mean)
aggregate(Population.growth.percent ~ ContinentCode, populationData, mean)

d <- populationData %>% 
  select(Country, Code, ContinentCode, Population.growth.percent, Population.size.in.millions) %>% 
  group_by(Country, Code, ContinentCode) %>% 
  summarize(AveragePopulationGrowthInPercentage = round(mean(Population.growth.percent, na.rm = TRUE),2)) 
View(d)

# This table shows the average growth in population for each country by percentage each year.
# We hoped to find countries of concern and further study their behaviors and policies.
# Nations such as Japan and Georgia have an extremely concerning lack of growth yearly, 
# and we aim to find why that is through further research.

# We also hoped to find countries with high growths in populations in order to study 
# further and see what they are doing in order to increase their populations year by year.
# An interesting thing to note is that countries which are located in the Middle East typically
# see larger growth year by year, than the rest of their Asian counterparts.