
#' @title Add proportional symbols to the map
#' @description The \code{viz_prop} function allows to create proportional symbols based on a numeric variable in a GeoJSON layer.
#'   It supports multiple mark types such as circles, squares, spikes, and half-circles.
#' @name viz_prop
#' @param data object
#'   A spatial dataframe.
#' @param var string
#'   Name of the numeric variable in the spatial dataframe to use for symbol sizing.
#' @param symbol string (optional, default = "circle")
#'   Choice of the mark to plot: "circle", "square", "spike", or "halfcircle".
#' @param k numeric (optional, default = 50)
#'   Size of the largest symbol.
#' @param fixmax numeric (optional)
#'   Value corresponding to the symbol with size = \code{k}. Useful to ensure comparability between maps.
#' @param width numeric (optional, default = 30)
#'   Width of the spikes (only relevant if \code{symbol = "spike"}).
#' @param straight numeric (optional, default = 0)
#'   A number between 0 and 1 defining the curve of the spikes (0 = curved, 1 = straight).
#' @param dodge logical (optional, default = FALSE)
#'   Whether to avoid symbol overlap (relevant only for circles).
#' @param legend logical (optional, default = TRUE)
#'   Whether to display a legend for the proportional symbols.
#' @param leg_type string (optional, default = "nested")
#'   Legend style: "nested" or "separate".
#' @param leg_pos numeric vector of length 2 (optional, default = c(10, 10))
#'   Position of the legend [x, y].
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#prop}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/proportional-symbols}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_prop(data = world, var = "pop", symbol = "circle", fill = "#38896F") |>
#'   viz_render()
viz_prop <- function(map, ...) add_layer(map, "prop", ...)

#' @title Add a choropleth layer to the map
#' @description The \code{viz_choro} function allows to create choropleth maps based on a numeric variable in a GeoJSON layer.
#'   You can use built-in classification methods or define breaks manually.
#' @name viz_choro
#' @param data object
#'   A spatial dataframe. Use \code{data} to be able to iterate over features.
#' @param var string
#'   Name of the numeric variable in the spatial dataframe to use for the choropleth. You can also use the \code{fill} or \code{stroke} argument directly.
#' @param method string (optional, default = "quantile")
#'   Classification method: 'quantile', 'q6', 'equal', 'jenks', 'msd', 'geometric', 'headtail', 'pretty', 'arithmetic', or 'nestedmeans'.
#' @param nb numeric (optional, default = 6)
#'   Number of classes.
#' @param breaks numeric vector (optional)
#'   Specific class breaks. If provided, \code{nb} and \code{method} are ignored.
#' @param colors string or vector (optional)
#'   Array of colors or name of a color palette available in \code{dicopal}. Examples: "ArmyRose", "Earth", "Fall", "Geyser", "TealRose", "Temps", "Tropic", "BluGrn", "BluYl", "BrwnYl", "BurgYl", "Burg", "DarkMint", "Emrld", "Magenta", "Mint", "OrYel", "Peach", "PinkYl", "PurpOr".
#' @param reverse logical (optional, default = FALSE)
#'   Reverse the color palette.
#' @param missing string or logical (optional, default = "white")
#'   Color for missing data. Use \code{FALSE} to omit.
#' @param legend logical (optional, default = TRUE)
#'   Whether to display a legend for the choropleth.
#' @param leg_type string (optional, default = "vertical")
#'   Legend orientation: "horizontal" or "vertical".
#' @param leg_pos numeric vector of length 2 (optional, default = c(10, 10))
#'   Position of the legend [x, y].
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#plot/choro}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/choropleth}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_choro(data = world, var = "gdppc", method = "quantile", nb = 5, colors = "PinkYl") |>
#'   viz_render()
viz_choro <- function(map, ...) add_layer(map, "choro", ...)

#' @title Add a typology layer to the map
#' @description The \code{viz_typo} function allows to create categorical (typology) maps based on a variable in a GeoJSON layer.
#'   Colors are assigned to categories, and a legend can be displayed.
#' @name viz_typo
#' @param data object
#'   A spatial dataframe Use \code{data} to be able to iterate over features.
#' @param var string
#'   Name of the variable in the spatial dataframe to use for the typology. You can also use the \code{fill} or \code{stroke} argument directly.
#' @param colors string or vector (optional)
#'   Array of colors or name of a color palette available in \code{dicopal}. Examples: "Antique", "Bold", "Pastel", "Prism", "Safe", "Vivid", "Accent", "Dark2", "Paired", "Pastel1", "Pastel2", "Set1", "Set2", "Set3".
#' @param order vector (optional)
#'   Array of qualitative values to define the order in the legend.
#' @param alphabetical logical (optional, default = TRUE)
#'   Whether to order the items in the legend alphabetically.
#' @param missing string or logical (optional, default = "white")
#'   Color for missing data. Use \code{FALSE} to omit.
#' @param legend logical (optional, default = TRUE)
#'   Whether to display a legend for the typology.
#' @param leg_type string (optional, default = "vertical")
#'   Legend orientation: "horizontal" or "vertical".
#' @param leg_pos numeric vector of length 2 (optional, default = c(10, 10))
#'   Position of the legend [x, y].
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#plot/#plot/typo}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/typo}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_typo(data = world, var = "region", colors = "Pastel") |>
#'   viz_render()
viz_typo <- function(map, ...) add_layer(map, "typo", ...)


#' @title Add proportional colored symbols to the map
#' @description The \code{viz_propchoro} function allows to create maps combining proportional symbols and choropleth coloring.
#'   Symbols represent absolute values while colors represent relative values.
#'   The input data must be a spatial dataframe.
#' @name viz_propchoro
#' @param data object
#'   A spatial dataframe. Use \code{data} to be able to iterate over features.
#' @param var1 string
#'   Name of the variable containing absolute quantitative values (used for symbol size).
#' @param var2 string
#'   Name of the variable containing relative quantitative values (used for color, e.g. percentages).
#' @param var string (optional)
#'   If set, the same variable is mapped twice (size and color).
#' @param symbol string (optional, default = "circle")
#'   Choice of the mark to plot: "circle", "spike", or "halfcircle".
#' @param k numeric (optional, default = 50)
#'   Size of the largest symbol.
#' @param fixmax numeric (optional)
#'   Value corresponding to the symbol with size = \code{k}. Useful to ensure comparability between maps.
#' @param dodge logical (optional, default = FALSE)
#'   Whether to avoid symbol overlap (relevant only for circles).
#' @param width numeric (optional, default = 30)
#'   Width of the spikes (only relevant if \code{symbol = "spike"}).
#' @param straight numeric (optional, default = 0)
#'   A number between 0 and 1 defining the curve of the spikes (0 = curved, 1 = straight).
#' @param method string (optional, default = "quantile")
#'   Classification method: 'quantile', 'q6', 'equal', 'jenks', 'msd', 'geometric', 'headtail', 'pretty', 'arithmetic', or 'nestedmeans'.
#' @param nb numeric (optional, default = 6)
#'   Number of classes.
#' @param breaks numeric vector (optional)
#'   Specific class breaks. If provided, \code{nb} and \code{method} are ignored.
#' @param colors string or vector (optional)
#'   Array of colors or name of a color palette available in \code{dicopal}.
#' @param reverse logical (optional, default = FALSE)
#'   Reverse the color palette.
#' @param missing string or logical (optional, default = "white")
#'   Color for missing data. Use \code{FALSE} to omit.
#' @param ... additional parameters (optional)
#'   Additional graphical parameters (e.g. \code{strokeWidth = 0.3}).
#' @param legend logical (optional, default = TRUE)
#'   Whether to display legends.
#' @param leg1_type string (optional, default = "nested")
#'   Style of the proportional symbol legend: "nested" or "separate".
#' @param leg2_type string (optional, default = "vertical")
#'   Style of the color legend: "vertical" or "horizontal".
#' @param leg1_pos numeric vector of length 2 (optional, default = c(10, 10))
#'   Position of the proportional symbol legend [x, y].
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#plot/propchoro}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/prop}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'  viz_path(data = world, fill = "#f1f3f5") |>
#'  viz_propchoro(data = world, var1 = "pop", var2 = "gdppc",
#'                 symbol = "circle", k = 50, colors = "Temps") |>
#'  viz_render()
viz_propchoro <- function(map, ...) add_layer(map, "propchoro", ...)

#' @title Add proportional symbols with typology colors to the map
#' @description The \code{viz_proptypo} function allows to create maps combining proportional symbols and categorical coloring.
#'   Symbols represent absolute values while colors represent categories.
#'   The input data must be a spatial dataframe.
#' @name viz_proptypo
#' @param data object
#'   A spatial dataframe. Use \code{data} to be able to iterate over features.
#' @param var1 string
#'   Name of the variable containing absolute quantitative values (used for symbol size).
#' @param var2 string
#'   Name of the variable containing qualitative values (used for color categories).
#' @param var string (optional)
#'   If set, the same variable is mapped twice (size and color).
#' @param symbol string (optional, default = "circle")
#'   Choice of the mark to plot: "circle", "spike", or "halfcircle".
#' @param k numeric (optional, default = 50)
#'   Size of the largest symbol.
#' @param fixmax numeric (optional)
#'   Value corresponding to the symbol with size = \code{k}. Useful to ensure comparability between maps.
#' @param dodge logical (optional, default = FALSE)
#'   Whether to avoid symbol overlap (relevant only for circles).
#' @param width numeric (optional, default = 30)
#'   Width of the spikes (only relevant if \code{symbol = "spike"}).
#' @param straight numeric (optional, default = 0)
#'   A number between 0 and 1 defining the curve of the spikes (0 = curved, 1 = straight).
#' @param colors string or vector (optional)
#'   Array of colors or name of a color palette available in \code{dicopal}.
#' @param order vector (optional)
#'   Array of qualitative values to define the order of categories.
#' @param alphabetical logical (optional, default = TRUE)
#'   Whether to order categories alphabetically in the legend.
#' @param missing string or logical (optional, default = "white")
#'   Color for missing data. Use \code{FALSE} to omit.
#' @param ... additional parameters (optional)
#'   Additional graphical parameters (e.g. \code{strokeWidth = 0.3}).
#' @param legend logical (optional, default = TRUE)
#'   Whether to display legends.
#' @param leg1_type string (optional, default = "nested")
#'   Style of the proportional symbol legend: "nested" or "separate".
#' @param leg2_type string (optional, default = "vertical")
#'   Style of the categorical legend: "vertical" or "horizontal".
#' @param leg1_pos numeric vector of length 2 (optional, default = c(10, 10))
#'   Position of the proportional symbol legend [x, y].
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#plot/proptypo}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/prop}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_proptypo(data = world, var1 = "pop", var2 = "region",
#'                symbol = "square", k = 50, colors = "Set3") |>
#'   viz_render()
viz_proptypo <- function(map, ...) add_layer(map, "proptypo", ...)


#' viz_picto
#' @export
viz_picto   <- function(map, ...) add_layer(map, "picto", ...)
