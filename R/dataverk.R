library(reticulate)
library(plotly)
# "/opt/conda/bin/python"
# system("which python")


#' A function that creates a dataverk datapackage object.
#'
#' @param metadata Metadata
#' @param python_path Path to python version
#' @export

create_dp <- function(metadata,
                      python_path = system("which python")){

  reticulate::use_python(python_path)
  dataverk <- reticulate::import("dataverk")
  pyMetadata <- reticulate::dict(metadata)

  return(dataverk$Datapackage(pyMetadata))
}

#' A function that adds a plotly fig to a datapackage object.
#'
#' @param dp Datapackage
#' @param fig Plotly figure
#' @param title Title of figure
#' @param description Description of figure
#' @export

add_fig <- function(dp,
                     fig,
                     title,
                     description= ''){

  fig_json <-plotly::plotly_json(fig)

  dp$add_view(spec = fig_json$x$data,
              spec_type = 'plotly',
              title = title,
              description = description,
              name = title,
              resources = list())
}

#' A function that adds a dataframe resource to a datapackage object.
#'
#' @param dp Datapackage
#' @param resource Dataframe to be added
#' @param resource_name Name of the resource
#' @param resource_description Description of the dataframe
#' @param python_path Path to python version
#' @export

add_resource <- function(dp,
                         dataframe,
                         resource_name,
                         resource_description = '',
                         python_path = system("which python")){

  reticulate::use_python(python_path)
  pd <- reticulate::import("pandas")

  named_list = list()
  for  (column in colnames(dataframe)){
    named_list = c(named_list,column = dataframe[column])
  }

  pandas_dict <- reticulate::dict(named_list)
  df <- pd$DataFrame(data = pandas_dict)
  colnames(df) <- gsub('column.','',colnames(df))

  dp$add_resource(resource = df, resource_name = resource_name, resource_description = resource_description)
}

#' A function that publishes a datapackage.
#'
#' @param dp Datapackage to be published
#' @param python_path Path to python version
#' @export

publish <- function(dp, python_path= system("which python")){
  reticulate::use_python(python_path)
  dataverk <- reticulate::import("dataverk")
  dv <- dataverk$Client()

  dv$publish(dp)
}

