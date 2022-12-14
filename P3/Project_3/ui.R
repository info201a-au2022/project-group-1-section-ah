#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library("shinythemes")
library(shiny)
library(plotly)
source("helper.R")



asia_data <- read.csv("populationDataset.csv")

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

population_data <- read.csv("populationDataset.csv") %>% 
  data.frame()

by_country <- population_data[, c(2, 4, 7)] 


#source("datafile_name.R", local = knitr::knit_global())
#source commented out because I am not using any data here 

introduction_page <- tabPanel(
  fluidPage(theme = shinytheme("cosmo"),
  "Introduction", 
  h1(strong("The World Population Explosion")),
  p(em("Group AH-1: Kai Andreic, Yoobin Lee, Ethan Kim, Tom Sander")),
  img(src='shibuya.jpg', align = "right"),
  h3("Asia is the largest continent by population."), 
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
    understand population dynamics of the world."),
  p(strong("Select a tab below to begin exploring the data."))
)
)
page2 <- tabPanel(
  "Population Trends", 
  h1(strong("Population Trends of Asian Countries")),
  p("Select a country and time range to view the population trends"),
  img(), 
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "Country", 
        label = "Select a Country", 
        choices = c("AFG", "ARE", "ARM", "AZE", "BGD", "BHR", "BRN", "BTN", "CHN", "CYP", "GEO", "IDN", "IND", "IRN", "IRQ", "ISR", "JOR", "JPN", "KAZ", "KGZ", "KHM", "KOR", "KWT", "LAO", "LBN", "LKA", "MAC", "MDV", "MNG", "MYS", "NPL", "OMN", "PAK", "PHL", "PRK", "PS", "QAT", "RUS", "SAU", "SGP", "SYR", "THA", "TJK", "TKM", "TUR", "TWN", "UZB", "VNM", "YEM"), 
        selected = "AFG",
        multiple = TRUE
      ),
      
      sliderInput("timeRange",
                  "Timeframe",
                  min = 1960,
                  max = 2021,
                  value = c(1960, 2021),
                  sep = "")
    ),
    
    mainPanel(
      plotlyOutput("pop_trends_plot"),
      p("This chart shows the population trends for every single country in Asia. We included this chart because it shows the overall trend of every country, and also the noticeable outliers.Some noticeable information we found from this plot is that the general population trend of most countries in Asia has an increasing trend aside form a couple that show a slight decline around the beginning of 21st Century. We also noticed that the countries that show a slight decline around the beginning of 21st Century are generally wealthier countries.")
    )
  )
)

page3 <- tabPanel(
  "World Map", 
  h1("World Map"),
  img(),
  
  
  
  
  titlePanel("Unemployment Rate in Asia 2020"),
  
  
  
  mainPanel(
    
    
    tags$style(type = "text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"),
    
    
    girafeOutput("distPlot")
    
  ),
  h3("Why seeing the unemployment rate is important"),
  p("A lot of people decide to move away from their home country to find better
    work. This would also obviously apply to people who may not even be able to
    find work in their own country. So the main reason why we decided to look at
    unemployment rates in each country is because it can relate to the decline
    of population in each country. If the unmployment rate is high in certain
    countries it promotes people to move to countries where they know they can
    find a job. This would end up increasing and decreasing population in certain
    countries."),
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
        label = "Select Subregion(s)", 
        choices = c("South", "East", "West", "Eurasia", "Southeast", "Central"), 
        selected = "South",
        multiple = TRUE
      ),
      
      sliderInput("time_range",
                  "Timeframe",
                  min = 1960,
                  max = 2021,
                  value = c(1960, 2021),
                  sep = ""
      ),
      
      radioButtons("color_var",
                  "Color Encoding",
                  choiceValues = c("Year", "Growth Score"),
                  selected = "Year",
                  choiceNames = c("Year", "Growth Rate (YoY)")
      )
    ),
    
    mainPanel(
      plotlyOutput("dt_plot"),
    )
  )
  
  
)

conclusion_page <- tabPanel(
  "Summary Takeaways",
  h1(strong("Summary Takeaways")),
  h3("Population Trends"),
  p("The visualization of each country's population trends reveal a lot about 
    which nations are struggling with their respective populations. Nations such
    as Japan and Georgia have an extremely concerning lack of growth yearly, whilst
    nations such as the United Arab Emirates and Qatar's growths are thriving.
    An interesting thing to note is that countries which are located in the Middle 
    East typically see larger growth year by year, than the rest of their Asian counterparts."),
  h3("World Map"),
  p("This map of unemployment rates implies that population growth is at least
    somewhat related to rates of unemployment. In some nations where there is high
    unemployment, such as Armenia and Georgia, there is also clear decline in populations.
    On the other hand, some nations such as Jordan and Palestine have high unemployment
    yet high population growth. A key takeaway is that unemployment is a factor that
    can affect population decline, yet it is not always an accurate indicator of it."),
  h3("Demographic Transition"),
  p("The demographic transition is a model of population dynamics that argues the 
    growth of countries follows a set pattern, driven by birth rates and death 
    rates. A main point shown by the graphs is that there each nation sees a clear 
    population explosion following the industrial revolution. Birth rates remained 
    high whilst death rates plummeted due to technological advancements, such as 
    vaccinations and water purifiers.")
)

ui <- navbarPage(
  "INFO 201 Final Project",
  introduction_page,
  page2,
  page3, 
  page4, 
  conclusion_page
)




