#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#source("datafile_name.R", local = knitr::knit_global())
#source commented out because I am not using any data here 

introduction_page <- tabPanel(
  "Introduction", 
  h1("This is my header. I can align it wherever I want on the page. "), 
  p("this is my paragraph. I can change fonts and text sizes (documented online).I can also add images")
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
  h1("Header 1"),
  h3("Header 2 "),
  p("P2. I can also add an image here"),
  img()
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

server <- function(input, output, session) {
  
}

shinyApp(ui, server)



