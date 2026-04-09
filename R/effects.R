#' @title Add a shadow effect
#' @description The \code{viz_shadow} function allows to create a svg filter. It can be use to add a shadow effect. The function adds a filter to the defs. Then, you can use it with the viz_path function via the filter attribute.
#' @name viz_shadow
#' @param id string (optional)
#'   An identifier for the element.
#' @param dx string (optional, default = "4")
#'   Horizontal shift in the x-direction.
#' @param dy string (optional, default = "4")
#'   Vertical shift in the y-direction.
#' @param fill string (optional, default = "black")
#'   Fill color for the element.
#' @param fillOpacity number (optional, default = 0.5)
#'   Fill opacity of the element (can also use `opacity`).
#' @param stdDeviation number (optional, default = 1.5)
#'   Standard deviation, typically used for blur or shadow effects.
#' @param opacity number (optional, default = 1)
#'   Overall opacity of the element.
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#effect/shadow}{documentation} of the underlying JS library:
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' aus <- world[world$ISO3 == "AUS",]
#' viz_create(margin = 5, width = 750) |>
#'   viz_shadow(id = "my_shadow_effect", stdDeviation =  2.5, dx = 5, dy = 5) |>
#'   viz_path(datum = aus, fill =  "#38896F", filter =  "url(#my_shadow_effect)") |>
#'   viz_render()
viz_shadow   <- function(map, ...) add_layer(map, "shadow", ...)

#' @title Add a radial gradient
#' @description The \code{viz_radialGradient} function allows to create an SVG radial gradient.
#'   The function adds a gradient to the defs and returns the identifier,
#'   e.g. \code{"url(#id)"}.
#' @name viz_radialGradient
#' @param id string (optional)
#'   An identifier for the gradient.
#' @param color1 character (optional, default = "#63b0af")
#'   First color of the gradient.
#' @param color2 character (optional, default = "#428c8b")
#'   Second color of the gradient.
#' @param offset1 numeric (optional, default = 50)
#'   Offset for the first color (percentage).
#' @param offset2 numeric (optional, default = 100)
#'   Offset for the second color (percentage).
#' @param fx numeric (optional, default = 50)
#'   X-coordinate of the focal point (percentage).
#' @param fy numeric (optional, default = 50)
#'   Y-coordinate of the focal point (percentage).
#'
#' @return The identifier of the created radial gradient (e.g. \code{"url(#id)"}).
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#effect/radialGradient}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#'
#' viz_create(margin = 5, width = 750) |>
#'   viz_radialGradient(id = "my_gradient", color1 = "#63b0af", color2 = "#428c8b") |>
#'   viz_path(datum = world, fill = "url(#my_gradient)") |>
#'   viz_render()
viz_radialGradient   <- function(map, ...) add_layer(map, "radialGradient", ...)

#' @title Add a blur effect
#' @description The \code{viz_blur} function allows to create an SVG blur filter. It adds a filter to the defs. Then, you can use it with the \code{viz_path} function via the \code{filter} attribute.
#' @name viz_blur
#' @param id string (optional)
#'   An identifier for the filter.
#' @param stdDeviation number (optional, default = 1.5)
#'   Standard deviation controlling the intensity of the blur.
#'
#' @return The identifier of the created filter (e.g. \code{"url(#id)"}).
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#effect/blur}{documentation} of the underlying JS library:
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' aus <- world[world$ISO3 == "AUS",]
#'
#' viz_create(margin = 5, width = 650) |>
#'   viz_blur(id = "my_blur_effect", stdDeviation = 2) |>
#'   viz_path(datum = aus, fill = "#38896F", filter = "url(#my_blur_effect)") |>
#'   viz_render()
viz_blur   <- function(map, ...) add_layer(map, "blur", ...)

#' @title Add a clipPath
#' @name viz_clipPath
#' @description The clipPath function allows to create a clip layer. The function adds a clip layer to the SVG container
#' @param id string (optional)
#'   An identifier for the clip path.
#' @param datum object (optional, default = \{ type: "Sphere" \})
#'   The geometry to clip.
#' @param permanent logical or string (optional, default = FALSE)
#'   Whether the clip path is permanent (static) or not.
#'
#' @return The identifier of the created clip path (e.g. \code{"url(#id)"}).
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#effect/clipPath}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' aus <- world[world$ISO3 == "AUS",]
#'
#' viz_create(margin = 5, width = 750) |>
#'   viz_clipPath(id = "my_clip", datum = aus) |>
#'   viz_path(datum = aus, fill = "#38896F", clipPath = "url(#my_clip)") |>
#'   viz_render()
viz_clipPath <- function(map, ...) add_layer(map, "clipPath", ...)




#' @title Add a pattern fill
#' @description The \code{viz_pattern} function allows to create SVG patterns such as hatching or other textures.
#' @name viz_pattern
#' @param id string (optional)
#'   Unique identifier for the pattern.
#' @param spacing numeric (optional, default = 6)
#'   Distance between pattern elements in pixels.
#' @param angle numeric (optional, default = 0)
#'   Rotation angle of the pattern in degrees.
#' @param fill character or NULL (optional, default = NULL)
#'   Fill color of pattern elements.
#' @param stroke character (optional, default = "#786d6c")
#'   Stroke color of pattern elements.
#' @param strokeWidth numeric (optional, default = 2)
#'   Stroke width of pattern elements.
#' @param strokeOpacity numeric (optional, default = 0.1)
#'   Stroke opacity of pattern elements.
#' @param fillOpacity numeric (optional, default = 1)
#'   Fill opacity of pattern elements.
#' @param strokeDasharray character or NULL (optional, default = NULL)
#'   Stroke dash pattern.
#' @param strokeLinecap character (optional, default = "butt")
#'   Line cap style: "butt", "round", "square".
#' @param strokeLinejoin character (optional, default = "miter")
#'   Line join style: "miter", "round", "bevel".
#' @param strokeMiterlimit numeric (optional, default = 4)
#'   Miter limit for joins.
#' @param opacity numeric (optional, default = 1)
#'   Overall opacity of the pattern.
#' @param visibility character (optional, default = "visible")
#'   SVG visibility property.
#' @param display character or NULL (optional, default = NULL)
#'   SVG display property.
#' @param pattern character (optional, default = "lines")
#'   Pattern type: "lines", "cross", "dots", "waves", "triangles", "zigzag".
#' @param data object or NULL (optional, default = NULL)
#'   Optional spatial object to clip the pattern.
#' @param clipOutline logical (optional, default = FALSE)
#'   Whether to clip the pattern to the Earth outline.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#pattern}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' africa <- world[world$region =="Africa",]
#'
#' viz_create(projection = "EqualEarth", width = 750, background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_pattern(data = africa, stroke = "#38896F", pattern =  "cross", angle = 45, strokeWidth =  2, strokeOpacity=  0.6) |>
#'   viz_render()
viz_pattern <- function(map, ...) add_layer(map, "pattern", ...)

#' @title Add sketch-style geometries to the map
#' @description The \code{viz_sketch} function generates a hand-drawn (sketchy) SVG representation of GeoJSON geometries.
#'   It applies SVG filters (\code{feTurbulence} and \code{feDisplacementMap}) to create a pencil-like effect.
#' @name viz_sketch
#' @param data object
#'   A GeoJSON FeatureCollection. Use \code{data} or \code{datum} indifferently to provide the input geometry.
#' @param id string (optional)
#'   An identifier for the sketch layer (auto-generated if not provided).
#' @param fill string (optional, default = "none")
#'   Fill color.
#' @param stroke string (optional, default = "#000")
#'   Stroke color.
#' @param strokeWidth numeric (optional, default = 1)
#'   Stroke width.
#' @param simplify numeric or numeric vector or FALSE (optional)
#'   Geometry simplification (see \code{tool.simplify}).
#' @param baseFrequency numeric (optional, default = 0.03)
#'   Base frequency of the turbulence filter (controls noise density).
#' @param feDisplacementMap numeric (optional, default = 5)
#'   Displacement intensity of the sketch effect.
#' @param fillStyle string (optional, default = "dashed")
#'   Fill style (reserved for future rough-like fills).
#' @param roughness numeric (optional, default = 5)
#'   Roughness level (not fully implemented, reserved for future use).
#' @param hachureGap numeric (optional, default = 3)
#'   Gap between hachure lines (reserved).
#' @param bowing numeric (optional, default = 30)
#'   Line bowing effect (reserved).
#' @param fillWeight numeric (optional, default = 0.12)
#'   Fill stroke weight (reserved).
#'
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#sketch}{documentation} of the underlying JS library and a \href{https://observablehq.com/@neocartocnrs/sketch}{live demo} on ObservableHQ.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_sketch(data = world, stroke = "#38896F", strokeWidth = 1) |>
#'   viz_render()
viz_sketch <- function(map, ...) add_layer(map, "sketch", ...)

