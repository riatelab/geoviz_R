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

#' Outline
#' @export
footer   <- function(map, ...) add_layer(map, "footer", ...)


#' Path
#' @export
path   <- function(map, ...) add_layer(map, "path", ...)

#' Text
#' @export
text   <- function(map, ...) add_layer(map, "text", ...)

#' Tile
#' @export
tile   <- function(map, ...) add_layer(map, "tile", ...)


base   <- function(map, ...) add_layer(map, "base", ...)
simple   <- function(map, ...) add_layer(map, "simple", ...)
layer   <- function(map, ...) add_layer(map, "layer", ...)

label   <- function(map, ...) add_layer(map, "label", ...)
scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)
north   <- function(map, ...) add_layer(map, "north", ...)
symbol   <- function(map, ...) add_layer(map, "symbol", ...)

#' Prop
#' @export
prop   <- function(map, ...) add_layer(map, "prop", ...)

#' choro
#' @export
choro   <- function(map, ...) add_layer(map, "choro", ...)

#' typo
#' @export
typo   <- function(map, ...) add_layer(map, "typo", ...)

#' picto
#' @export
picto   <- function(map, ...) add_layer(map, "picto", ...)

#' propchoro
#' @export
propchoro   <- function(map, ...) add_layer(map, "propchoro", ...)

#' proptypo
#' @export
proptypo   <- function(map, ...) add_layer(map, "proptypo", ...)

# Effects

#' shadow
#' @export
shadow   <- function(map, ...) add_layer(map, "shadow", ...)

#' radialGradient
#' @export
radialGradient   <- function(map, ...) add_layer(map, "radialGradient", ...)

#' blur
#' @export
blur   <- function(map, ...) add_layer(map, "blur", ...)

#' clipPath
#' @export
clipPath <- function(map, ...) add_layer(map, "clipPath", ...)
