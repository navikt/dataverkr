# DataverkR
DataverkR is a R wrapper for the python library [Dataverk](https://pypi.org/project/dataverk/). It
has support for creating and publishing datapackages, with Plotly figures and R dataframes.


# Example

### Importing libraries
To create and publish a datapackage you need to import [DataverkR](https://github.com/navikt/dataverkr) and
[Reticulate](https://rstudio.github.io/reticulate/). Also if you want to add Plotly figures you need to import [Plotly](https://plotly.com/r/).

```
library(dataverkr)
library(plotly)
library(reticulate)
```

## Creating datapackages
### Metadata
To create a datapackage you need to supply some metadata in a named list. To see which field are needed see the
[datapackages](https://dataplattform.gitbook.io/nada/analyseplattform/dataverk/datapakker) documentation.


```
metadata <- list(title = 'DataverkR example',
             bucket =  'nav-opendata',
             store = 'nais', 
             temporal = reticulate::dict(from = '2020-09-16',
                                         to='2020-09-16'), 
             type =  'datapackage',
             format ='datapackage')
```

### Creating the datapackage
To create the datapackage, simply run:
```
dp <- dataverkr::create_dp(metadata)
```

If the metadata is incomplete, an error will occur.

## Adding Plotly Figures and Dataframes

### Plotly figures
To add a Plotly figure:
```
dataverkr::add_fig(dp = dp,
                   fig = fig,
                   title = 'Some plotly figure', 
                   description = 'This is a plotly figure example')
```
To create a Plotly figure in R, see [Plotly](https://plotly.com/r/).

### Dataframes
To add a dataframe:
```
dataverkr::add_resource(dp = dp,
                        dataframe = data,
                        resource_name = 'some_dataframe',
                        resource_description = 'This is a resource example')
```
This dataframe will be available for download as .csv file.

### Publishing
Finally to publish the datapackage:
```
dataverkr::publish(dp)
```

# For NAV employees
Contact us in [#data-catalog-intern](https://nav-it.slack.com/archives/CQ9SV9DNE)
