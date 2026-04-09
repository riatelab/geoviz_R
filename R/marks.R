
#' @title Add circles to the map
#' @description The \code{viz_circle} function allows to add circles on a map.
#' @name viz_circle
#' @param data object
#'   A GeoJSON FeatureCollection.
#' @param id string (optional)
#'   An identifier for the circle layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] to display a single circle.
#' @param r numeric or string (optional, default = 10)
#'   Radius of the circles, or the name of a property containing numerical values.
#' @param k numeric (optional, default = 50)
#'   Radius of the largest circle (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the circle with radius \code{k}. Useful to ensure comparability between maps.
#' @param dodge logical (optional, default = FALSE)
#'   Whether to avoid circle overlap.
#' @param iteration numeric (optional, default = 200)
#'   Number of iterations used to dodge circles.
#' @param sort string or function (optional)
#'   Field name or function used to sort circles.
#' @param descending logical (optional)
#'   Sorting order of circles.
#' @param coords string (optional, default = "geo")
#'   Use "svg" if coordinates are already expressed in the SVG coordinate system.
#' @param fill string or function (optional)
#'   Fill color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param stroke string or function (optional, default = "white")
#'   Stroke color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param tip logical or function (optional, default = FALSE)
#'   A function to display the tooltip. Use \code{TRUE} to display all fields.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#circle}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/circle-mark}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_circle(data = world, r = 5, fill = "#38896F") |>
#'   viz_render()
viz_circle   <- function(map, ...) add_layer(map, "circle", ...)

#' @title Add squares to the map
#' @description The \code{viz_square} function allows to add squares on a map.
#' @name viz_square
#' @param data object
#'   A GeoJSON FeatureCollection.
#' @param id string (optional)
#'   An identifier for the square layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] to display a single square.
#' @param dx numeric (optional, default = 0)
#'   Shift in x.
#' @param dy numeric (optional, default = 0)
#'   Shift in y.
#' @param angle numeric (optional, default = 0)
#'   Rotation angle of the square.
#' @param side numeric or string (optional, default = 20)
#'   Size of the squares, or the name of a property containing numerical values.
#' @param k numeric (optional, default = 100)
#'   Size of the largest square (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the square with size \code{k}. Useful to ensure comparability between maps.
#' @param sort string or function (optional)
#'   Field name or function used to sort squares.
#' @param descending logical (optional)
#'   Sorting order of squares.
#' @param coords string (optional, default = "geo")
#'   Use "svg" if coordinates are already expressed in the SVG coordinate system.
#' @param fill string or function (optional)
#'   Fill color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param stroke string or function (optional)
#'   Stroke color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param tip logical or function (optional, default = FALSE)
#'   A function to display the tooltip. Use \code{TRUE} to display all fields.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#square}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/square-mark}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_square(data = world, side = 10, fill = "#38896F") |>
#'   viz_render()
viz_square <- function(map, ...) add_layer(map, "square", ...)

#' @title Add spikes to the map
#' @description The \code{viz_spike} function allows to add spikes on a map.
#' @name viz_spike
#' @param data object
#'   A GeoJSON FeatureCollection.
#' @param id string (optional)
#'   An identifier for the spike layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] to display a single spike.
#' @param height numeric or string (optional, default = 10)
#'   Height of the spikes, or the name of a property containing numerical values.
#' @param width numeric (optional, default = 30)
#'   Width of the spikes.
#' @param straight numeric (optional, default = 0)
#'   A number between 0 and 1 defining the shape of the spikes (0 = curved, 1 = straight).
#' @param k numeric (optional, default = 100)
#'   Height of the highest spike (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the spike with height \code{k}. Useful to ensure comparability between maps.
#' @param sort string or function (optional)
#'   Field name or function used to sort spikes.
#' @param descending logical (optional)
#'   Sorting order of spikes.
#' @param coords string (optional, default = "geo")
#'   Use "svg" if coordinates are already expressed in the SVG coordinate system.
#' @param fill string or function (optional)
#'   Fill color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param stroke string or function (optional)
#'   Stroke color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param tip logical or function (optional, default = FALSE)
#'   A function to display the tooltip. Use \code{TRUE} to display all fields.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#spike}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/spike-mark}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_spike(data = world, height = 10, fill = "#38896F") |>
#'   viz_render()
viz_spike <- function(map, ...) add_layer(map, "spike", ...)

#' @title Add half-circles to the map
#' @description The \code{viz_halfcircle} function allows to add half-circles on a map.
#' @name viz_halfcircle
#' @param data object
#'   A GeoJSON FeatureCollection.
#' @param id string (optional)
#'   An identifier for the half-circle layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] to display a single half-circle.
#' @param dx numeric (optional, default = 0)
#'   Shift in x.
#' @param dy numeric (optional, default = 0)
#'   Shift in y.
#' @param angle numeric (optional, default = 0)
#'   Rotation angle of the half-circle.
#' @param r numeric or string (optional, default = 10)
#'   Radius of the half-circles, or the name of a property containing numerical values.
#' @param innerRadius numeric (optional, default = 10)
#'   Inner radius.
#' @param cornerRadius numeric (optional, default = 2)
#'   Corner radius.
#' @param k numeric (optional, default = 50)
#'   Radius of the largest half-circle (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the half-circle with radius \code{k}. Useful to ensure comparability between maps.
#' @param sort string or function (optional)
#'   Field name or function used to sort half-circles.
#' @param descending logical (optional)
#'   Sorting order of half-circles.
#' @param coords string (optional, default = "geo")
#'   Use "svg" if coordinates are already expressed in the SVG coordinate system.
#' @param fill string or function (optional)
#'   Fill color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param stroke string or function (optional)
#'   Stroke color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param tip logical or function (optional, default = FALSE)
#'   A function to display the tooltip. Use \code{TRUE} to display all fields.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#halfcircle}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/half-circle-mark}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_halfcircle(data = world, r = 10, fill = "#38896F") |>
#'   viz_render()
viz_halfcircle <- function(map, ...) add_layer(map, "halfcircle", ...)

#' @title Add symbols to the map
#' @description The \code{viz_symbol} function allows to add symbols on a map.
#' @name viz_symbol
#' @param data object
#'   A GeoJSON FeatureCollection.
#' @param id string (optional)
#'   An identifier for the symbol layer.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position [x, y] to display a single symbol.
#' @param fill string or function (optional)
#'   Fill color. For choropleth maps or typologies, see \code{tool.choro} and \code{tool.typo}.
#' @param stroke string or function (optional, default = "white")
#'   Stroke color.
#' @param strokeWidth string or function (optional, default = 0.2)
#'   Stroke width.
#' @param coords string (optional, default = "geo")
#'   Use "svg" if coordinates are already expressed in the SVG coordinate system.
#' @param r numeric or string (optional, default = 12)
#'   Radius to set the size of the encompassing circle of the symbol.
#' @param scale numeric (optional)
#'   Scale factor to change the size of the symbol.
#' @param symbol string (optional, default = "star")
#'   Name of the symbol to display (use \code{viz.tool.symbols()} to get the list of available symbols). If a field is used, a different symbol is assigned to each modality.
#' @param missing string (optional, default = "missing")
#'   Name of the symbol for missing values. Use \code{NULL} to remove these symbols.
#' @param rotate numeric (optional, default = 0)
#'   Rotation angle of symbols.
#' @param skewX numeric (optional, default = 0)
#'   Horizontal skew of symbols.
#' @param skewY numeric (optional, default = 0)
#'   Vertical skew of symbols.
#' @param background logical (optional, default = FALSE)
#'   Add a circle behind the symbol.
#' @param background_* parameters of the background (optional)
#'   e.g. \code{background_fill}, \code{background_stroke}, etc.
#' @param tip logical or function (optional, default = FALSE)
#'   A function to display the tooltip. Use \code{TRUE} to display all fields.
#' @param k numeric (optional, default = 50)
#'   Radius of the largest circle (or corresponding to the value defined by \code{fixmax}).
#' @param fixmax numeric (optional)
#'   Value corresponding to the circle with radius \code{k}. Useful to ensure comparability between maps.
#' @param dodge logical (optional, default = FALSE)
#'   Avoid overlap between symbols.
#' @param iteration numeric (optional, default = 200)
#'   Number of iterations used to dodge symbols.
#' @param sort string or function (optional)
#'   Field name or function used to sort symbols.
#' @param descending logical (optional)
#'   Sorting order of symbols.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#symbol}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/symbols}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_symbol(data = world, symbol = "star", r = 12, fill = "#38896F") |>
#'   viz_render()
viz_symbol <- function(map, ...) add_layer(map, "symbol", ...)
