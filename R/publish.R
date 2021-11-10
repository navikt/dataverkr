#' Publish datapackage
#'
#' @param dp Datapackage to be published
#' @param python_path Path to python version
#' @importFrom reticulate import use_python
#' @example man/examples/example_dp.R
#' @export
publish <- function(dp){
  dataverk <- reticulate::import("dataverk")
  dv <- dataverk$Client()

  dv$publish(dp)
}
