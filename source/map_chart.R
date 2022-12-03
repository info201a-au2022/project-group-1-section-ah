
library(tidyverse)
library(plotly)
library(dplyr)
library(maps)
library(ggplot2)
world_data <- ggplot2::map_data('world')
world_data <- fortify(world_data)
head(world_data)
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

#practice

library(reshape2)
childlessness_melt <- melt(childlessness_data, id = c("Country", "ISO3", "Period"), 
                           variable.name = "Indicator", value.name = "Value")
childlessness_melt$Value <- as.numeric(childlessness_melt$Value)
gender_index_melt <- melt(gender_index_data, id = c("ISO3", "Country", "Indicator"), 
                          variable.name = "Period", value.name = "Value")

pop_size["DataType"] <- rep("Population Size in Millions", nrow(df$`Population size in millions`))
pop_growth["DataType"] <- rep("Population Growth Percent", nrow(df$`Population growth percent`))
df <- rbind(df, df)


worldMaps <- function(df, world_data, data_type, period, indicator){
  
  # Function for setting the aesthetics of the plot
  my_theme <- function () { 
    theme_bw() + theme(axis.title = element_blank(),
                       axis.text = element_blank(),
                       axis.ticks = element_blank(),
                       panel.grid.major = element_blank(), 
                       panel.grid.minor = element_blank(),
                       panel.background = element_blank(), 
                       legend.position = "bottom",
                       panel.border = element_blank(), 
                       strip.background = element_rect(fill = 'white', colour = 'white'))
  }
  
  # Select only the data that the user has selected to view
  plotdf <- df[df$Indicator == indicator & df$DataType == data_type & df$Period == period,]
  plotdf <- plotdf[!is.na(plotdf$ISO3), ]
  
  # Add the data the user wants to see to the geographical world data
  world_data['DataType'] <- rep(data_type, nrow(world_data))
  world_data['Period'] <- rep(period, nrow(world_data))
  world_data['Indicator'] <- rep(indicator, nrow(world_data))
  world_data['Value'] <- plotdf$Value[match(world_data$ISO3, plotdf$ISO3)]
  
  # Create caption with the data source to show underneath the map
  capt <- paste0("Source: ", ifelse(data_type == "Childlessness", "United Nations" , "World Bank"))
  
  # Specify the plot for the world map
  library(RColorBrewer)
  library(ggiraph)
  g <- ggplot() + 
    geom_polygon_interactive(data = subset(world_data, lat >= -60 & lat <= 90), color = 'gray70', size = 0.1,
                             aes(x = long, y = lat, fill = Value, group = group, 
                                 tooltip = sprintf("%s<br/>%s", ISO3, Value))) + 
    scale_fill_gradientn(colours = brewer.pal(5, "RdBu"), na.value = 'white') + 
    labs(fill = data_type, color = data_type, title = NULL, x = NULL, y = NULL, caption = capt) + 
    my_theme()
  
  return(g)
}
