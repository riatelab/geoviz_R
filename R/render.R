#' Add an Earth outline layer
#'
#' The \code{viz_outline} function creates a layer representing the Earth outline
#' according to the current projection.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param stroke character. Optional. Stroke color (default "none").
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param fill character. Optional. Fill color (default "#B5DFFD").
#'
#' @return The identifier of the created layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#outline}{documentation} of the underlying JS library.
#'
#' @export
#'
#' @examples
#' # Create a map
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create() |>
#'   viz_outline() |>
#'   viz_path(data = world) |>
#'   viz_render()
viz_render <- function(map, elementId = NULL) {
  htmlwidgets::createWidget(
    name = "render",
    x = r2json(map),
    package = "geoviz",
    elementId = elementId
  )
}

