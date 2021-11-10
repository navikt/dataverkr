# DataverkR
DataverkR is a R wrapper for the python library [Dataverk](https://pypi.org/project/dataverk/). It
has support for creating and publishing datapackages, with Plotly figures and R dataframes.

# Example

### Importing libraries
To create and publish a datapackage you need to import [DataverkR](https://github.com/navikt/dataverkr). Also if you want to add Plotly figures you need to import [Plotly](https://plotly.com/r/).

### Python
You must have Python installed on your machine in order to run this package. The first time you use any python call in R, you will get a warning:

>No non-system installation of Python could be found.
Would you like to download and install Miniconda?
Miniconda is an open source environment management system for Python.
See [miniconda](https://docs.conda.io/en/latest/miniconda.html) for more details.

The warning will only be given one time on each computer.

You must also have the Python package `dataverk` installed:
```
pip install dataverk
```

Then you can load this package:
```
library(dataverkr)
```

## Creating datapackages
### Metadata
To create a datapackage you need to supply some metadata in a named list. To see which field are needed see the
[datapackages](https://dataplattform.gitbook.io/nada/analyseplattform/dataverk/datapakker) documentation.


```
metadata <- list(title = 'DataverkR example',
                 temporal = list(from = '2020-09-16',
                                 to='2021-11-05'))
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

## Publishing
Finally to publish the datapackage:
```
dataverkr::publish(dp)
```

# For NAV employees
Contact us in [#data-catalog-intern](https://nav-it.slack.com/archives/CQ9SV9DNE)
