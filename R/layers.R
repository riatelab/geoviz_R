#' @title Add a graticule
#' @description The viz_graticule function adds a latitude/longitude grid to a geoviz map.
#' @name viz_graticule
#' @param map A geoviz object created with viz_create. Use the |> operator to chain instructions.
#' @param step Numeric or numeric vector. Gap between graticules. Default is 10. Can be a single number or two numbers for different spacing.
#' @param stroke Character. Stroke color of graticule lines. Default is "#9ad5e6".
#' @param fill Character. Fill color. Default is "none".
#' @param strokeWidth Numeric. Width of the stroke. Default is 0.8.
#' @param strokeLinecap Character. Line cap style. Default is "square".
#' @param strokeLinejoin Character. Line join style. Default is "round".
#' @param strokeDasharray Numeric or numeric vector. Dash pattern for lines. Default is 2.
#' @seealso See all parameters in the documentation of the underlying JS library:
#'   \href{https://riatelab.github.io/geoviz/global.html#graticule}{here},
#' @return A geoviz layer representing the graticule.
#' @export
#'
#' @examples
#' viz_create() |>
#'   viz_graticule(step = 10, strokeDasharray = c(2, 4), stroke = "#0000FF") |>
#'   viz_render()
viz_graticule <- function(map, projection = "none", step = 10, stroke = "#9ad5e6", strokeDasharray = 2, ...) {
  add_layer(map, "graticule", step = step, stroke = stroke, strokeDasharray = strokeDasharray, ...)
}

#' viz_outline
#' @export
viz_outline   <- function(map, ...) add_layer(map, "outline", ...)

#' viz_header
#' @export
viz_header   <- function(map, ...) add_layer(map, "header", ...)

#' viz_sketch
#' @export
viz_sketch   <- function(map, ...) add_layer(map, "sketch", ...)

#' viz_earth
#' @export
viz_earth   <- function(map, ...) add_layer(map, "earth", ...)

#' viz_footer
#' @export
viz_footer   <- function(map, ...) add_layer(map, "footer", ...)


#' piz_path
#' @export
viz_path   <- function(map, ...) add_layer(map, "path", ...)

#' viz_ext
#' @export
viz_text   <- function(map, ...) add_layer(map, "text", ...)

#' viz_tile
#' @export
viz_tile   <- function(map, ...) add_layer(map, "tile", ...)


viz_base   <- function(map, ...) add_layer(map, "base", ...)
viz_simple   <- function(map, ...) add_layer(map, "simple", ...)
viz_layer   <- function(map, ...) add_layer(map, "layer", ...)

viz_label   <- function(map, ...) add_layer(map, "label", ...)


viz_symbol   <- function(map, ...) add_layer(map, "symbol", ...)


#' viz_smooth
#' @export
viz_smooth <- function(map, ...) add_layer(map, "smooth", ...)




#' viz_north
#' @export
viz_north   <- function(map, ...) add_layer(map, "north", ...)

#' viz_scalebar
#' @export
viz_scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)

#' viz_prop
#' @export
viz_prop   <- function(map, ...) add_layer(map, "prop", ...)

#' viz_choro
#' @export
viz_choro   <- function(map, ...) add_layer(map, "choro", ...)

#' viz_typo
#' @export
viz_typo   <- function(map, ...) add_layer(map, "typo", ...)

#' viz_picto
#' @export
viz_picto   <- function(map, ...) add_layer(map, "picto", ...)

#' viz_propchoro
#' @export
viz_propchoro   <- function(map, ...) add_layer(map, "propchoro", ...)

#' viz_proptypo
#' @export
viz_proptypo   <- function(map, ...) add_layer(map, "proptypo", ...)

# Effects

#' viz_shadow
#' @export
viz_shadow   <- function(map, ...) add_layer(map, "shadow", ...)

#' viz_radialGradient
#' @export
viz_radialGradient   <- function(map, ...) add_layer(map, "radialGradient", ...)

#' viz_blur
#' @export
viz_blur   <- function(map, ...) add_layer(map, "blur", ...)

#' viz_clipPath
#' @export
viz_clipPath <- function(map, ...) add_layer(map, "clipPath", ...)
