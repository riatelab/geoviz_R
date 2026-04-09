#' @title viz_leg_box
#' @export
#'
viz_leg_box   <- function(map, ...) add_layer(map, "leg_box", ...)

#' @title viz_leg_typo_vertical
#' @export
#'
viz_leg_typo_vertical   <- function(map, ...) add_layer(map, "leg_typo_vertical", ...)


#' @title viz_leg_typo_horizontal
#' @export
#'
viz_leg_typo_horizontal   <- function(map, ...) add_layer(map, "leg_typo_horizontal", ...)

#' @title viz_leg_choro_vertical
#' @export
#'
viz_leg_choro_vertical   <- function(map, ...) add_layer(map, "leg_choro_vertical", ...)

#' @title viz_leg_choro_horizontal
#' @export
#'
viz_leg_choro_horizontal   <- function(map, ...) add_layer(map, "leg_choro_horizontal", ...)

#' @title viz_leg_gradient_vertical
#' @export
#'
viz_leg_gradient_vertical   <- function(map, ...) add_layer(map, "leg_gradient_vertical", ...)

#' @title viz_leg_spikes
#' @export
#'
viz_leg_spikes   <- function(map, ...) add_layer(map, "leg_spikes", ...)

#' @title Add a proportional circles legend to the map
#' @description The \code{viz_leg_circles} function allows to add a legend for proportional circles.
#'   The function creates a legend layer in the SVG container.
#' @name viz_leg_circles
#' @param id string (optional)
#'   An identifier for the legend layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] of the legend.
#' @param gap numeric (optional, default = 2)
#'   Gap between elements.
#'
#' @param data numeric vector
#'   Input values used to build the legend.
#' @param k numeric (optional, default = 50)
#'   Radius of the largest circle (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the circle with radius \code{k}. Useful to ensure comparability between maps.
#' @param nb numeric (optional, default = 4)
#'   Number of circles.
#'
#' @param circle_fill string (optional, default = "none")
#'   Fill color of circles.
#' @param circle_stroke string (optional, default = "#363636")
#'   Stroke color of circles.
#' @param circle_spacing numeric (optional, default = 5)
#'   Spacing between circles.
#' @param circle_* additional parameters (optional)
#'   Additional SVG attributes applied to circles.
#'
#' @param line_stroke string (optional, default = "#363636")
#'   Stroke color of lines.
#' @param line_strokeDasharray string (optional, default = "1")
#'   Stroke dash pattern.
#' @param line_strokeWidth numeric (optional, default = 0.7)
#'   Stroke width.
#' @param line_length numeric (optional, default = 10)
#'   Length of the lines.
#' @param line_* additional parameters (optional)
#'   Additional SVG attributes applied to lines.
#'
#' @param values_textAnchor string (optional, default = "start")
#'   Text anchor for values.
#' @param values_dx numeric (optional, default = 0)
#'   Horizontal offset for values.
#' @param values_dy numeric (optional, default = 5)
#'   Vertical offset for values.
#' @param values_fill string (optional, default = "#363636")
#'   Text color.
#' @param values_fontSize numeric (optional, default = 10)
#'   Font size.
#' @param values_factor numeric (optional, default = 1)
#'   Multiplication factor applied to values (e.g. 0.001 for thousands).
#' @param values_decimal string (optional, default = ".")
#'   Decimal separator.
#' @param values_thousands string (optional, default = " ")
#'   Thousands separator.
#'
#' @param title string (optional, default = "Legend")
#'   Legend title.
#' @param title_fill string (optional, default = "#363636")
#'   Title color.
#' @param title_fontSize numeric (optional, default = 16)
#'   Title font size.
#' @param title_* additional parameters (optional)
#'   Additional SVG attributes applied to the title.
#'
#' @param subtitle string (optional)
#'   Legend subtitle.
#' @param subtitle_fill string (optional, default = "#363636")
#'   Subtitle color.
#' @param subtitle_fontSize numeric (optional, default = 12)
#'   Subtitle font size.
#' @param subtitle_* additional parameters (optional)
#'   Additional SVG attributes applied to the subtitle.
#'
#' @param note string (optional)
#'   Note displayed above the legend.
#' @param note_fill string (optional, default = "#363636")
#'   Note color.
#' @param note_fontSize numeric (optional, default = 10)
#'   Note font size.
#' @param note_* additional parameters (optional)
#'   Additional SVG attributes applied to the note.
#'
#' @param frame logical (optional, default = FALSE)
#'   Whether to display a frame around the legend.
#' @param frame_margin numeric (optional, default = 15)
#'   Frame margin.
#' @param frame_fill string (optional, default = "white")
#'   Frame fill color.
#' @param frame_stroke string (optional, default = "black")
#'   Frame stroke color.
#' @param frame_fillOpacity numeric (optional, default = 0.5)
#'   Frame fill opacity.
#' @param frame_* additional parameters (optional)
#'   Additional SVG attributes applied to the frame.
#'
#' @param text_* additional parameters (optional)
#'   SVG attributes applied to all text elements of the legend.
#'
#' @return The identifier of the created legend layer.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_leg_circles(data = c(10, 50, 100, 500), k = 50) |>
#'   viz_render()
viz_leg_circles <- function(map, ...) add_layer(map, "leg_circles", ...)

#' @title viz_leg_circles_nested
#' @export
#'
viz_leg_circles_nested   <- function(map, ...) add_layer(map, "leg_circles_nested", ...)

#' @title viz_leg_squares
#' @export
#'
viz_leg_squares   <- function(map, ...) add_layer(map, "leg_squares", ...)

#' @title viz_leg_squares_nested
#' @export
#'
viz_leg_squares_nested   <- function(map, ...) add_layer(map, "leg_squares_nested", ...)


#' @title viz_leg_mushrooms
#' @export
#'
viz_leg_mushrooms   <- function(map, ...) add_layer(map, "leg_mushrooms", ...)

#' @title viz_leg_symbol_vertical
#' @export
#'
viz_leg_symbol_vertical   <- function(map, ...) add_layer(map, "leg_symbol_vertical", ...)

#' @title viz_leg_symbol_horizontal
#' @export
#'
viz_leg_symbol_horizontal   <- function(map, ...) add_layer(map, "leg_symbol_horizontal", ...)
