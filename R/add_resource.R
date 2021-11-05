#' Adds a dataframe to datapackage object
#'
#' @param dp Datapackage
#' @param resource Dataframe to be added
#' @param resource_name Name of the resource
#' @param resource_description Description of the dataframe
#' @param python_path Path to python version
#' @importFrom reticulate use_python import dict
#' @example man/examples/example_dp.R
#' @export
add_resource <- function(dp,
                         dataframe,
                         resource_name,
                         resource_description = NULL,
                         python_path = system("which python")) {
  use_python(python_path)
  pd <- import("pandas")

  named_list = list()
  for (column in colnames(dataframe)) {
    named_list = c(named_list, column = dataframe[column])
  }

  pandas_dict <- reticulate::dict(named_list)
  df <- pd$DataFrame(data = pandas_dict)
  colnames(df) <- gsub('column.', '', colnames(df))

  dp$add_resource(
    resource = df,
    resource_name = resource_name,
    resource_description = resource_description
  )
}
