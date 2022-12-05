#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(plotly)
library(dplyr)
source("..project-group-1-section-ah/P3/helper.R")
# Data wrangling for the demo transit chart
asia_data <- read.csv("../data/populationDataset.csv") %>% 
  dplyr::mutate(asia_data, subregion = ifelse(asia_data$Country %in% c("China",
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


# Data for Population Trends Tab
population_data <- read.csv("../data/populationDataset.csv") %>% 
  data.frame()

by_country <- population_data[, c(2, 4, 7)] 



server <- function(input, output, session) {
  
  population_trends_data <- reactive({
    by_country %>% 
      filter(Code %in% input$Country,
             Year %in% c(input$time_range[1]:input$time_range[2]))
  })

  output$pop_trends_plot <- renderPlotly({ggplotly(ggplot(population_trends_data, aes(x=Year, y=Population.size.in.millions, color = Code)) + 
                                                     geom_line() + 
                                                     ggtitle("Population Trends of Every Country in Asia Excluding China and India") +
                                                     labs(y = "Population Size in Millions") 
                                                     )
    })
  
  demo_transit_data <- reactive({ 
    asia_data %>% 
      filter(subregion %in% input$subregions,
             Year %in% c(input$time_range[1]:input$time_range[2]))
  })
  
  output$dt_plot <- renderPlotly({ggplotly(ggplot(demo_transit_data()) +
                                             geom_point(mapping = aes(
                                               x = Fertility.rate.births.per.woman, 
                                               y = Death.rate.per.1000.people, 
                                               color = Year, 
                                               text = paste("Country:", Country)
                                             ), alpha = .5) +
                                             scale_color_gradient(low = "gray", high = "red") +
                                             facet_wrap(~subregion) + 
                                             labs(
                                               title = "Visualizing Demographic Transition",
                                               x = "Fertility Rate (Births/Woman)",
                                               y = "Death rate per 1000 people"
                                             ) 
  )
  })
}


#World Map
  
  # Create the interactive world map
  output$distPlot <- renderGirafe({
    ggiraph(code = print(worldMaps(df2019, mapdatas, input$DataType)))
  })
  

