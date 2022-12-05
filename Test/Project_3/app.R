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
                          token='7A37F1A6AFD7995240083A28682929AA',
                          secret='B/W8DiDQwoLiJt4z+HzklBot0d9406PgT2kcHa7V')
