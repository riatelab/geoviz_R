#' Display the map
#'
#' The \code{viz_render} function allows to display the map
#'
#' @param map A \code{geovizr} map object created using \code{viz_create()}.
#' @return An htmlwidget object representing an interactive map.
#' @export
#' @examples
#' library(sf)
#'
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geovizr"),
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
    package = "geovizr",
    elementId = NULL
  )
}
