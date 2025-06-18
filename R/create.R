#' viz_create
#'
#' @param projection The projection (d3) to use for the visualization.
#' @param domain The domain for the visualization. c(top, right, bottom, left)
#' @param zoomable boolean or "versor" to made the map zoomable
#' @param ... Additional parameters passed to other functions or layers.
#' @return Graticule layer
#' @export
viz_create <- function(...) {
  structure(
    list(
      params = list(...),
      layers = list()
    ),
    class = "geoviz"
  )
}
