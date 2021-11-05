#' Creates a dataverk datapackage object
#'
#' @param metadata Metadata
#' @param python_path Path to python version
#' @importFrom reticulate use_python import dict
#' @example man/examples/example_dp.R
#' @export
create_dp <- function(metadata,
                      python_path = system("which python")){

  use_python(python_path)
  dataverk <- import("dataverkr")
  pyMetadata <- dict(metadata)

  dataverk$Datapackage(pyMetadata)
}
