#' @title Create a geoviz map
#' @description The \code{viz_create} function initializes a geoviz SVG map container.
#' It defines global map parameters such as size, projection, margins, and interaction options,
#' and prepares an empty layer stack for subsequent visual elements.
#'
#' @param id character. Optional. SVG container id (default "map").
#' @param width numeric. Optional. Map width (default the width of the device).
#' @param responsive logical. Optional. Whether the SVG resizes with the container (default FALSE).
#' @param domain object | list. Optional. Geographic domain (GeoJSON or list of GeoJSON objects).
#' @param projection function | character. Optional. Map projection (default "mercator").
#' @param background character. Optional. Background color.
#' @param fontFamily character. Optional. Global font family for the map.
#' @param margin numeric vector or numeric. Optional. Map margins (default c(0,0,0,0)).
#' @param zoomable logical | numeric | character. Optional. Enable zoom (default FALSE).
#' @param control logical | numeric vector. Optional. Zoom control buttons (default FALSE).
#' @param warning logical. Optional. Display warnings (default TRUE).
#' @param ... Additional internal parameters passed to the map container.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(projection = "EqualEarth", zoomable = TRUE) |>
#'   viz_path(data = world, fill = "#38896F") |>
#'   viz_render()
viz_create <- function(
    id = "map",
    width = NULL,
    domain = NULL,
    responsive = FALSE,
    projection = NULL,
    background = NULL,
    fontFamily = NULL,
    margin = c(0, 0, 0, 0),
    zoomable = FALSE,
    control = FALSE,
    warning = TRUE,
    ...
) {
  structure(
    list(
      params = list(
        id = id,
        width = NULL,
        domain = NULL,
        responsive = responsive,
        projection = projection,
        background = background,
        fontFamily = fontFamily,
        margin = margin,
        zoomable = zoomable,
        control = control,
        warning = warning,
        ...
      ),
      layers = list()
    ),
    class = "geoviz"
  )
}
