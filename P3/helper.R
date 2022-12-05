library(shiny)
library(dplyr)
library(ggplot2)
library(ggiraph)
library(maps)



world_data <- ggplot2::map_data('world')
world_data <- fortify(world_data)
head(world_data)

df <- read.csv("/Users/kai/Documents/Info201/project-group-1-section-ah/data/populationDataset.csv")




unemployment_rate <- df %>% 
  select( Country, Code, ContinentCode, Year, Unemployment.rate) %>% 
  rename("Value" = 5)
unemployment_rate["DataType"] <- rep("Unemployment Rate", nrow(unemployment_rate))

unemployment_rate_forecast <- df %>% 
  select(Country, Code, ContinentCode, Year, Unemployment.rate.forecast) %>% 
  rename("Value" = 5)
unemployment_rate_forecast["DataType"] <- rep("Unemployment rate forecast", nrow(unemployment_rate_forecast))

population_size_in_millions <- df %>% 
  select(Country, Code, ContinentCode, Year, Population.size.in.millions) %>% 
  rename("Value" = 5)
population_size_in_millions["DataType"] <- rep("Population Size in Millions", nrow(population_size_in_millions))

population_growth <- df %>% 
  select(Country, Code, ContinentCode, Year, Population.growth.percent) %>% 
  rename("Value" = 5)
population_growth["DataType"] <- rep("Population Growth Percent", nrow(population_growth))

death_rate_per_1000_people <- df %>% 
  select(Country, Code, ContinentCode, Year, Death.rate.per.1000.people) %>% 
  rename("Value" = 5)
death_rate_per_1000_people["DataType"] <- rep("Death Rate Per 1000 People", nrow(death_rate_per_1000_people))

life_expectancy <- df %>% 
  select(Country, Code, ContinentCode, Year, Life.expectancy.in.years) %>% 
  rename("Value" = 5)
life_expectancy["DataType"] <- rep("Life expectancy in years", nrow(life_expectancy))

fertility_rate_births_per_woman <- df %>% 
  select(Country, Code, ContinentCode, Year, Fertility.rate.births.per.woman) %>% 
  rename("Value" = 5)
fertility_rate_births_per_woman["DataType"] <- rep("Fertility Rate Births Per Women", nrow(fertility_rate_births_per_woman))

suicide_mortality_rate <- df %>% 
  select(Country, Code, ContinentCode, Year, Suicide.mortality.rate.per.100000.population) %>% 
  rename("Value" = 5)
suicide_mortality_rate["DataType"] <- rep("Suicide Mortality Rate", nrow(suicide_mortality_rate))

poverty_percent_of_population <- df %>% 
  select(Country, Code, ContinentCode, Year, Poverty.percent.of.population) %>% 
  rename("Value" = 5)
poverty_percent_of_population["DataType"] <- rep("Poverty Percent of Population",nrow(poverty_percent_of_population))

happiness_index <- df %>% 
  select(Country, Code, ContinentCode, Year,Happiness.Index.0..unhappy....10..happy.) %>% 
  rename("Value" = 5)
happiness_index["DataType"] <- rep("Happiness Index 0 (unhappy) - 10 (happy)", nrow(happiness_index))

dfs <- rbind(unemployment_rate, unemployment_rate_forecast, happiness_index, poverty_percent_of_population,
             suicide_mortality_rate, fertility_rate_births_per_woman, death_rate_per_1000_people, 
             population_growth)
dfs[] <- lapply(dfs, as.character)
dfs$Value <- as.numeric(dfs$Value)

df2019 <- dfs %>% 
  filter(Year == "2020")

df2019[] <- lapply(df2019, as.character)
df2019$Value <- as.numeric(df2019$Value)

mapdatas <- map_data("world")
colnames(mapdatas)[5] <- "Country"
mapdatas <- left_join(mapdatas , df2019, by= "Country")
mapdatas <-mapdatas[!is.na(mapdatas$Code),]


worldMaps <- function(df2019, mapdatas, data_type){
  
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
  plotdf <- df2019[df2019$DataType == data_type]
  plotdf <- plotdf[!is.na(plotdf$Code), ]
  
  
  # Create caption with the data source to show underneath the map
  capt <- paste0("Source:TheGlobalEconomy.com ", ifelse(df2019$DataType == "Unemployment Rate", "",
                                                        "United Nations" ))
  
  
  # Specify the plot for the world map
  library(RColorBrewer)
  library(ggiraph)
  g <- ggplot() + 
    geom_polygon_interactive(data = subset(mapdatas, lat >= -60 & lat <= 90), color = 'gray70', size = 0.1,
                             aes(x = long, y = lat, fill = Value, group = group, 
                                 tooltip = sprintf("%s<br/>%s", Code, Value))) + 
    scale_fill_gradientn(colours = brewer.pal(5, "RdBu"), na.value = 'white') + 
    labs(fill = df2019$DataType, color = df2019$DataType, title = NULL, x = NULL, y = NULL, caption = capt) + 
    my_theme()
  
  return(g)
}




