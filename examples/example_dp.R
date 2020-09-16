# Importing libraries
library(dataverkr)
library(plotly)
library(reticulate)


# Creating dataframe
country <- c("Norge","Sverige", "Danmark")
numberOf <- c(200, 300, 500)
data <- data.frame(country, numberOf)

# Creating plotly figure
fig <-  plot_ly(data, x = ~country, y = ~numberOf, type = 'bar')
fig


# Metadata for datapackage
metadata <- list(title = 'DataverkR example',
                 bucket =  'nav-opendata',
                 store = 'nais',
                 temporal = reticulate::dict(from = '2020-09-16',
                                             to='2020-09-16'),
                 type =  'datapackage',
                 format ='datapackage')

# Creating datapackage
dp <- dataverkr::create_dp(metadata)

# Adding plotly figure to the datapackage
dataverkr::add_fig(dp = dp,
                   fig = fig,
                   title = 'Some plotly figure',
                   description = 'This is a plotly figure example')

# Adding dataframe as a resource to the datapackage
dataverkr::add_resource(dp = dp,
                        dataframe = data,
                        resource_name = 'some_dataframe',
                        resource_description = 'This is a resource example')

# Publishing the datapackage
dataverkr::publish(dp)