library(ggplot2)
library(tidyverse)
library(maps)
library(plotly)
library(dplyr)
all_info <-read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ah/main/data/populationDataset.csv")

mapdatas <- map_data("world")
colnames(mapdatas)[5] <- "Country"
mapdatas <- left_join(mapdatas , all_info, by= "Country")

test <- mapdatas %>% 
  select(long, lat, group, Country, order, subregion, `Population size in millions`,Year) %>% 
  filter(Year == 2021)
tester<- test %>% 
  select(long, lat, group, Country, order, subregion, `Population size in millions`)

mapdata1s<-tester %>% 
  filter(!is.na(test$`Population size in millions`)) 
  
  
View(mapdata1s)

  


map1s<-ggplot(mapdata1s, aes( x = long, y = lat, group=group)) +
    geom_polygon(aes(fill = `Population size in millions`), color = "black")
map1s


install.packages("cowplot")
library(cowplot)

