library(ggplot2)
library(tidyr)
library(tidyverse)
library(ggrepel)

asia_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ah/main/data/populationDataset.csv") %>% 
  data.frame()

asia_data_21 <- asia_data %>% 
  filter("Year" == 2021) %>% 
  data.frame()

asia_data <- dplyr::mutate(asia_data, subregion = "placeholder")

asia_data <- dplyr::mutate(asia_data, subregion = ifelse(asia_data$Country %in% c("China",
                                                                                  "Japan",
                                                                                  "South Korea",
                                                                                  "Hong Kong",
                                                                                  "Macau",
                                                                                  "Macao",
                                                                                  "Mongolia" ,
                                                                                  "North Korea", 
                                                                                  "Taiwan"),
                                                         
                                                         "East",
                                                         
                                                         ifelse(asia_data$Country %in% c("Brunei", 
                                                                                         "Cambodia", 
                                                                                         "East Timor",
                                                                                         "Indonesia",
                                                                                         "Laos",
                                                                                         "Malaysia",
                                                                                         "Myanmar",
                                                                                         "Philippines",
                                                                                         "Singapore",
                                                                                         "Thailand",
                                                                                         "Vietnam"),
                                                                
                                                                "Southeast",
                                                                
                                                                
                                                                ifelse(asia_data$Country %in% c("India", 
                                                                                                "Afghanistan",
                                                                                                "Pakistan", 
                                                                                                "Bangladesh",
                                                                                                "Maldives",
                                                                                                "Nepal",
                                                                                                "Sri Lanka",
                                                                                                "Bhutan"),
                                                                       "South",
                                                                       
                                                                       ifelse(asia_data$Country %in% c("Kazakhstan", 
                                                                                                       "Kyrgyzstan", 
                                                                                                       "Tajikistan",
                                                                                                       "Turkmenistan",
                                                                                                       "Uzbekistan"),
                                                                              
                                                                              "Central",
                                                                              
                                                                              ifelse(asia_data$Country %in% c("Bahrain", 
                                                                                                              "Iran", 
                                                                                                              "Iraq",
                                                                                                              "Israel",
                                                                                                              "Jordan",
                                                                                                              "Kuwait",
                                                                                                              "Lebanon",
                                                                                                              "Oman",
                                                                                                              "Qatar",
                                                                                                              "Palestine",
                                                                                                              "Saudi Arabia",
                                                                                                              "Syria",
                                                                                                              "Turkey", 
                                                                                                              "United Arab Emirates",
                                                                                                              "Yemen",
                                                                                                              "Armenia",
                                                                                                              "Azerbaijan",
                                                                                                              "Cyprus",
                                                                                                              "Georgia"),
                                                                                     
                                                                                     "West",
                                                                                     
                                                                                     ifelse(asia_data$Country %in% c("Russia"),
                                                                                            
                                                                                            "Eurasia",
                                                                                            "NA")
                                                                              ))))))


demo_transit <- ggplot(asia_data) +
  geom_point(mapping = aes(
    x = Fertility.rate.births.per.woman, y = Death.rate.per.1000.people, color = Year
  ), alpha = .5) +
  scale_color_gradient(low = "gray", high = "red") +
  facet_wrap(~subregion) + 
  labs(
    title = "Visualizing Demographic Transition",
    x = "Fertility Rate (Births/Woman)",
    y = "Death rate per 1000 people"
  )

plot(demo_transit)             

# The question I hoped to answer with this graph (or series of graphs) was: how 
# has the demographic transition impacted diffeent regions of Asia differently?

# The demographic transition is a model of population dynamics that argues the 
# growth of countries follows a set pattern, driven by birth rates and death rates.
# Underdeveloped countries feature high death rates, and similarly high birth rates;
# people want to have more children, to counteract high infant mortality rates.
# Developing countries see massive explosions in population because safer and 
# easier work, decreasing levels of political instability and violence, and better
# healthcare all combine to make death rates fall - but birth rates stay high. 
# Developed countries begin to see slower growth because birth rates gradually 
# catch up to death rates, leading to roughly replacement-level rates.

# Without diving too deep into the details, the demographic transition model of 
# population dynamics utilizes 5 stages; I explained 1, 3, and 5 above (underdeveloped,
# developing, developed). 2 and 4 are basically the transition stages (2 = death rates
# begin to fall, 4 = birth rates begin to fall).

# I think my question was answered! Some regions are further along in the process
# than others, with East Asia, which is known to be highly developed, exhibiting 
# all the telltale signs of stage 5 countries, and Central Asia lagging behind 
# a little. Each region has it's eccentricities, too; Southeast Asia has some 
# crazy death rates in the 70's, probably driven from the large-scale effects of 
# the Vietnam war, while West Asia features an upturn in death rates recently,
# likely due to continuing political instability in the Middle East and the War
# On Terror. Russia also has been consistently trending upward in death rates, 
# probably due to a stagnating economy that never really recovered from the fall
# of the Soviet Union.
