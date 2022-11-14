# Summary (B2)

library(dplyr)
library(tidyverse)

populationData <- read.csv("/Users/yoobinlee/Autumn2022/info201/project/project-group-1-section-ah/data/populationDataset.csv")

summary_info <- list()
summary_info$num_countries <- length(unique(populationData$Country))
summary_info$highest_population_2021 <- populationData %>%
  filter(Year == "2021", na.rm = TRUE) %>% 
  filter(Population.size.in.millions == max(Population.size.in.millions, na.rm = TRUE)) %>%
  select(Population.size.in.millions, Country)
summary_info$lowest_population_2021 <- populationData %>% 
  filter(Year == "2021", na.rm = TRUE) %>% 
  filter(Population.size.in.millions == min(Population.size.in.millions, na.rm = TRUE)) %>%
  select(Population.size.in.millions, Country)



View(summary_info)
