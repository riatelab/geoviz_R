#' @title Grid-based proportional symbols layer
#' @description The \code{viz_gridprop} function builds a proportional symbol map
#' aggregated on a spatial grid. It first generates a grid from the input spatial
#' data frame, then displays aggregated values within each cell using proportional symbols.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data A spatial dataframe Use \code{data} to enable iteration over features.
#' @param var character. Name of the numeric variable used for aggregation and symbol scaling.
#' @param grid character. Optional. Type of grid used for aggregation (default "square").
#' One of: "square", "dot", "diamond", "hexbin", "hex", "triangle",
#' "arbitrary", "random", "h3", "h3geo", "hexgeo", "hexbingeo", "square_sph".
#' @param step numeric. Optional. Grid resolution (default 15).
#' @param level numeric. Optional. Subdivision level for hierarchical grids (default 1).
#' @param coords character. Optional. Coordinate system (default "geo").
#' One of: "geo", "svg".
#' @param missing character. Optional. Color for missing values (default "white").
#' @param symbol character. Optional. Symbol type (default "circle").
#' One of: "circle", "square", "spike", "halfcircle".
#' @param k numeric. Optional. Size of the largest symbol (default 10).
#' @param width numeric. Optional. Width of spike symbols (default 30).
#' @param straight numeric. Optional. Curvature of spike symbols (default 0).
#' Value between 0 (curved) and 1 (straight).
#' @param fixmax numeric. Optional. Maximum value for symbol scaling. Useful for map comparability.
#' @param legend logical. Optional. Whether to display legend (default TRUE).
#' @param leg_type character. Optional. Legend type (default "separate").
#' One of: "nested", "separate".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param leg_title character. Optional. Legend title (default \code{var}).
#' @param ... Additional parameters passed to choropleth rendering (same as \code{viz_choro})
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' cities <- st_read(
#'   system.file("gpkg/cities.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth") |>
#' viz_path(datum = world, fill = "#f1f3f5") |>
#' viz_gridprop(data = cities, var = "population") |>
#' viz_render()
viz_gridprop <- function(
    map,
    data = NULL,
    var,
    grid = "square",
    step = 15,
    level = 1,
    coords = "geo",
    missing = "white",
    symbol = "circle",
    k = 10,
    width = 30,
    straight = 0,
    fixmax = NULL,
    legend = TRUE,
    leg_type = "separate",
    leg_pos = c(10, 10),
    leg_title = NULL,
    ...
) {
  add_layer(
    map,
    "gridprop",
    data = data,
    var = var,
    grid = grid,
    step = step,
    level = level,
    coords = coords,
    missing = missing,
    symbol = symbol,
    k = k,
    width = width,
    straight = straight,
    fixmax = fixmax,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    leg_title = leg_title,
    ...
  )
}

#' @title Grid-based choropleth layer
#' @description The \code{gridchoro} function builds a choropleth map based on a
#' spatial grid aggregation. It first generates a grid from the input spatial data frame,
#' aggregates values within each cell, and maps them using a color classification.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data A spatial dataframe Use \code{data} to enable iteration over features.
#' @param var character or character vector. Variable(s) used for aggregation.
#' If two variables are provided, a ratio is computed.
#' @param grid character. Optional. Type of grid used for aggregation (default "square").
#' One of: "square", "dot", "diamond", "hexbin", "hex", "triangle",
#' "arbitrary", "random", "h3", "h3geo", "hexgeo", "hexbingeo", "square_sph".
#' @param step numeric. Optional. Grid resolution (default 15).
#' @param level numeric. Optional. Subdivision level for hierarchical grids (default 1).
#' @param ratio_factor numeric. Optional. Multiplication factor applied to ratio values (default 1).
#' @param coords character. Optional. Coordinate system (default "geo").
#' One of: "geo", "svg".
#' @param missing character. Optional. Fill color for missing values (default "white").
#' @param fixmax numeric. Optional. Maximum value for color scaling. Useful for map comparability.
#' @param legend logical. Optional. Whether to display legend (default TRUE).
#' @param leg_type character. Optional. Legend type (default "vertical").
#' One of: "horizontal", "vertical".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional parameters passed to choropleth rendering (same as \code{viz_choro})
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' cities <- st_read(
#'   system.file("gpkg/cities.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth") |>
#' viz_path(datum = world, fill = "#f1f3f5") |>
#' viz_gridchoro(data = cities, var = "population") |>
#' viz_render()
viz_gridchoro <- function(
    map,
    data = NULL,
    var,
    grid = "square",
    step = 15,
    level = 1,
    ratio_factor = 1,
    coords = "geo",
    missing = "white",
    fixmax = NULL,
    legend = TRUE,
    leg_type = "vertical",
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "gridchoro",
    data = data,
    var = var,
    grid = grid,
    step = step,
    level = level,
    ratio_factor = ratio_factor,
    coords = coords,
    missing = missing,
    fixmax = fixmax,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    ...
  )
}

#' @title Smoothed density (isobands) layer
#' @description The \code{viz_smooth} function creates smoothed density contours
#' (isobands) from a set of spatial points. It is a wrapper around contour-based
#' density estimation, with styling optimized for smooth thematic visualizations.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data A spatial dataframe Use \code{data} to enable iteration over features.
#' @param var character or numeric. Optional. Variable used to weight points.
#' @param id character. Optional. Layer identifier.
#' @param nb numeric. Optional. Number of sampled points used for density estimation (default 100000).
#' @param bandwidth numeric. Optional. Bandwidth used for density computation.
#' @param fixbandwidth logical. Optional. Whether to scale bandwidth by zoom factor (default FALSE).
#' @param thresholds numeric. Optional. Number of contour levels.
#' @param cellSize numeric. Optional. Grid cell size for density computation.
#' @param stroke character. Optional. Stroke color (default "white").
#' @param strokeOpacity numeric. Optional. Stroke opacity (default 0.8).
#' @param strokeWidth numeric. Optional. Stroke width (default 0.3).
#' @param shadow logical. Optional. Whether to add a shadow filter (default TRUE).
#' @param fill character or function. Optional. Single fill color (used if \code{colors} is not defined).
#' @param colors character. Optional. Name of a Dicopal sequential palette (default "RdPu").
#' See https://observablehq.com/@neocartocnrs/dicopal-library.
#' @param opacity numeric. Optional. Global opacity.
#' @param fillOpacity numeric. Optional. Fill opacity for polygons (default 0.6).
#' @param tip logical or function. Optional. Tooltip function; if TRUE displays all properties.
#' @param tipstyle list. Optional. Custom tooltip styling.
#' @param coords character. Optional. Coordinate system (default "geo").
#' One of: "geo", "svg".
#' @param legend logical. Optional. Whether to display legend (default TRUE).
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' cities <- st_read(
#'   system.file("gpkg/cities.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth") |>
#' viz_path(datum = world, fill = "#f1f3f5") |>
#' viz_smooth(data = cities, var = "population") |>
#' viz_render()
viz_smooth <- function(
    map,
    data = NULL,
    var = NULL,
    id = NULL,
    nb = 100000,
    bandwidth = NULL,
    fixbandwidth = FALSE,
    thresholds = NULL,
    cellSize = NULL,
    stroke = "white",
    strokeOpacity = 0.8,
    strokeWidth = 0.3,
    shadow = TRUE,
    fill = NULL,
    colors = "RdPu",
    opacity = NULL,
    fillOpacity = 0.6,
    tip = NULL,
    tipstyle = NULL,
    coords = "geo",
    legend = TRUE,
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "smooth",
    data = data,
    var = var,
    id = id,
    nb = nb,
    bandwidth = bandwidth,
    fixbandwidth = fixbandwidth,
    thresholds = thresholds,
    cellSize = cellSize,
    stroke = stroke,
    strokeOpacity = strokeOpacity,
    strokeWidth = strokeWidth,
    shadow = shadow,
    fill = fill,
    colors = colors,
    opacity = opacity,
    fillOpacity = fillOpacity,
    tip = tip,
    tipstyle = tipstyle,
    coords = coords,
    legend = legend,
    leg_pos = leg_pos,
    ...
  )
}

#' @title Dot density layer
#' @description The \code{viz_dotdensity} function creates a dot density map by
#' distributing points proportionally to a numeric variable. Each dot represents
#' a fixed quantity of the underlying data.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data A spatial dataframe Use \code{data} to enable iteration over features.
#' @param var character. Name of the numeric variable used to generate dot density values.
#' @param stroke character. Optional. Stroke color for dots (default "none").
#' @param r numeric. Optional. Radius of each dot (default 1).
#' @param dotval numeric. Optional. Value represented by a single dot. If not provided,
#' it is computed automatically.
#' @param fill character. Optional. Fill color of dots (default "black").
#' @param legend logical. Optional. Whether to display legend (default TRUE).
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, svg.height - 10)).
#' @param leg_text character. Optional. Legend text (default dot value).
#' @param ... Additional parameters passed to rendering or SVG container options.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' cities <- st_read(
#'   system.file("gpkg/cities.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth") |>
#' viz_path(datum = world, fill = "#f1f3f5") |>
#' viz_dotdensity(data = cities, var = "population") |>
#' viz_render()
viz_dotdensity <- function(
    map,
    data = NULL,
    var,
    stroke = "none",
    r = 1,
    dotval = NULL,
    fill = "black",
    legend = TRUE,
    leg_pos = NULL,
    leg_text = NULL,
    ...
) {
  add_layer(
    map,
    "dotdensity",
    data = data,
    var = var,
    stroke = stroke,
    r = r,
    dotval = dotval,
    fill = fill,
    legend = legend,
    leg_pos = leg_pos,
    leg_text = leg_text,
    ...
  )
}
