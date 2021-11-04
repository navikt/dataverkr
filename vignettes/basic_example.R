## ---- include = FALSE-------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE,
  eval = FALSE
)

## ----setup------------------------------------------------------------------------------------------------------------------------------------
#  library(dataverkr)
#  library(plotly)

## ---------------------------------------------------------------------------------------------------------------------------------------------
#  metadata <- list(title = 'DataverkR example',
#                   bucket =  'nav-opendata',
#                   store = 'nais',
#                   temporal = reticulate::dict(from = '2020-09-16',
#                                               to='2020-09-16'),
#                   type =  'datapackage',
#                   format ='datapackage')

## ---------------------------------------------------------------------------------------------------------------------------------------------
#  dp <- create_dp(metadata)

## ---------------------------------------------------------------------------------------------------------------------------------------------
#  # Creating dataframe
#  country <- c("Norge","Sverige", "Danmark")
#  numberOf <- c(200, 300, 500)
#  df <- data.frame(country, numberOf)
#  
#  add_resource(dp = dp,
#               dataframe = df,
#               resource_name = 'some_dataframe',
#               resource_description = 'This is a resource example')

## ---------------------------------------------------------------------------------------------------------------------------------------------
#  # Creating plotly figure
#  fig <-  plot_ly(df, x = ~country, y = ~numberOf, type = 'bar')
#  
#  add_fig(dp = dp,
#          fig = fig,
#          title = 'Some plotly figure',
#          description = 'This is a plotly figure example')

## ---------------------------------------------------------------------------------------------------------------------------------------------
#  publish(dp)

