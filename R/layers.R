#' viz_graticule
#'
#' @param map a geoviz object create with the create() function. Use |> to chain instructions.
#' @param step step
#' @param stroke stroke
#' @param strokeDasharray strokeDasharray
#' @param ... Additional parameters. See geoviz.js documentation.
#' @return Graticule layer
#' @export
#' @examples
#' viz_create() |>
#' viz_graticule(step = 10, strokeDasharray = c(2, 4)) |>
#' viz_render()
#'
viz_graticule <- function(map, step = 10, stroke = "#9ad5e6", strokeDasharray = 2, ...) {
  add_layer(map, "graticule", step = step, stroke = stroke, strokeDasharray = strokeDasharray, ...)
}

#' viz_outline
#' @export
viz_outline   <- function(map, ...) add_layer(map, "outline", ...)

#' viz_header
#' @export
viz_header   <- function(map, ...) add_layer(map, "header", ...)

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
viz_scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)
viz_north   <- function(map, ...) add_layer(map, "north", ...)
viz_symbol   <- function(map, ...) add_layer(map, "symbol", ...)

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
