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

#' @title Map title
#' @description The \code{viz_header} function adds a title above a geoviz map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param text character. Optional. Title text to display (default "Map title").
#' @param fill character. Optional. Text color (default "#9e9696").
#' @param background_fill character. Optional. Background fill color (default "white").
#' @param background_stroke character. Optional. Background stroke color (default "white").
#' @param background_strokeWidth numeric. Optional. Background stroke width (default 1).
#' @param dominantBaseline character. Optional. Vertical text alignment.
#' One of "hanging", "middle", "central", "bottom" (default "central").
#' @param textAnchor character. Optional. Horizontal text alignment.
#' One of "start", "middle", "end" (default "middle").
#' @param lineSpacing numeric. Optional. Space between lines (default 0).
#' @param margin numeric. Optional. Margin around header (default 8).
#' @param fontSize numeric. Optional. Font size (default 26).
#' @param fontFamily character. Optional. Font family (default container font).
#' @param dx numeric. Optional. X offset (default 0).
#' @param dy numeric. Optional. Y offset (default 0).
#' @param ... Additional SVG attributes applied to the text or background elements.
#' @export
#'
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_header(text = "Hello World", fill = "#38896F" ) |>
#'   viz_render()
viz_header <- function(
    map,
    id = NULL,
    text = "Map title",
    fill = "#9e9696",
    background_fill = "white",
    background_stroke = "white",
    background_strokeWidth = 1,
    dominantBaseline = "central",
    textAnchor = "middle",
    lineSpacing = 0,
    margin = 8,
    fontSize = 26,
    fontFamily = NULL,
    dx = 0,
    dy = 0,
    ...
) {
  add_layer(
    map,
    "header",
    id = id,
    text = text,
    fill = fill,
    background_fill = background_fill,
    background_stroke = background_stroke,
    background_strokeWidth = background_strokeWidth,
    dominantBaseline = dominantBaseline,
    textAnchor = textAnchor,
    lineSpacing = lineSpacing,
    margin = margin,
    fontSize = fontSize,
    fontFamily = fontFamily,
    dx = dx,
    dy = dy,
    ...
  )
}

#' @title Earth raster layer
#' @description The \code{viz_earth} function displays PNG images representing the Earth's surface
#' (Natural Earth dataset or custom source). The image is projected on-the-fly. The images are hosted on GitHub. You will need an internet connection.
#' This function is only relevant at the world scale.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param url character. Optional. Image source. Can be one of
#' ("GRAY_50M_SR","GRAY_50M_SR_OB","GRAY_50M_SR_W","HYP_50M_SR","HYP_50M_SR_W","MSR_50M",
#' "NE1_50M_SR_W","NE2_50M_SR","NE2_50M_SR_W","OB_50M","PRIMSA_SR_50M","SR_50M")
#' or a custom URL. Default is "NE2_50M_SR_W".
#' @param resolution numeric. Optional. Resolution factor (default 1).
#' Increase for sharper rendering (e.g. 2 for Retina, 3 for high-quality export).
#' @param tileSize numeric. Optional. Tile size (default 1024).
#' @param opacity numeric. Optional. Layer opacity (default 1).
#' @param dx numeric. Optional. Horizontal shift (default 0).
#' @param dy numeric. Optional. Vertical shift (default 0).
#' @param clipPath object. Optional. GeoJSON used to clip the image (default uses map outline).
#' @param max_canvas_size numeric. Optional. Maximum raster size (in pixels) before tiling (e.g. 2048).
#' @export
#' @examples
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_earth(url = "NE2_50M_SR_W", resolution = 2) |>
#'   viz_render()
viz_earth <- function(map, id = NULL, url = "NE2_50M_SR_W", resolution = 1, tileSize = 1024, opacity = 1, dx = 0, dy = 0, clipPath = NULL, max_canvas_size = NULL) {
  add_layer(map, "earth", id = id, url = url, resolution = resolution, tileSize = tileSize, opacity = opacity, dx = dx, dy = dy, clipPath = clipPath, max_canvas_size = max_canvas_size)
}

#' @title Source of the map
#' @description The \code{viz_footer} function adds a text below a geoviz map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param text character. Optional. Footer text to display (default "Author, source...").
#' @param fill character. Optional. Text color (default "#9e9696").
#' @param background_fill character. Optional. Background fill color (default "white").
#' @param background_stroke character. Optional. Background stroke color (default "white").
#' @param background_strokeWidth numeric. Optional. Background stroke width (default 1).
#' @param dominantBaseline character. Optional. Vertical text alignment (default "central", values "hanging","middle","central","bottom").
#' @param textAnchor character. Optional. Horizontal text alignment (default "middle", values "start","middle","end").
#' @param lineSpacing numeric. Optional. Line spacing (default 0).
#' @param margin numeric. Optional. Margin (default 1).
#' @param fontSize numeric. Optional. Font size (default 10).
#' @param fontFamily character. Optional. Font family (default container font).
#' @param dx numeric. Optional. X shift (default 0).
#' @param dy numeric. Optional. Y shift (default 0).
#' @param ... Additional SVG attributes applied to text and background elements.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_footer(text = "Source, author, note, etc.", fill = "#38896F" ) |>
#'   viz_render()
viz_footer <- function(map, id = NULL, text = "Author, source...", fill = "#9e9696", background_fill = "white", background_stroke = "white", background_strokeWidth = 1, dominantBaseline = "central", textAnchor = "middle", lineSpacing = 0, margin = 1, fontSize = 10, fontFamily = NULL, dx = 0, dy = 0, ...) {
  add_layer(map, "footer", id = id, text = text, fill = fill, background_fill = background_fill, background_stroke = background_stroke, background_strokeWidth = background_strokeWidth, dominantBaseline = dominantBaseline, textAnchor = textAnchor, lineSpacing = lineSpacing, margin = margin, fontSize = fontSize, fontFamily = fontFamily, dx = dx, dy = dy, ...)
}

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
  #' viz_create(projection = "EqualEarth", width = 750, zoomable = TRUE) |>
  #'   viz_path(data = world, fill = "#38896F") |>
  #'   viz_render()
viz_path   <- function(map, ...) add_layer(map, "path", ...)


#' @title Mercator tiles
#' @description The \code{viz_tile} function adds raster zoomable tiles to a map
#' It requires a Mercator projection.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param tileSize numeric. Optional. Tile size (default 512).
#' @param zoomDelta numeric. Optional. Zoom offset (default 1).
#' @param opacity numeric. Optional. Tile opacity (default 1).
#' @param url function or character. Optional. Tile source URL or preset ("openstreetmap","opentopomap","worldterrain","worldimagery","worldStreet","worldphysical","shadedrelief","stamenterrain","cartodbvoyager","stamentoner","stamentonerbackground","stamentonerlite","stamenwatercolor","hillshade","worldocean","natgeo").
#' @param clipPath character. Optional. SVG clip-path definition (e.g. "url(#myclipid)").
#' @export
#' @examples
#' viz_create(projection = "mercator") |>
#'   viz_tile(url = "worldphysical") |>
#'   viz_render()
viz_tile <- function(map, id = NULL, tileSize = 512, zoomDelta = 1, opacity = 1, url = "openstreetmap", clipPath = NULL) {
  add_layer(map, "tile", id = id, tileSize = tileSize, zoomDelta = zoomDelta, opacity = opacity, url = url, clipPath = clipPath)
}

#' @title Texts and labels
#' @description The \code{viz_text} function adds a text on a geoviz map
#' and can also generate labels from a spatial dataframe.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data a spatial dataframe.
#' @param id character. Optional. Unique layer id.
#' @param text character or function. Optional. Text to display (default "text").
#' @param textAnchor character or function. Optional. Text anchor ("start","middle","end").
#' @param dominantBaseline character or function. Optional. Baseline alignment ("auto","middle","central","hanging").
#' @param fontFamily character. Optional. Font family from SVG container.
#' @param fontSize numeric. Optional. Font size (default 12).
#' @param lineSpacing numeric. Optional. Line spacing (default 0).
#' @param pos numeric vector of length 2. Optional. Position for single text element (default c(0,0)).
#' @param dx numeric. Optional. X shift (default 0).
#' @param dy numeric. Optional. Y shift (default 0).
#' @param sort character or function. Optional. Field or function used to sort labels.
#' @param descending logical. Optional. Sorting order (default FALSE).
#' @param coords character. Optional. Coordinate system ("geo" or "svg") (default "geo").
#' @param fill character or function. Optional. Fill color.
#' @param stroke character or function. Optional. Stroke color.
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param strokeLinejoin character or function. Optional. Stroke line join (default "round").
#' @param ... Additional SVG attributes applied to text elements.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' # Example 1
#' viz_create(projection = "EqualEarth", width = 750, background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_text(pos = c(100, 200), coords = "svg", text = "All maps are lies,\nbut some are useful lies", fill = "#38896F") |>
#'   viz_render()
#' # Example 2
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_text(data = world, text = "ISO3", fill = "#38896F") |>
#'   viz_render()
viz_text <- function(map, id = NULL, data = NULL, text = "text", textAnchor = NULL, dominantBaseline = NULL, fontFamily = NULL, fontSize = 12, lineSpacing = 0, pos = c(0, 0), dx = 0, dy = 0, sort = NULL, descending = FALSE, coords = "geo", fill = NULL, stroke = NULL, strokeWidth = 1, strokeLinejoin = "round", ...) {
  add_layer(map, "text", id = id, data = data, text = text, textAnchor = textAnchor, dominantBaseline = dominantBaseline, fontFamily = fontFamily, fontSize = fontSize, lineSpacing = lineSpacing, pos = pos, dx = dx, dy = dy, sort = sort, descending = descending, coords = coords, fill = fill, stroke = stroke, strokeWidth = strokeWidth, strokeLinejoin = strokeLinejoin, ...)
}


#' @title North arrow
#' @description The \code{viz_north} function adds a north arrow a geoviz map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Position [x, y] on the page (default c(svg.width - 30, 30)).
#' @param scale numeric. Optional. Scaling factor for the arrow (default 1).
#' @param rotate numeric. Optional. Rotation angle. If NA, it is automatically calculated.
#' @param fill character. Optional. Fill color (default "black").
#' @param fillOpacity numeric. Optional. Fill opacity (default 1).
#' @param ... Additional SVG attributes applied to the arrow.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "Mercator", background = "white") |>
#'   viz_path(datum = world[world$region == "Africa",], fill = "#f1f3f5") |>
#'   viz_north(fill = "#38896F" ) |>
#'   viz_render()
viz_north <- function(map, id = NULL, pos = NULL, scale = 1, rotate = NULL, fill = "black", fillOpacity = 1, ...) {
  add_layer(map, "north", id = id, pos = pos, scale = scale, rotate = rotate, fill = fill, fillOpacity = fillOpacity, ...)
}

#' @title Scale bar
#' @description The \code{viz_scalebar} function adds a scalebar on the map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Position [x, y] (default c(10, svg.height - 20)).
#' @param translate numeric vector of length 2. Optional. Translation without changing size (default NA).
#' @param units character. Optional. Units ("m","km","mi","ft") (default "km").
#' @param label character. Optional. Label to display.
#' @param tickSize numeric. Optional. Tick size (default 0.2).
#' @param tickPadding numeric. Optional. Tick padding (default 5).
#' @param distance numeric. Optional. Distance represented by the scalebar.
#' @param tickValues numeric vector. Optional. Custom tick values.
#' @param labelAnchor character. Optional. Label anchor ("start","middle","end") (default "start").
#' @param ... Additional SVG attributes applied to the scalebar.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "Mercator", background = "white") |>
#'   viz_path(datum = world[world$region == "Africa",], fill = "#f1f3f5") |>
#'   viz_scalebar() |>
#'   viz_render()
viz_scalebar <- function(map, id = NULL, pos = NULL, translate = "", units = "km", label = "", tickSize = 0.2, tickPadding = 5, distance = "", tickValues ="", labelAnchor = "start", ...) {
  add_layer(map, "scalebar", id = id, pos = pos, translate = translate, units = units, label = label, tickSize = tickSize, tickPadding = tickPadding, distance = distance, tickValues = tickValues, labelAnchor = labelAnchor, ...)
}


#' @title Tissot indicatrices
#' @description The \code{viz_tissot} function draws Tissot circles to visualize projection distortions on a map.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param step numeric. Optional. Step between circles (default 20).
#' @param fill character. Optional. Fill color (default "red").
#' @param stroke character. Optional. Stroke color (default "white").
#' @param strokeOpacity numeric. Optional. Stroke opacity (default 0.5).
#' @param ... Additional SVG attributes (strokeDasharray, strokeWidth, opacity, strokeLinecap...).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "Polar", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_tissot(fill = "#38896F", fillOpacity = 1 ) |>
#'   viz_render()
viz_tissot <- function(map, id = NULL, step = 20, fill = "red", stroke = "white", strokeOpacity = 0.5, ...) {
  add_layer(map, "tissot", id = id, step = step, fill = fill, stroke = stroke, strokeOpacity = strokeOpacity, ...)
}

#' @title viz_rhumbs
#' @export
#'
viz_rhumbs   <- function(map, ...) add_layer(map, "rhumbs", ...)
