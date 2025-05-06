#' Create
#'
#' @param projection The projection (d3) to use for the visualization.
#' @param domain The domain for the visualization. c(top, right, bottom, left)
#' @param zoomable boolean or "versor" to made the map zoomable
#' @param ... Additional parameters passed to other functions or layers.
#' @return Graticule layer
#' @export
create <- function(projection = NULL, domain = NULL, zoomable = FALSE, ...) {
  structure(
    list(
      params = list(
        projection = projection,
        domain = domain,
        zoomable = zoomable,
        ...
      ),
      layers = list()
    ),
    class = "d3carto"
  )
}
