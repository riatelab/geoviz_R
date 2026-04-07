#' Add a graticule layer
#'
#' The \code{viz_graticule} function creates a layer representing latitude and
#' longitude lines according to the current projection.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param step numeric or numeric vector of length 2. Optional. Gap between
#'   graticules (default 10).
#' @param stroke character. Optional. Stroke color (default "#9ad5e6").
#' @param fill character. Optional. Fill color (default "none").
#' @param strokeWidth numeric. Optional. Stroke width (default 0.8).
#' @param strokeLinecap character. Optional. Line cap style (default "square").
#' @param strokeLinejoin character. Optional. Line join style (default "round").
#' @param strokeDasharray numeric or numeric vector. Optional. Stroke dash pattern (default 2).
#'
#' @return The identifier of the created layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#graticule}{documentation} of the underlying JS library.
#'
#' @export
#'
#' @examples
#' viz_create(projection = "EqualEarth", width = 750) |>
#'   viz_graticule(stroke = "#38896F", strokeDasharray = 4, step = 20) |>
#'   viz_render()
viz_graticule <- function(map, projection = "none", step = 10, stroke = "#9ad5e6", strokeDasharray = 2, ...) {
  add_layer(map, "graticule", step = step, stroke = stroke, strokeDasharray = strokeDasharray, ...)
}

#' Add an Earth outline layer
#'
#' The \code{viz_outline} function creates a layer representing the Earth outline
#' according to the current projection.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param stroke character. Optional. Stroke color (default "none").
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param fill character. Optional. Fill color (default "#B5DFFD").
#'
#' @return The identifier of the created layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#outline}{documentation} of the underlying JS library.
#'
#' @export
#'
#' @examples
#' viz_create(projection = "EqualEarth", width = 750) |>
#' viz_outline(stroke = "#38896F") |>
#' viz_render()
#'
viz_outline   <- function(map, ...) add_layer(map, "outline", ...)

  #' @title Add a map header
  #' @description The \code{viz_header} function allows to add a title above the map.
  #'   The function creates a layer in the SVG container.
  #' @name viz_header
  #' @param id string (optional)
  #'   An identifier for the header layer.
  #' @param text string (optional, default = "Map title")
  #'   Text to be displayed.
  #' @param fill character (optional, default = "#9e9696")
  #'   Text fill color.
  #' @param background_fill character (optional, default = "white")
  #'   Background fill color.
  #' @param background_stroke character (optional, default = "white")
  #'   Background stroke color.
  #' @param background_strokeWidth numeric (optional, default = 1)
  #'   Background stroke width.
  #' @param dominantBaseline character (optional, default = "central")
  #'   Text dominant-baseline ("hanging", "middle", "central", "bottom").
  #' @param textAnchor character (optional, default = "middle")
  #'   Text anchor ("start", "middle", "end").
  #' @param lineSpacing numeric (optional, default = 0)
  #'   Space between lines.
  #' @param margin numeric (optional, default = 8)
  #'   Margin around the text.
  #' @param fontSize numeric (optional, default = 26)
  #'   Text font size.
  #' @param fontFamily character (optional)
  #'   Font family defined in the container.
  #' @param dx numeric (optional, default = 0)
  #'   Horizontal shift.
  #' @param dy numeric (optional, default = 0)
  #'   Vertical shift.
  #'
  #' @return The identifier of the created header layer.
  #' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#header}{documentation} of the underlying JS library.
  #' @export
  #'
  #' @examples
  #' library(sf)
  #' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
  #' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
  #'   viz_header(text = "Hello World 👋", fontSize = 28, fill = "#38896F") |>
  #'   viz_path(data = world, fill = "#f1f3f5") |>
  #'   viz_render()
  #'
viz_header   <- function(map, ...) add_layer(map, "header", ...)

  #' Add an Earth raster layer
  #'
  #' The \code{viz_earth} function displays PNG images representing the Earth's
  #' surface. Images comes from Natural Earth (naturalearthdata.com).
  #'
  #' @param map A \code{geoviz} object created with \code{viz_create}.
  #' @param id character. Optional. ID of the layer.
  #' @param url character. Optional. URL of the image to display. You can use one
  #'   of the provided Natural Earth styles (e.g. "NE2_50M_SR_W").
  #' @param opacity numeric. Optional. Opacity (default 1).
  #'
  #' @return The identifier of the created layer.
  #' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#earth}{documentation} of the underlying JS library.
  #'
  #' @export
  #'
  #' @examples
  #' viz_create(projection = "EqualEarth", width = 750) |>
  #'   viz_earth() |>
  #'   viz_render()
viz_earth   <- function(map, ...) add_layer(map, "earth", ...)

#' @title Add a map footer
#' @description The \code{viz_footer} function allows to add a source or text below the map.
#'   The function creates a layer in the SVG container.
#' @name viz_footer
#' @param id string (optional)
#'   An identifier for the footer layer.
#' @param text string (optional, default = "Author, source...")
#'   Text to be displayed.
#' @param fill character (optional, default = "#9e9696")
#'   Text fill color.
#' @param background_fill character (optional, default = "white")
#'   Background fill color.
#' @param background_stroke character (optional, default = "white")
#'   Background stroke color.
#' @param background_strokeWidth numeric (optional, default = 1)
#'   Background stroke width.
#' @param dominantBaseline character (optional, default = "central")
#'   Text dominant-baseline ("hanging", "middle", "central", "bottom").
#' @param textAnchor character (optional, default = "middle")
#'   Text anchor ("start", "middle", "end").
#' @param lineSpacing numeric (optional, default = 0)
#'   Space between lines.
#' @param margin numeric (optional, default = 1)
#'   Margin around the text.
#' @param fontSize numeric (optional, default = 10)
#'   Text font size.
#' @param fontFamily character (optional)
#'   Font family defined in the container.
#' @param dx numeric (optional, default = 0)
#'   Horizontal shift.
#' @param dy numeric (optional, default = 0)
#'   Vertical shift.
#'
#' @return The identifier of the created footer layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#footer}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_footer(text = "Source: Geoviz R package, 2022\nMap design: Nicolas Lambert, 2026", fontSize = 12, fill = "#38896F") |>
#'   viz_render()
viz_footer   <- function(map, ...) add_layer(map, "footer", ...)

  #' Add a path layer from spatial data
  #'
  #' The \code{viz_path} function generates SVG paths from spatial data.
  #'
  #' @param map A \code{geoviz} object created with \code{viz_create}.
  #' @param data sf object. Spatial dataframe. Use \code{data} to iterate over features.
  #' @param id character. Optional. ID of the layer.
  #' @param coords character. Optional. Coordinate system to use (default "geo").
  #'   Use "svg" if coordinates are already in the SVG plane.
  #' @param clip logical. Optional. Whether to clip paths with the outline (default TRUE).
  #' @param fill character or function. Optional. Fill color.
  #' @param stroke character or function. Optional. Stroke color.
  #' @param strokeWidth numeric or function. Optional. Stroke width (default 1).
  #' @param tip logical or function. Optional. Tooltip display (default FALSE).
  #' @param simplify logical, numeric, vector, or FALSE. Optional. Geometry simplification.
  #'   TRUE = automatic, numeric = fixed tolerance, vector of length 2 = dynamic simplification.
  #' @param rewind logical. Optional. Rewind polygon rings (default FALSE).
  #' @param rewindPole logical. Optional. Special rewinding for geometries crossing poles or dateline.
  #' @param pointRadius numeric. Optional. Radius for point geometries (default 3).
  #'
  #' @return The identifier of the created layer.
  #' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#path}{documentation} of the underlying JS library.
  #'
  #' @export
  #'
  #' @examples
  #' library(sf)
  #' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
  #'
  #' viz_create(projection = "EqualEarth", width = 750, zoomable =T) |>
  #'   viz_path(data = world, fill = "#38896F") |>
  #'   viz_render()
viz_path   <- function(map, ...) add_layer(map, "path", ...)

#' @title Add text or labels
#' @description The \code{viz_text} function allows to add text on the map.
#'   It can also create a layer with labels from a spatial dataframe.
#'   The function creates a layer in the SVG container.
#' @name viz_text
#' @param data object
#'   A spatial dataframe (e.g., sf object) to use for generating labels.
#' @param id string (optional)
#'   An identifier for the text layer.
#' @param text character or function (optional, default = "text")
#'   Text to be displayed, or a function returning text from the data.
#' @param textAnchor character or function (optional)
#'   Text anchor: "start", "middle", or "end".
#' @param dominantBaseline character or function (optional)
#'   Text dominant-baseline: "auto", "middle", "central", "hanging".
#' @param fontFamily character (optional)
#'   Font family defined in the SVG container.
#' @param fontSize numeric (optional, default = 12)
#'   Font size.
#' @param lineSpacing numeric (optional, default = 0)
#'   Space between lines.
#' @param pos numeric vector of length 2 (optional, default = c(0, 0))
#'   Position to display a single text element.
#' @param dx numeric (optional, default = 0)
#'   Horizontal shift.
#' @param dy numeric (optional, default = 0)
#'   Vertical shift.
#' @param sort character or function (optional)
#'   Field to sort labels or a function to define sort order.
#' @param descending logical (optional)
#'   Sorting order.
#' @param coords character (optional, default = "geo")
#'   Use "svg" if the coordinates are already in the SVG plane.
#' @param fill character or function (optional)
#'   Fill color for the text.
#' @param stroke character or function (optional)
#'   Stroke color for the text.
#' @param strokeWidth numeric (optional, default = 1)
#'   Stroke width.
#' @param strokeLinejoin character or function (optional, default = "round")
#'   Stroke line join style.
#'
#' @return The identifier of the created text layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#text}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth", zoomable = T) |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_text(data = world, text = "ISO3", fontSize = 10, fill = "#38896F") |>
#'   viz_render()
viz_text   <- function(map, ...) add_layer(map, "text", ...)

#' Add a raster tile layer
#'
#' The \code{viz_tile} function displays raster tiles from online providers.
#' This function requires the use of a Mercator projection ("mercator").
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param tileSize numeric. Optional. Tile size (default 512).
#' @param zoomDelta numeric. Optional. Zoom offset (default 1).
#' @param opacity numeric. Optional. Tile opacity (default 1).
#' @param url character or function. Optional. Tile source. Can be a string
#'   (e.g. "openstreetmap", "cartodbvoyager", "stamentoner")
#'
#' @return The identifier of the created layer.
#' @details This function requires a Mercator projection. For example:
#'   \code{viz_create(projection = "mercator")}.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#tile}{documentation} of the underlying JS library.
#'
#' @export
#'
#' @examples
#' viz_create(projection = "mercator", width =750) |>
#'   viz_tile(url = "worldimagery") |>
#'   viz_render()
viz_tile   <- function(map, ...) add_layer(map, "tile", ...)


#' viz_smooth
#' @export
viz_smooth <- function(map, ...) add_layer(map, "smooth", ...)






#' @title Add a North arrow
#' @description The \code{viz_north} function allows to add a North arrow to the map.
#'   The function creates a layer in the SVG container.
#' @name viz_north
#' @param id string (optional)
#'   An identifier for the North arrow layer.
#' @param pos numeric vector of length 2 (optional, default = c(svg.width - 30, 30))
#'   Position [x, y] on the page. The scale value is relevant for this location on the map.
#' @param scale numeric (optional, default = 1)
#'   Scale factor to resize the arrow.
#' @param rotate numeric (optional, default = NULL)
#'   Angle to rotate the arrow. By default, it is automatically calculated.
#' @param fill character (optional, default = "black")
#'   Fill color of the arrow.
#' @param fillOpacity numeric (optional, default = 1)
#'   Fill opacity of the arrow.
#'
#' @return The identifier of the created North arrow layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#north}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_north(pos = c(280, 120), scale = 1.5, fill = "#38896F") |>
#'   viz_render()
viz_north   <- function(map, ...) add_layer(map, "north", ...)

#' @title Add a scalebar
#' @description The \code{viz_scalebar} function allows to add a scalebar to the map.
#'   The function creates a layer in the SVG container.
#' @name viz_scalebar
#' @param id string (optional)
#'   An identifier for the scalebar layer.
#' @param pos numeric vector of length 2 (optional, default = c(10, svg.height - 20))
#'   Position [x, y] on the page. The scale value is relevant for this location on the map.
#' @param translate numeric vector of length 2 (optional, default = NULL)
#'   Offset to move the scalebar without changing its size.
#' @param units character (optional, default = "km")
#'   Units for the scalebar: "ft" (feet), "km" (kilometers), "m" (meters), or "mi" (miles).
#' @param label string (optional)
#'   Label to display next to the scalebar.
#' @param tickSize numeric (optional, default = 5)
#'   Length of tick marks.
#' @param tickPadding numeric (optional, default = 0.2)
#'   Space between ticks and labels.
#' @param distance numeric (optional)
#'   Distance represented by the scalebar.
#' @param tickFormat function (optional, default = \code{d => d})
#'   Function to format tick labels.
#' @param tickValues numeric vector (optional)
#'   Specific values to display on the scalebar.
#' @param labelAnchor character (optional, default = "start")
#'   Position of the label: "start", "middle", or "end".
#'
#' @return The identifier of the created scalebar layer.
#' @seealso See all parameters in the \href{https://riatelab.github.io/geoviz/global.html#scalebar}{documentation} of the underlying JS library.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
#' viz_create(width = 750, background = "white", projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#f1f3f5") |>
#'   viz_scalebar(units = "km", distance = 1000, tickSize = 5) |>
#'   viz_render()
viz_scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)

#' viz_prop
#' @export
viz_prop   <- function(map, ...) add_layer(map, "prop", ...)

#' viz_choro
#' @export
viz_choro   <- function(map, ...) add_layer(map, "choro", ...)

#' viz_typo
#' @export
viz_typo   <- function(map, ...) add_layer(map, "typo", ...)

#' viz_picto
#' @export
viz_picto   <- function(map, ...) add_layer(map, "picto", ...)

#' viz_propchoro
#' @export
viz_propchoro   <- function(map, ...) add_layer(map, "propchoro", ...)

#' viz_proptypo
#' @export
viz_proptypo   <- function(map, ...) add_layer(map, "proptypo", ...)

# Effects

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


#' viz_sketch
#' @export
viz_sketch   <- function(map, ...) add_layer(map, "sketch", ...)


#' viz_circle
#' @export
viz_circle   <- function(map, ...) add_layer(map, "circle", ...)

#' viz_square
#' @export
viz_square   <- function(map, ...) add_layer(map, "square", ...)

#' viz_spike
#' @export
viz_spike   <- function(map, ...) add_layer(map, "spike", ...)

#' viz_halfcircle
#' @export
viz_halfcircle   <- function(map, ...) add_layer(map, "halfcircle", ...)

#' viz_symbol
#' @export
viz_symbol   <- function(map, ...) add_layer(map, "symbol", ...)
