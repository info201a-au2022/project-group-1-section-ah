# Summary (B2)

library(dplyr)
library(tidyverse)

populationData <- read.csv("/Users/yoobinlee/Autumn2022/info201/project/project-group-1-section-ah/data/populationDataset.csv")
View(populationData)

summary_info <- list()

# number of countries
summary_info$num_countries <- length(unique(populationData$Country))

# Country with the highest population in 2021 and its size
summary_info$highest_population_2021 <- populationData %>%
  filter(Year == "2021", na.rm = TRUE) %>% 
  filter(Population.size.in.millions == max(Population.size.in.millions, na.rm = TRUE)) %>%
  select(Population.size.in.millions, Country)

# Country with the lowest population in 2021 and its size
summary_info$lowest_population_2021 <- populationData %>% 
  filter(Year == "2021", na.rm = TRUE) %>% 
  filter(Population.size.in.millions == min(Population.size.in.millions, na.rm = TRUE)) %>%
  select(Population.size.in.millions, Country)

# highest life expectancy in Asia
summary_info$highest_life_expectancy <- populationData %>% 
  filter(Life.expectancy.in.years == max(Life.expectancy.in.years, na.rm = TRUE)) %>% 
  select(Country, Life.expectancy.in.years, Year)

# lowest life expectancy in Asia 
summary_info$lowest_life_expectancy <- populationData %>% 
  filter(Life.expectancy.in.years == min(Life.expectancy.in.years, na.rm = TRUE)) %>% 
  select(Country, Life.expectancy.in.years, Year)

View(summary_info)