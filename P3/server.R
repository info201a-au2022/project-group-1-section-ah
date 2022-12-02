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

asia_data <- read.csv("../data/populationDataset.csv")

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

server <- function(input, output, session) {
  
  demo_transit_data <- reactive({ 
    asia_data %>% 
      filter(subregion %in% input$subregions,
             Year %in% c(input$time_range[1]:input$time_range[2]))
  })
  
  output$dt_plot <- renderPlotly({ggplotly(ggplot(demo_transit_data()) +
                                             geom_point(mapping = aes(
                                               x = Fertility.rate.births.per.woman, y = Death.rate.per.1000.people, color = Year, text = paste("Country:", Country)
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
