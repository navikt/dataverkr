#' Publish datapackage
#'
#' @param dp Datapackage to be published
#' @param python_path Path to python version
#' @importFrom reticulate import use_python
#' @example man/examples/example_dp.R
#' @export
publish <- function(dp, python_path = system("which python")){
  use_python(python_path)
  dataverk <- reticulate::import("dataverk")
  dv <- dataverk$Client()

  dv$publish(dp)
}
