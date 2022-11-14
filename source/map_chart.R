library(ggplot2)
library(tidyverse)
library(maps)
library(plotly)
library(dplyr)
all_info <-read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ah/main/data/populationDataset.csv")

mapdatas <- map_data("world")
colnames(mapdatas)[5] <- "Country"
mapdatas <- left_join(mapdatas , all_info, by= "Country")

#population
population1 <- mapdatas %>% 
  select(long, lat, group, Country, order, subregion, `Population size in millions`,Year) %>% 
  filter(Year == 2021)
population2<- population1 %>% 
  select(long, lat, group, Country, order, subregion, `Population size in millions`)

mapdata1s<-population2 %>% 
  filter(!is.na(population1$`Population size in millions`)) 
  
map1s<-ggplot(mapdata1s, aes( x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = `Population size in millions`), color = "black")
map1s

#Happy
happiness1 <- mapdatas %>% 
  select(long, lat, group, Country, order, subregion, `Happiness Index 0 (unhappy) - 10 (happy)`,Year) %>% 
  filter(Year == 2021)
happiness2 <- happiness1 %>% 
  select(long, lat, group, Country, order, subregion, `Happiness Index 0 (unhappy) - 10 (happy)`)
mapdata2 <- happiness2 %>% 
  filter(!is.na(happiness1$`Happiness Index 0 (unhappy) - 10 (happy)`))
happy_map <-ggplot(happiness1, aes( x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = `Happiness Index 0 (unhappy) - 10 (happy)`), color = "white")
happy_map



