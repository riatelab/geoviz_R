#' Display the map
#'
#' The \code{viz_render} function returns a pretty map in SVG format :-)
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @export
#' @examples
#' library(sf)
#'
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create() |>
#'   viz_outline() |>
#'   viz_path(data = world) |>
#'   viz_render()
viz_render <- function(map) {
  htmlwidgets::createWidget(
    name = "render",
    x = r2json(map),
    package = "geoviz",
    elementId = NULL
  )
}
