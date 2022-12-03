# Exercise 5: complex Shiny UI layouts

# Load libraries so they are available
library("shiny")
library("tidyverse")
library("plotly")

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("ui.R")
source("server.R")
source("global.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)

rsconnect::setAccountInfo(name='kaiandreic',
                          token='1D18FCC92F117605869484F4DB34910E',
                          secret='Z7dWEkgGy2Roej/uyUKE4bpAdXnBIiNdRzhsRuIV')

rsconnect::setAccountInfo(name='tjsander',
                          token='A8ADE5E1D16AA937582A152A423A1E50',
                          secret='C4aQ2loBvYedGy9YFF6vD/WpmDudz0V68gt/azUV')
#https://kaiandreic.shinyapps.io/AH-1-P3/
