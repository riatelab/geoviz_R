#' Save the map
#'
#' The \code{viz_save} function allows to download the map
#' @param map A \code{geovizr} map object created using \code{viz_create()}.
#' @export
#' @param map a geoviz object create with the \code{viz_create}
#' @return A file path to the downloaded SVG map.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geovizr"),
#'   quiet = TRUE
#' )
#'
#' viz_create() |>
#'   viz_outline() |>
#'   viz_path(data = world) |>
#'   viz_save()
viz_save <- function(map) {
  htmlwidgets::createWidget(
    name = "save",
    x = r2json(map),
    package = "geovizr",
    elementId = NULL
  )
}
