#' Graticule
#'
#' @param map a d3geoviz object create with the create() function. Use |> to chain instructions.
#' @param step step
#' @param stroke stroke
#' @param strokeDasharray strokeDasharray
#' @param ... Additional parameters. See geoviz.js documentation.
#' @return Graticule layer
#' @export
#' @examples
#' create() |>
#' graticule(step = 10, strokeDasharray = c(2, 4)) |>
#' render()
#'
graticule <- function(map, step = 10, stroke = "#9ad5e6", strokeDasharray = 2, ...) {
  add_layer(map, "graticule", step = step, stroke = stroke, strokeDasharray = strokeDasharray, ...)
}

#' Outline
#' @export
outline   <- function(map, ...) add_layer(map, "outline", ...)

#' Outline
#' @export
header   <- function(map, ...) add_layer(map, "header", ...)

#' Path
#' @export
path   <- function(map, ...) add_layer(map, "path", ...)

#' Text
#' @export
text   <- function(map, ...) add_layer(map, "text", ...)

base   <- function(map, ...) add_layer(map, "base", ...)
simple   <- function(map, ...) add_layer(map, "simple", ...)
layer   <- function(map, ...) add_layer(map, "layer", ...)
tile   <- function(map, ...) add_layer(map, "tile", ...)
label   <- function(map, ...) add_layer(map, "label", ...)
footer   <- function(map, ...) add_layer(map, "footer", ...)
scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)
north   <- function(map, ...) add_layer(map, "north", ...)

#' Prop
#' @export
prop   <- function(map, ...) add_layer(map, "prop", ...)

choro   <- function(map, ...) add_layer(map, "choro", ...)
typo   <- function(map, ...) add_layer(map, "typo", ...)
symbol   <- function(map, ...) add_layer(map, "symbol", ...)
propchoro   <- function(map, ...) add_layer(map, "propchoro", ...)
proptypo   <- function(map, ...) add_layer(map, "proptypo", ...)

# Effects
shadow   <- function(map, ...) add_layer(map, "shadow", ...)
clipPath <- function(map, ...) add_layer(map, "clipPath", ...)
