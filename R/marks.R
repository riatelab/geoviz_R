#' @title Circle layer
#' @description The \code{viz_circle} function draws circles on the map from a spatial
#' data frame or from a single position. It can be used to create proportional symbol maps
#' with optional collision avoidance.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector. Optional. Position of a single circle (default c(0, 0)).
#' @param r numeric or character. Optional. Circle radius (default 10).
#' Can be a fixed value or the name of a field containing numerical values.
#' @param k numeric. Optional. Radius of the largest circle (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the circle of radius \code{k}.
#' Useful to ensure comparability between maps.
#' @param dodge logical. Optional. Avoid circle overlap (default FALSE).
#' @param iteration numeric. Optional. Number of iterations for dodging (default 200).
#' @param sort character or function. Optional. Field name or function to sort circles.
#' @param descending logical. Optional. Sorting order.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color (default "white").
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{strokeWidth},
#' \code{opacity}, \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'                  quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_circle(data = world, r = 30, fill = "#38896F") |>
#'   viz_render()
viz_circle <- function(
    map,
    data = NULL,
    id = NULL,
    pos = c(0, 0),
    r = 10,
    k = 50,
    fixmax = NULL,
    dodge = FALSE,
    iteration = 200,
    sort = NULL,
    descending = NULL,
    coords = "geo",
    fill = NULL,
    stroke = "white",
    tip = FALSE,
    ...
) {
  add_layer(
    map,
    "circle",
    data = data,
    id = id,
    pos = pos,
    r = r,
    k = k,
    fixmax = fixmax,
    dodge = dodge,
    iteration = iteration,
    sort = sort,
    descending = descending,
    coords = coords,
    fill = fill,
    stroke = stroke,
    tip = tip,
    ...
  )
}


#' @title Square layer
#' @description The \code{viz_square} function draws rotatable squares on the map
#' from a spatial data frame or from a single position. It can be used to create
#' proportional symbol maps with square markers.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector. Optional. Position of a single square (default c(0, 0)).
#' @param dx numeric. Optional. Horizontal shift (default 0).
#' @param dy numeric. Optional. Vertical shift (default 0).
#' @param angle numeric. Optional. Rotation angle in degrees (default 0).
#' @param side numeric or character. Optional. Square size (default 20).
#' Can be a fixed value or the name of a field containing numerical values.
#' @param k numeric. Optional. Size of the largest square (default 100).
#' @param fixmax numeric. Optional. Value corresponding to the square of size \code{k}.
#' Useful to ensure comparability between maps.
#' @param sort character or function. Optional. Field name or function to sort squares.
#' @param descending logical. Optional. Sorting order.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color.
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{strokeWidth},
#' \code{opacity}, \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'                  quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_square(data = world, side = 60, fill = "#38896F") |>
#'   viz_render()
viz_square <- function(
    map,
    data = NULL,
    id = NULL,
    pos = c(0, 0),
    dx = 0,
    dy = 0,
    angle = 0,
    side = 20,
    k = 100,
    fixmax = NULL,
    sort = NULL,
    descending = NULL,
    coords = "geo",
    fill = NULL,
    stroke = NULL,
    tip = FALSE,
    ...
) {
  add_layer(
    map,
    "square",
    data = data,
    id = id,
    pos = pos,
    dx = dx,
    dy = dy,
    angle = angle,
    side = side,
    k = k,
    fixmax = fixmax,
    sort = sort,
    descending = descending,
    coords = coords,
    fill = fill,
    stroke = stroke,
    tip = tip,
    ...
  )
}

#' @title Spike layer
#' @description The \code{viz_spike} function draws spikes on the map from a spatial
#' data frame or from a single position. It can be used to represent values with
#' vertical symbols (e.g. for density or intensity maps).
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector. Optional. Position of a single spike (default c(0, 0)).
#' @param height numeric or character. Optional. Spike height (default 10).
#' Can be a fixed value or the name of a field containing numerical values.
#' @param width numeric. Optional. Spike width (default 30).
#' @param straight numeric. Optional. Controls spike curvature (default 0).
#' Value between 0 (curved) and 1 (straight).
#' @param k numeric. Optional. Height of the highest spike (default 100).
#' @param fixmax numeric. Optional. Value corresponding to the spike of height \code{k}.
#' Useful to ensure comparability between maps.
#' @param sort character or function. Optional. Field name or function to sort spikes.
#' @param descending logical. Optional. Sorting order.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color.
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{strokeWidth},
#' \code{opacity}, \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'                  quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_square(data = world, height = 100, fill = "#38896F") |>
#'   viz_render()
viz_spike <- function(
    map,
    data = NULL,
    id = NULL,
    pos = c(0, 0),
    height = 10,
    width = 30,
    straight = 0,
    k = 100,
    fixmax = NULL,
    sort = NULL,
    descending = NULL,
    coords = "geo",
    fill = NULL,
    stroke = NULL,
    tip = FALSE,
    ...
) {
  add_layer(
    map,
    "spike",
    data = data,
    id = id,
    pos = pos,
    height = height,
    width = width,
    straight = straight,
    k = k,
    fixmax = fixmax,
    sort = sort,
    descending = descending,
    coords = coords,
    fill = fill,
    stroke = stroke,
    tip = tip,
    ...
  )
}



#' @title Half-circle layer
#' @description The \code{viz_halfcircle} function draws rotatable half-circles on the map
#' from a spatial data frame or from a single position. It can be used to represent values
#' with semi-circular proportional symbols.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector. Optional. Position of a single half-circle (default c(0, 0)).
#' @param dx numeric. Optional. Horizontal shift (default 0).
#' @param dy numeric. Optional. Vertical shift (default 0).
#' @param angle numeric. Optional. Rotation angle in degrees (default 0).
#' @param r numeric or character. Optional. Outer radius (default 10).
#' Can be a fixed value or the name of a field containing numerical values.
#' @param innerRadius numeric. Optional. Inner radius (default 10).
#' @param cornerRadius numeric. Optional. Corner radius (default 2).
#' @param k numeric. Optional. Radius of the largest half-circle (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the half-circle of radius \code{k}.
#' Useful to ensure comparability between maps.
#' @param sort character or function. Optional. Field name or function to sort half-circles.
#' @param descending logical. Optional. Sorting order.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color.
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{strokeWidth},
#' \code{opacity}, \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'                  quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_halfcircle(data = world, r = 30, fill = "#38896F") |>
#'   viz_render()
viz_halfcircle <- function(
    map,
    data = NULL,
    id = NULL,
    pos = c(0, 0),
    dx = 0,
    dy = 0,
    angle = 0,
    r = 10,
    innerRadius = 10,
    cornerRadius = 2,
    k = 50,
    fixmax = NULL,
    sort = NULL,
    descending = NULL,
    coords = "geo",
    fill = NULL,
    stroke = NULL,
    tip = FALSE,
    ...
) {
  add_layer(
    map,
    "halfcircle",
    data = data,
    id = id,
    pos = pos,
    dx = dx,
    dy = dy,
    angle = angle,
    r = r,
    innerRadius = innerRadius,
    cornerRadius = cornerRadius,
    k = k,
    fixmax = fixmax,
    sort = sort,
    descending = descending,
    coords = coords,
    fill = fill,
    stroke = stroke,
    tip = tip,
    ...
  )
}

#' @title Symbol layer
#' @description The \code{viz_symbol} function draws SVG symbols on the map from a spatial
#' data frame. It allows the use of predefined symbols, scaling, rotation, and styling,
#' and can be used for categorical or proportional symbol maps.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector. Optional. Position of a single symbol (default c(0, 0)).
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color (default "white").
#' @param strokeWidth numeric or function. Optional. Stroke width (default 0.2).
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param r numeric or character. Optional. Radius defining symbol size (default 12).
#' @param scale numeric. Optional. Global scale factor for symbols.
#' @param symbol character. Optional. Symbol name. "circle", "square", "triangle", "pentagon", "hexagon", "roundsquare", "pillow", "drop", "egg", "star12", "star8", "star", "diamond", "trapzium", "plus", "minus", "arrow", "stop", "vbar", "crescent", "donut", "heart", "clover", "fist", "check", "plane", "rocket", "boat", "pin", "hospital", "flower", "cloud", "human", "tent", "beer", "boom", "nuke", "target", "missing". (default "star").
#' different symbols are assigned per category.
#' @param missing character. Optional. Symbol used for missing values (default "missing").
#' Use \code{NULL} to hide missing values.
#' @param rotate numeric. Optional. Rotation angle (default 0).
#' @param skewX numeric. Optional. Horizontal skew (default 0).
#' @param skewY numeric. Optional. Vertical skew (default 0).
#' @param background logical. Optional. Add a background circle (default FALSE).
#' @param background_* additional background parameters (e.g. \code{background_fill},
#' \code{background_stroke}, etc.).
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param k numeric. Optional. Maximum radius scaling value (default 50).
#' @param fixmax numeric. Optional. Value corresponding to the maximum radius \code{k}.
#' @param dodge logical. Optional. Avoid symbol overlap (default FALSE).
#' @param iteration numeric. Optional. Number of iterations for dodging (default 200).
#' @param sort character or function. Optional. Field name or function to sort symbols.
#' @param descending logical. Optional. Sorting order.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'                  quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_symbol(data = world, symbol = "star", fill = "#38896F") |>
#'   viz_render()
viz_symbol <- function(
    map,
    data = NULL,
    id = NULL,
    pos = c(0, 0),
    fill = NULL,
    stroke = "white",
    strokeWidth = 0.2,
    coords = "geo",
    r = 12,
    scale = NULL,
    symbol = "star",
    missing = "missing",
    rotate = 0,
    skewX = 0,
    skewY = 0,
    background = FALSE,
    tip = FALSE,
    k = 50,
    fixmax = NULL,
    dodge = FALSE,
    iteration = 200,
    sort = NULL,
    descending = NULL,
    ...
) {
  add_layer(
    map,
    "symbol",
    data = data,
    id = id,
    pos = pos,
    fill = fill,
    stroke = stroke,
    strokeWidth = strokeWidth,
    coords = coords,
    r = r,
    scale = scale,
    symbol = symbol,
    missing = missing,
    rotate = rotate,
    skewX = skewX,
    skewY = skewY,
    background = background,
    tip = tip,
    k = k,
    fixmax = fixmax,
    dodge = dodge,
    iteration = iteration,
    sort = sort,
    descending = descending,
    ...
  )
}
