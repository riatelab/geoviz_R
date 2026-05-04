#' @title Shadow layer
#' @description The \code{viz_shadow} function adds a shadow effect to map elements,
#' typically used to enhance depth perception for shapes, symbols, or extruded visualizations.
#' The layer is rendered in SVG and can be applied globally or to specific geometries.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param dx numeric. Optional. Horizontal shadow offset (default 0).
#' @param dy numeric. Optional. Vertical shadow offset (default 0).
#' @param blur numeric. Optional. Blur intensity of the shadow (default 0).
#' @param opacity numeric. Optional. Shadow opacity (default 1).
#' @param fill character or function. Optional. Shadow fill color.
#' @param stroke character or function. Optional. Shadow stroke color.
#' @param strokeWidth numeric. Optional. Shadow stroke width.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in SVG space.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{strokeLinecap},
#' \code{filter}, etc.).
#' @param ... Additional parameters
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' aus <- world[world$ISO3 == "AUS", ]
#'
#' viz_create(margin = 5) |>
#'   viz_shadow(id = "my_shadow_effect", stdDeviation = 2.5, dx = 5, dy = 5) |>
#'   viz_path(datum = aus, fill = "#38896F", filter = "url(#my_shadow_effect)") |>
#'   viz_render()
viz_shadow <- function(
  map,
  id = NULL,
  dx = 0,
  dy = 0,
  blur = 0,
  opacity = 1,
  fill = NULL,
  stroke = NULL,
  strokeWidth = NULL,
  coords = "geo",
  ...
) {
  add_layer(
    map,
    "shadow",
    id = id,
    dx = dx,
    dy = dy,
    blur = blur,
    opacity = opacity,
    fill = fill,
    stroke = stroke,
    strokeWidth = strokeWidth,
    coords = coords,
    ...
  )
}


#' @title Radial gradient
#' @description The \code{viz_radialGradient} function creates an SVG radialGradient
#' definition and adds it to the SVG defs. It returns a reference usable in SVG styling
#' (e.g. \code{url(#id)}). It is typically used to create smooth radial color transitions.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique gradient id.
#' @param color1 character. Optional. First color of the gradient (default "#63b0af").
#' @param color2 character. Optional. Second color of the gradient (default "#428c8b").
#' @param offset1 numeric. Optional. Offset of the first color stop (default 50).
#' @param offset2 numeric. Optional. Offset of the second color stop (default 100).
#' @param fx numeric. Optional. Focal point x-position (default 50).
#' @param fy numeric. Optional. Focal point y-position (default 50).
#' @param ... Additional parameters
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' aus <- world[world$ISO3 == "AUS", ]
#'
#' viz_create() |>
#'   viz_radialGradient(
#'     id = "my_gradient", color1 = "#63b0af",
#'     color2 = "#428c8b"
#'   ) |>
#'   viz_path(datum = aus, fill = "url(#my_gradient)") |>
#'   viz_render()
viz_radialGradient <- function(
  map,
  id = NULL,
  color1 = "#63b0af",
  color2 = "#428c8b",
  offset1 = 50,
  offset2 = 100,
  fx = 50,
  fy = 50,
  ...
) {
  add_layer(
    map,
    "radialGradient",
    id = id,
    color1 = color1,
    color2 = color2,
    offset1 = offset1,
    offset2 = offset2,
    fx = fx,
    fy = fy,
    ...
  )
}


#' @title Blur filter
#' @description The \code{viz_blur} function creates an SVG blur filter and adds it
#' to the map definitions. It returns a reference usable in SVG styling (e.g. \code{url(#id)}).
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique filter id.
#' @param stdDeviation numeric. Optional. Standard deviation controlling blur intensity (default 1.5).
#' Higher values produce a stronger blur effect.
#' @param ... Additional parameters
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' aus <- world[world$ISO3 == "AUS", ]
#'
#' viz_create(margin = 5, width = 650) |>
#'   viz_blur(id = "my_blur_effect", stdDeviation = 2) |>
#'   viz_path(datum = aus, fill = "#38896F", filter = "url(#my_blur_effect)") |>
#'   viz_render()
viz_blur <- function(
  map,
  id = NULL,
  stdDeviation = 1.5,
  ...
) {
  add_layer(
    map,
    "blur",
    id = id,
    stdDeviation = stdDeviation,
    ...
  )
}

#' @title ClipPath layer
#' @description The \code{viz_clipPath} function creates an SVG clipPath definition
#' and adds it to the SVG defs. It returns a reference usable in SVG styling
#' (e.g. \code{url(#id)}). WARNING: the clipPath is global to the web page, not only the map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique clipPath id.
#' @param datum object. Optional. Geometry used for clipping (default \code{list(type = "Sphere")}).
#' @param permanent logical or character. Optional. Whether the clipPath is static (default FALSE).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' aus <- world[world$ISO3 == "AUS", ]
#'
#' viz_create(margin = 5, projection = "meractor") |>
#'   viz_clipPath(id = "ausclip", datum = aus) |>
#'   viz_tile(url = "worldStreet", clipPath = "url(#ausclip)") |>
#'   viz_render()
viz_clipPath <- function(
  map,
  id = NULL,
  datum = list(type = "Sphere"),
  permanent = FALSE
) {
  add_layer(
    map,
    "clipPath",
    id = id,
    datum = datum,
    permanent = permanent
  )
}

#' @title Pattern layer
#' @description The \code{viz_pattern} function creates a reusable SVG pattern
#' for thematic or cartographic styling. Patterns can be applied to any SVG shape
#' (e.g. paths, rectangles) and support multiple textures such as lines, crosses,
#' dots, waves, triangles, or zigzags. Patterns can also be clipped to a spatial
#' data frame geometry or to the Earth outline.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique pattern id (auto-generated if not provided).
#' @param spacing numeric. Optional. Distance between pattern elements (default 6).
#' @param angle numeric. Optional. Pattern rotation in degrees (default 0).
#' @param fill character or NULL. Optional. Fill color of pattern elements.
#' @param stroke character. Optional. Stroke color (default "#786d6c").
#' @param strokeWidth numeric. Optional. Stroke width (default 2).
#' @param strokeOpacity numeric. Optional. Stroke opacity (default 0.1).
#' @param fillOpacity numeric. Optional. Fill opacity (default 1).
#' @param strokeDasharray character or NULL. Optional. Stroke dash pattern.
#' @param strokeLinecap character. Optional. Line cap style (default "butt").
#' @param strokeLinejoin character. Optional. Line join style (default "miter").
#' @param strokeMiterlimit numeric. Optional. Miter limit (default 4).
#' @param opacity numeric. Optional. Overall opacity (default 1).
#' @param visibility character. Optional. SVG visibility property (default "visible").
#' @param display character or NULL. Optional. SVG display property.
#' @param pattern character. Optional. Pattern type (default "lines").
#' One of: "lines", "cross", "dots", "waves", "triangles", "zigzag".
#' @param data object or NULL. Optional. Spatial data frame used to clip the pattern.
#' @param clipOutline logical. Optional. Clip pattern to Earth outline (default FALSE).
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' africa <- world[world$region == "Africa", ]
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_pattern(
#'     data = africa, stroke = "#38896F", pattern = "cross",
#'     angle = 45, strokeWidth = 2, strokeOpacity = 0.6
#'   ) |>
#'   viz_render()
viz_pattern <- function(
  map,
  id = NULL,
  spacing = 6,
  angle = 0,
  fill = NULL,
  stroke = "#786d6c",
  strokeWidth = 2,
  strokeOpacity = 0.1,
  fillOpacity = 1,
  strokeDasharray = NULL,
  strokeLinecap = "butt",
  strokeLinejoin = "miter",
  strokeMiterlimit = 4,
  opacity = 1,
  visibility = "visible",
  display = NULL,
  pattern = "lines",
  data = NULL,
  clipOutline = FALSE,
  ...
) {
  add_layer(
    map,
    "pattern",
    id = id,
    spacing = spacing,
    angle = angle,
    fill = fill,
    stroke = stroke,
    strokeWidth = strokeWidth,
    strokeOpacity = strokeOpacity,
    fillOpacity = fillOpacity,
    strokeDasharray = strokeDasharray,
    strokeLinecap = strokeLinecap,
    strokeLinejoin = strokeLinejoin,
    strokeMiterlimit = strokeMiterlimit,
    opacity = opacity,
    visibility = visibility,
    display = display,
    pattern = pattern,
    data = data,
    clipOutline = clipOutline,
    ...
  )
}

#' @title Sketch layer
#' @description The \code{viz_sketch} function renders a spatial dataframe as
#' hand-drawn (sketchy) SVG shapes. It uses SVG filters (feTurbulence and
#' feDisplacementMap) to simulate a pencil-like rendering style.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. Optional. A spatial data frame (or equivalent geometry input).
#' @param id character. Optional. Unique layer id (auto-generated if not provided).
#' @param fill character. Optional. Fill color (default "none").
#' @param stroke character. Optional. Stroke color (default "#000").
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param simplify numeric or vector or logical. Optional. Geometry simplification
#' @param baseFrequency numeric. Optional. Base frequency of the turbulence filter
#' (default 0.03). Controls noise density.
#' @param feDisplacementMap numeric. Optional. Displacement intensity of the sketch effect
#' (default 5).
#' @param fillStyle character. Optional. Fill style (default "dashed").
#' @param roughness numeric. Optional. Roughness level (reserved for future use, default 5).
#' @param hachureGap numeric. Optional. Gap between hachure lines (reserved, default 3).
#' @param bowing numeric. Optional. Line bowing effect (reserved, default 30).
#' @param fillWeight numeric. Optional. Fill stroke weight (reserved, default 0.12).
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#'
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_sketch(data = world, stroke = "#38896F", strokeWidth = 1) |>
#'   viz_render()
viz_sketch <- function(
  map,
  data = NULL,
  id = NULL,
  fill = "none",
  stroke = "#000",
  strokeWidth = 1,
  simplify = NULL,
  baseFrequency = 0.03,
  feDisplacementMap = 5,
  fillStyle = "dashed",
  roughness = 5,
  hachureGap = 3,
  bowing = 30,
  fillWeight = 0.12,
  ...
) {
  add_layer(
    map,
    "sketch",
    data = data,
    id = id,
    fill = fill,
    stroke = stroke,
    strokeWidth = strokeWidth,
    simplify = simplify,
    baseFrequency = baseFrequency,
    feDisplacementMap = feDisplacementMap,
    fillStyle = fillStyle,
    roughness = roughness,
    hachureGap = hachureGap,
    bowing = bowing,
    fillWeight = fillWeight,
    ...
  )
}
