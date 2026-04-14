#' @title Proportional symbols layer
#' @description The \code{viz_prop} function creates a proportional symbol layer
#' from a spatial data frame. It can display different symbol types (circle, square,
#' spike, half-circle) sized according to a numeric variable, and optionally includes
#' a legend.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame.
#' @param var character. Variable name containing numeric values used for scaling symbols.
#' @param symbol character. Optional. Symbol type (default "circle").
#' One of: "circle", "square", "spike", "halfcircle".
#' @param k numeric. Optional. Size of the largest symbol (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the symbol of size \code{k}.
#' Useful to ensure comparability between maps.
#' @param width numeric. Optional. Width of spike symbols (default 30).
#' @param straight numeric. Optional. Curvature of spike symbols (default 0).
#' Value between 0 (curved) and 1 (straight).
#' @param dodge logical. Optional. Avoid symbol overlap (default FALSE, circle only).
#' @param legend logical. Optional. Whether to display a legend (default TRUE).
#' @param leg_type character. Optional. Legend type (default "nested").
#' One of: "nested", "separate".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional parameters passed to symbol rendering (e.g. \code{strokeWidth})
#' @param leg_* additional legend parameters. Optional. All arguments prefixed with \code{leg_}
#' are forwarded to legend functions (e.g. \code{leg_missing_text}, \code{leg_values_fill}).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_prop(data = world, var = "pop", symbol = "circle", fill = "#38896F") |>
#'   viz_render()
viz_prop <- function(
    map,
    data = NULL,
    var,
    symbol = "circle",
    k = 50,
    fixmax = NULL,
    width = 30,
    straight = 0,
    dodge = FALSE,
    legend = TRUE,
    leg_type = "nested",
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "prop",
    data = data,
    var = var,
    symbol = symbol,
    k = k,
    fixmax = fixmax,
    width = width,
    straight = straight,
    dodge = dodge,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    ...
  )
}


#' @title Choropleth layer
#' @description The \code{viz_choro} function creates a choropleth map from a spatial
#' data frame by classifying a numeric variable and mapping it to a color palette.
#' It supports multiple classification methods and automatic legend generation.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration over features.
#' @param var character. Name of the numeric variable used for classification.
#' You can also use \code{fill} or \code{stroke} directly instead of \code{var}.
#' @param method character. Optional. Classification method (default "quantile").
#' One of: "quantile", "q6", "equal", "jenks", "msd", "geometric", "headtail",
#' "pretty", "arithmetic", "nestedmeans".
#' @param nb numeric. Optional. Number of classes (default 6).
#' @param breaks numeric vector. Optional. Manual class breaks. Overrides \code{nb} and \code{method}.
#' @param colors character or vector. Optional. Color palette or vector of colors.
#' Can use named palettes from the Dicopal library. See https://observablehq.com/@neocartocnrs/dicopal-library
#' @param reverse logical. Optional. Reverse color palette (default FALSE).
#' @param missing character or logical. Optional. Color for missing values (default "white").
#' @param legend logical. Optional. Whether to display a legend (default TRUE).
#' @param leg_type character. Optional. Legend orientation (default "vertical").
#' One of: "horizontal", "vertical".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional parameters passed to path rendering.
#' @param leg_* additional legend parameters. Optional. All arguments prefixed with \code{leg_}
#' are forwarded to choropleth legend functions (e.g. \code{leg_missing_text}, \code{leg_values_fill}).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_choro(data = world, var = "gdppc", method = "quantile", nb = 5, colors = "PinkYl") |>
#'   viz_render()
viz_choro <- function(
    map,
    data = NULL,
    var,
    method = "quantile",
    nb = 6,
    breaks = NULL,
    colors = NULL,
    reverse = FALSE,
    missing = "white",
    legend = TRUE,
    leg_type = "vertical",
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "choro",
    data = data,
    var = var,
    method = method,
    nb = nb,
    breaks = breaks,
    colors = colors,
    reverse = reverse,
    missing = missing,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    ...
  )
}

#' @title Typology layer
#' @description The \code{viz_typo} function creates a typology map from a spatial
#' data frame by mapping categorical variables to colors. It supports custom ordering,
#' color palettes, and automatic legend generation.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration over features.
#' @param var character. Name of the categorical variable used for styling.
#' You can also use \code{fill} or \code{stroke} directly instead of \code{var}.
#' @param colors character or vector. Optional. Color palette or vector of colors.
#' Can use named palettes from the Dicopal library (e.g. "Antique", "Bold", "Pastel",
#' "Prism", "Safe", "Vivid", "Accent", "Dark2", "Paired", "Pastel1", "Pastel2",
#' "Set1", "Set2", "Set3"). See https://observablehq.com/@neocartocnrs/dicopal-library
#' @param order character vector. Optional. Explicit ordering of categories.
#' @param alphabetical logical. Optional. Whether to sort legend items alphabetically
#' (default TRUE).
#' @param missing character or logical. Optional. Color for missing values (default "white").
#' @param legend logical. Optional. Whether to display a legend (default TRUE).
#' @param leg_type character. Optional. Legend orientation (default "vertical").
#' One of: "horizontal", "vertical".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional parameters passed to path rendering or typology utilities
#' @param leg_* additional legend parameters. Optional. All arguments prefixed with \code{leg_}
#' are forwarded to typology legend functions (e.g. \code{leg_missing_text}, \code{leg_values_fill}).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_typo(data = world, var = "region", colors = "Pastel") |>
#'   viz_render()
viz_typo <- function(
    map,
    data = NULL,
    var,
    colors = NULL,
    order = NULL,
    alphabetical = TRUE,
    missing = "white",
    legend = TRUE,
    leg_type = "vertical",
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "typo",
    data = data,
    var = var,
    colors = colors,
    order = order,
    alphabetical = alphabetical,
    missing = missing,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    ...
  )
}

#' @title Proportional + choropleth combined layer
#' @description The \code{viz_propchoro} function combines proportional symbols and
#' choropleth mapping on the same spatial data frame. It allows simultaneous encoding
#' of two numeric variables using symbols (size) and colors (classification).
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration over features.
#' @param var1 character. Name of the numeric variable used for absolute values
#' (driving symbol size).
#' @param var2 character. Name of the numeric variable used for relative values
#' (driving color classification, e.g. percentages).
#' @param var character. Optional. If provided, the same variable is used for both
#' size and color encoding.
#' @param symbol character. Optional. Symbol type (default "circle").
#' One of: "circle", "spike", "halfcircle".
#' @param k numeric. Optional. Size of the largest symbol (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the symbol of size \code{k}.
#' Useful for ensuring comparability between maps.
#' @param dodge logical. Optional. Avoid symbol overlap (default FALSE, circle only).
#' @param width numeric. Optional. Width of spike symbols (default 30).
#' @param straight numeric. Optional. Curvature of spike symbols (default 0).
#' Value between 0 (curved) and 1 (straight).
#' @param method character. Optional. Classification method for choropleth (default "quantile").
#' One of: "quantile", "q6", "equal", "jenks", "msd", "geometric", "headtail",
#' "pretty", "arithmetic", "nestedmeans".
#' @param nb numeric. Optional. Number of classes (default 6).
#' @param breaks numeric vector. Optional. Manual class breaks overriding \code{nb} and \code{method}.
#' @param colors character or vector. Optional. Color palette or vector of colors
#' from the Dicopal library. See https://observablehq.com/@neocartocnrs/dicopal-library
#' @param reverse logical. Optional. Reverse color palette (default FALSE).
#' @param missing character or logical. Optional. Color for missing values (default "white").
#' @param legend logical. Optional. Whether to display legends (default TRUE).
#' @param leg1_type character. Optional. Symbol legend type (default "nested").
#' @param leg2_type character. Optional. Choropleth legend type (default "vertical").
#' @param leg1_pos numeric vector. Optional. Position of symbol legend (default c(10, 10)).
#' @param leg2_pos numeric vector. Optional. Position of choropleth legend (default c(10, 10)).
#' @param ... Additional parameters passed to rendering functions (e.g. \code{strokeWidth}).
#' @param leg1_* additional legend parameters. Optional. Arguments prefixed with \code{leg1_}
#' are forwarded to symbol legend functions (e.g. \code{leg1_missing_text}, \code{leg1_values_fill}).
#' @param leg2_* additional legend parameters. Optional. Arguments prefixed with \code{leg2_}
#' are forwarded to choropleth legend functions (e.g. \code{leg2_missing_text}, \code{leg2_values_fill}).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'  viz_path(data = world, fill = "#f1f3f5") |>
#'  viz_propchoro(data = world, var1 = "pop", var2 = "gdppc",
#'                 symbol = "circle", k = 50, colors = "Temps") |>
#'  viz_render()

viz_propchoro <- function(
    map,
    data = NULL,
    var1,
    var2,
    var = NULL,
    symbol = "circle",
    k = 50,
    fixmax = NULL,
    dodge = FALSE,
    width = 30,
    straight = 0,
    method = "quantile",
    nb = 6,
    breaks = NULL,
    colors = NULL,
    reverse = FALSE,
    missing = "white",
    legend = TRUE,
    leg1_type = "nested",
    leg2_type = "vertical",
    leg1_pos = c(10, 10),
    leg2_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "propchoro",
    data = data,
    var1 = var1,
    var2 = var2,
    var = var,
    symbol = symbol,
    k = k,
    fixmax = fixmax,
    dodge = dodge,
    width = width,
    straight = straight,
    method = method,
    nb = nb,
    breaks = breaks,
    colors = colors,
    reverse = reverse,
    missing = missing,
    legend = legend,
    leg1_type = leg1_type,
    leg2_type = leg2_type,
    leg1_pos = leg1_pos,
    leg2_pos = leg2_pos,
    ...
  )
}


#' @title Proportional + typology combined layer
#' @description The \code{viz_proptypo} function combines proportional symbols and
#' typology mapping on the same spatial data frame. It allows simultaneous encoding
#' of two variables using symbol size (quantitative) and categorical coloring.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration over features.
#' @param var1 character. Name of the numeric variable used for absolute values
#' (driving symbol size).
#' @param var2 character. Name of the numeric variable used for categorical mapping.
#' @param var character. Optional. If provided, the same variable is used for both
#' size and color encoding.
#' @param symbol character. Optional. Symbol type (default "circle").
#' One of: "circle", "spike", "halfcircle".
#' @param k numeric. Optional. Size of the largest symbol (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the symbol of size \code{k}.
#' Useful for ensuring comparability between maps.
#' @param dodge logical. Optional. Avoid symbol overlap (default FALSE).
#' @param width numeric. Optional. Width of spike symbols (default 30).
#' @param straight numeric. Optional. Curvature of spike symbols (default 0).
#' Value between 0 (curved) and 1 (straight).
#' @param colors character or vector. Optional. Color palette or vector of colors
#' from the Dicopal library. See https://observablehq.com/@neocartocnrs/dicopal-library
#' @param order character vector. Optional. Explicit order of categorical values.
#' @param alphabetical logical. Optional. Whether to sort categories alphabetically
#' (default TRUE).
#' @param missing character or logical. Optional. Color for missing values (default "white").
#' @param legend logical. Optional. Whether to display legends (default TRUE).
#' @param leg1_type character. Optional. Symbol legend type (default "nested").
#' @param leg2_type character. Optional. Typology legend type (default "vertical").
#' @param leg1_pos numeric vector. Optional. Position of symbol legend (default c(10, 10)).
#' @param leg2_pos numeric vector. Optional. Position of typology legend (default c(10, 10)).
#' @param ... Additional parameters passed to rendering functions (e.g. \code{strokeWidth})
#' @param leg1_* additional legend parameters. Optional. Arguments prefixed with \code{leg1_}
#' are forwarded to symbol legend functions (e.g. \code{leg1_missing_text}, \code{leg1_values_fill}).
#' @param leg2_* additional legend parameters. Optional. Arguments prefixed with \code{leg2_}
#' are forwarded to typology legend functions (e.g. \code{leg2_missing_text}, \code{leg2_values_fill}).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_proptypo(data = world, var1 = "pop", var2 = "region",
#'                symbol = "square", k = 50, colors = "Set3") |>
#'   viz_render()
viz_proptypo <- function(
    map,
    data = NULL,
    var1,
    var2,
    var = NULL,
    symbol = "circle",
    k = 50,
    fixmax = NULL,
    dodge = FALSE,
    width = 30,
    straight = 0,
    colors = NULL,
    order = NULL,
    alphabetical = TRUE,
    missing = "white",
    legend = TRUE,
    leg1_type = "nested",
    leg2_type = "vertical",
    leg1_pos = c(10, 10),
    leg2_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "proptypo",
    data = data,
    var1 = var1,
    var2 = var2,
    var = var,
    symbol = symbol,
    k = k,
    fixmax = fixmax,
    dodge = dodge,
    width = width,
    straight = straight,
    colors = colors,
    order = order,
    alphabetical = alphabetical,
    missing = missing,
    legend = legend,
    leg1_type = leg1_type,
    leg2_type = leg2_type,
    leg1_pos = leg1_pos,
    leg2_pos = leg2_pos,
    ...
  )
}

#' @title Pictogram layer
#' @description The \code{viz_picto} function creates a pictogram (symbol-based)
#' map layer from a spatial data frame. It allows mapping qualitative variables
#' to custom symbols and supports legend generation and ordering.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration over features.
#' @param var character. Name of the categorical variable used for symbol assignment,
#' or directly the name of a symbol.
#' @param symbols character vector. Optional. Vector of available symbols.
#' @param alphabetical logical. Optional. Whether to sort legend items alphabetically
#' (default TRUE).
#' @param legend logical. Optional. Whether to display a legend (default TRUE).
#' @param leg_type character. Optional. Legend orientation (default "vertical").
#' One of: "horizontal", "vertical".
#' @param leg_pos numeric vector. Optional. Legend position (default c(10, 10)).
#' @param ... Additional parameters passed to rendering functions (e.g. \code{strokeWidth})
#' @param leg_* additional legend parameters. Optional. Arguments prefixed with \code{leg_}
#' are forwarded to typology legend functions (e.g. \code{leg_missing_text}, \code{leg_values_fill}).
#' @export
#' @examples
#' viz_create(projection = "EqualEarth") |>
#'   viz_picto(data = world, var = "type") |>
#'   viz_render()
viz_picto <- function(
    map,
    data = NULL,
    var,
    symbols = NULL,
    alphabetical = TRUE,
    legend = TRUE,
    leg_type = "vertical",
    leg_pos = c(10, 10),
    ...
) {
  add_layer(
    map,
    "picto",
    data = data,
    var = var,
    symbols = symbols,
    alphabetical = alphabetical,
    legend = legend,
    leg_type = leg_type,
    leg_pos = leg_pos,
    ...
  )
}
