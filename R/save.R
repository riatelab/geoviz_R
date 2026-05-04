#' Save the map
#'
#' The \code{viz_save} function allows to doawnload the map
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @export
#' @param map a geoviz object create with the \code{viz_create}
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
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
    package = "geoviz",
    elementId = NULL
  )
}
