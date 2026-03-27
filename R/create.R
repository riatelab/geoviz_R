#' Create a geoviz map object
#'
#' The \code{viz_create} function initializes a map.
#' It produces a list containing the map parameters and an initially empty list of layers.
#'
#' @param projection character. The projection to use for the map.
#'   You can provide a d3 projection function as a string
#'   (e.g., "mercator"). Set "none" to use geometries as-is, in which case
#'   you must specify the domain.
#' @param domain numeric vector of length 4 or sf object. The geographic area
#'   to display, either as a bounding box c(top, right, bottom, left) or as an spatial dataframe.
#' @param zoomable logical, numeric, or character. If TRUE, enables zoom.
#'   Can also be "versor" to use versor zoom (vector geometries only). If numeric
#'   vector of length 2, sets scale extent (default c(1, 8)).
#' @param width numeric. Width of the map in pixels (default the width of the container).
#' @param responsive logical. If TRUE, the SVG map resizes with the container
#'   (default FALSE).
#' @param id character. ID of the SVG container (default "map").
#' @param background character. Background color of the SVG.
#' @param margin numeric or numeric vector. Margins around the map. Either a
#'   single value or a vector c(top, right, bottom, left) (default 0).
#' @param warning logical. Whether to display warnings (default TRUE).
#'
#' @return An object of class geoviz, containing the map parameters
#' @seealso See all parameters in the documentation of the underlying JS library:
#'   \href{https://riatelab.github.io/geoviz/global.html#create}{here},
#
#' @export
#'
#' @examples
#' # Basic map with Mercator projection
#' map <- viz_create(
#'   projection = "EqualEarth",
#'   width = 800,
#'   zoomable = TRUE
#' )
viz_create <- function(id = "map", margin = c(0,0,0,0), ...) {
  structure(
    list(
      params = list(id = id, margin = margin, ...),
      layers = list()
    ),
    class = "geoviz"
  )
}
