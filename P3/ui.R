#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
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
#source("datafile_name.R", local = knitr::knit_global())
#source commented out because I am not using any data here 

introduction_page <- tabPanel(
  "Introduction", 
  h1("Introduction: The World Population Explosion"),
  img("Shibuya Crossing in Tokyo.", src = "../docs/shibuya.jpeg"),
  h2("Asia is the largest continent by population."), 
  p("And population has been on everyone's mind. On November 15th, 2022, the Earth's
    population hit 8 billion. Climate change is reaching an unstoppable pace, 
    already dealing catastrophic damage through mass flooding in Bangladesh and deadly
    heat waves in England - and all the while, the world's population continues to
    grow exponentially."),
  p("What countries are growing rapidly and why? What countries are stagnating and 
    why? These are the questions we hope to answer with this report. Asia is just
    one part of the world, and proportionally contributes less to global warming 
    than some other continents. However, it is also the largest by population, 
    and many of its countries present great examples of population struggles 
    globally. By using population data dating back to 1960, we hope to gain some
    insight on the population dynamics of Asia - and maybe in doing so, better 
    understand population dynamics of the world.")
)

page2 <- tabPanel(
  "Growth Rates", 
  h1("Header 1"),
  h3("Header 2 "),
  p("P2. I can also add an image here"),
  img()
)

page3 <- tabPanel(
  "World Map", 
  h1("Header 1"),
  h3("Header 2 "),
  p("P2. I can also add an image here"),
  img()
)

page4 <- tabPanel(
  "Demographic Transition", 
  h1(strong("The Demographic Transition")),
  h3("How and why do countries grow?"),
  p("The demographic transition model of population dynamics argues that the 
    explosion of growth developing countries go through is due to a temporary
    divergence of birth rates and death rates."),
  p("\"Stage 1\" countries have mostly unchanging
    population counts, with high birth rates and high deeath rates. By stage 3,
    countries have developed better healthcare systems, less dangerous workplaces,
    and more stable political systems which all work to decrease death rates. 
    This is the stage of rapid growth; death rates are plummeting, but birth rates
    are stable, meaning the population grows quickly. By Stage 5, birth rates have
    fallen to match death rates. Country populations are stable again, or even
    decreasing, if the population is on average suitably old."),
  img(),
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "subregions", 
        label = "Select a Subregion", 
        choices = c("South", "East", "West", "Eurasia", "Southeast", "Central"), 
        selected = "South",
        multiple = TRUE
      ),
      
      sliderInput("time_range",
                  "Timeframe",
                  min = 1960,
                  max = 2018,
                  value = c(1960, 2018),
                  sep = "")
    ),
    
    mainPanel(
      plotlyOutput("dt_plot"),
    )
  )
  
  
)

conclusion_page <- tabPanel(
  "Conclusions",
  h1("Conclusions", align = "center"),
  p("This is my paragraph")
)

ui <- navbarPage(
  "INFO 201 Final Project",
  introduction_page,
  page2,
  page3, 
  page4, 
  conclusion_page
)




