# Importing libraries
library(dataverkr)
library(plotly)

# Creating dataframe
country <- c("Norge","Sverige", "Danmark")
numberOf <- c(200, 300, 500)
df <- data.frame(country, numberOf)

# Creating plotly figure
fig <-  plot_ly(df, x = ~country, y = ~numberOf, type = 'bar')
fig


# Metadata for datapackage
metadata <- list(title = 'DataverkR example',
                 temporal = list(from = '2020-09-16',
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
                        dataframe = df,
                        resource_name = 'some_dataframe',
                        resource_description = 'This is a resource example')

# Publishing the datapackage
dataverkr::publish(dp)
