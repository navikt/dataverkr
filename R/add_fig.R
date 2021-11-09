#' Adds plotly fig to datapackage object
#'
#' @param dp Datapackage
#' @param fig Plotly figure
#' @param title Title of figure
#' @param description Description of figure
#' @importFrom plotly plotly_json
#' @example man/examples/example_dp.R
#' @export
add_fig <- function(dp,
                    fig,
                    title = NULL,
                    description = NULL){

  fig_json <- plotly::plotly_json(fig)

  dp$add_view(spec = fig_json$x$data,
              spec_type = 'plotly',
              title = title,
              description = description,
              name = title,
              resources = list())
}
