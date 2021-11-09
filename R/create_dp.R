#' Creates a dataverk datapackage object
#'
#'
#'
#' @param metadata Metadata
#' @param python_path Path to python version
#' @importFrom reticulate use_python import dict
#' @example man/examples/example_dp.R
#' @export
create_dp <- function(metadata){

  dataverk <- reticulate::import("dataverk")
  pyMetadata <- reticulate::dict(metadata)

  dataverk$Datapackage(pyMetadata)
}
