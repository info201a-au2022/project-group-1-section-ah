library(tidyverse)
library(plotly)
library(shiny)


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