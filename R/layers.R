#' @title Graticule layer
#' @description The \code{viz_graticule} function draws a graticule (latitude and longitude lines)
#' on the map. The spacing between lines can be uniform or specified separately for parallels
#' and meridians.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param step numeric or vector. Optional. Gap between graticules (default 10).
#' Can be a single value or a vector of two values (e.g. \code{c(10, 20)}).
#' @param stroke character. Optional. Stroke color (default "#9ad5e6").
#' @param fill character. Optional. Fill color (default "none").
#' @param strokeWidth numeric. Optional. Stroke width (default 0.8).
#' @param strokeLinecap character. Optional. Stroke line cap (default "square").
#' @param strokeLinejoin character. Optional. Stroke line join (default "round").
#' @param strokeDasharray numeric or vector. Optional. Stroke dash pattern (default 2).
#' @param ... Additional SVG attributes (e.g. \code{opacity}, etc.).
#' @export
#' @examples
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_graticule(step = c(10, 20), stroke = "#38896F") |>
#'   viz_render()
viz_graticule <- function(
  map,
  id = NULL,
  step = 10,
  stroke = "#9ad5e6",
  fill = "none",
  strokeWidth = 0.8,
  strokeLinecap = "square",
  strokeLinejoin = "round",
  strokeDasharray = 2,
  ...
) {
  add_layer(
    map,
    "graticule",
    id = id,
    step = step,
    stroke = stroke,
    fill = fill,
    strokeWidth = strokeWidth,
    strokeLinecap = strokeLinecap,
    strokeLinejoin = strokeLinejoin,
    strokeDasharray = strokeDasharray,
    ...
  )
}

#' @title Outline layer
#' @description The \code{viz_outline} function draws the Earth outline according
#' to the current map projection. This layer can be used as a background or clipping reference.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param stroke character. Optional. Stroke color (default "none").
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param fill character. Optional. Fill color (default "#B5DFFD").
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_outline(fill = "#38896F") |>
#'   viz_render()
viz_outline <- function(
  map,
  id = NULL,
  stroke = "none",
  strokeWidth = 1,
  fill = "#B5DFFD",
  ...
) {
  add_layer(
    map,
    "outline",
    id = id,
    stroke = stroke,
    strokeWidth = strokeWidth,
    fill = fill,
    ...
  )
}

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
#'   quiet = TRUE
#' )
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_header(text = "Hello World", fill = "#38896F") |>
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
#'   quiet = TRUE
#' )
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_footer(text = "Source, author, note, etc.", fill = "#38896F") |>
#'   viz_render()
viz_footer <- function(map, id = NULL, text = "Author, source...", fill = "#9e9696", background_fill = "white", background_stroke = "white", background_strokeWidth = 1, dominantBaseline = "central", textAnchor = "middle", lineSpacing = 0, margin = 1, fontSize = 10, fontFamily = NULL, dx = 0, dy = 0, ...) {
  add_layer(map, "footer", id = id, text = text, fill = fill, background_fill = background_fill, background_stroke = background_stroke, background_strokeWidth = background_strokeWidth, dominantBaseline = dominantBaseline, textAnchor = textAnchor, lineSpacing = lineSpacing, margin = margin, fontSize = fontSize, fontFamily = fontFamily, dx = dx, dy = dy, ...)
}

#' @title Path layer
#' @description The \code{viz_path} function draws geometries from a spatial data frame
#' as SVG paths. This function can be used to display polygons, lines, or points,
#' and supports styling, simplification, and interaction.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param data object. A spatial data frame. Use \code{data} to enable iteration
#' (e.g. for styling with functions).
#' @param datum object. A spatial data frame. Use \code{datum} if no iteration is needed.
#' @param id character. Optional. Unique layer id.
#' @param coords character. Optional. Coordinate system (default "geo").
#' Use \code{"svg"} if coordinates are already expressed in the SVG coordinate space.
#' @param clip logical. Optional. Whether to clip geometries with the outline (default TRUE).
#' @param fill character or function. Optional. Fill color. Functions can be used
#' for choropleth maps or typologies.
#' @param stroke character or function. Optional. Stroke color. Functions can be used
#' for choropleth maps or typologies.
#' @param strokeWidth numeric or function. Optional. Stroke width (default 1).
#' @param tip logical or function. Optional. Tooltip definition (default FALSE).
#' Use TRUE to display all fields.
#' @param simplify numeric, vector, or logical. Optional. Geometry simplification (default FALSE).
#' TRUE for automatic simplification, numeric for fixed tolerance,
#' or vector \code{c(k1, k2)} for dynamic simplification depending on zoom level.
#' @param rewind logical. Optional. Rewind polygon rings to correct winding order (default FALSE).
#' @param rewindPole logical. Optional. Special rewinding for geometries crossing poles
#' or the dateline (default FALSE).
#' @param clipOutline numeric or logical. Optional. Clip geometries near the antimeridian
#' and poles (default 0). If TRUE, uses 0.01 degrees.
#' @param r numeric. Optional. Radius for point geometries (default 3).
#' You can also use the shorthand \code{r}.
#' @param ... Additional SVG attributes (e.g. \code{strokeDasharray}, \code{opacity},
#' \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE)
#' viz_create(projection = "EqualEarth") |>
#'   viz_path(data = world, fill = "#38896F", stroke = "white") |>
#'   viz_render()
viz_path <- function(
  map,
  data = NULL,
  datum = NULL,
  id = NULL,
  coords = "geo",
  clip = TRUE,
  fill = NULL,
  stroke = NULL,
  strokeWidth = 1,
  tip = FALSE,
  simplify = FALSE,
  rewind = FALSE,
  rewindPole = FALSE,
  clipOutline = 0,
  r = 3,
  ...
) {
  add_layer(
    map,
    "path",
    data = data,
    datum = datum,
    id = id,
    coords = coords,
    clip = clip,
    fill = fill,
    stroke = stroke,
    strokeWidth = strokeWidth,
    tip = tip,
    simplify = simplify,
    rewind = rewind,
    rewindPole = rewindPole,
    clipOutline = clipOutline,
    r = r,
    ...
  )
}

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
# @examples
# library(sf)
# world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#                  quiet = TRUE)
# # Example 1
# viz_create(projection = "EqualEarth", width = 750, background = "white") |>
#   viz_path(datum = world, fill = "#f1f3f5") |>
#   viz_text(pos = c(100, 200),
#            coords = "svg",
#            text = "All maps are lies,\nbut some are useful lies",
#            fill = "#38896F") |>
#   viz_render()
# # Example 2
# viz_create(projection = "EqualEarth", background = "white") |>
#   viz_path(datum = world, fill = "#f1f3f5") |>
#   viz_text(data = world, text = "ISO3", fill = "#38896F") |>
#   viz_render()
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
#'   quiet = TRUE
#' )
#' viz_create(projection = "Mercator", background = "white") |>
#'   viz_path(datum = world[world$region == "Africa", ], fill = "#f1f3f5") |>
#'   viz_north(fill = "#38896F") |>
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
#'   quiet = TRUE
#' )
#' viz_create(projection = "Mercator", background = "white") |>
#'   viz_path(datum = world[world$region == "Africa", ], fill = "#f1f3f5") |>
#'   viz_scalebar() |>
#'   viz_render()
viz_scalebar <- function(map, id = NULL, pos = NULL, translate = "", units = "km", label = "", tickSize = 0.2, tickPadding = 5, distance = "", tickValues = "", labelAnchor = "start", ...) {
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
#'   quiet = TRUE
#' )
#' viz_create(projection = "Polar", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_tissot(fill = "#38896F") |>
#'   viz_render()
viz_tissot <- function(map, id = NULL, step = 20, fill = "red", stroke = "white", strokeOpacity = 0.5, ...) {
  add_layer(map, "tissot", id = id, step = step, fill = fill, stroke = stroke, strokeOpacity = strokeOpacity, ...)
}

#' @title Rhumb lines layer
#' @description The \code{viz_rhumbs} function draws rhumb lines (loxodromes),
#' similar to those found on old portolan charts. These lines represent paths of constant bearing.
#' @param map A \code{geoviz} map created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param nb numeric. Optional. Number of lines (default 16).
#' @param pos numeric vector. Optional. Position of the lines (default c(10, 10)).
#' If \code{coords = "svg"}, values are in SVG coordinates. If \code{coords = "geo"},
#' values are longitude and latitude.
#' @param coords character. Optional. Coordinate system for \code{pos} (default "svg").
#' If \code{coords = "geo"} and the map is zoomable, lines follow zoom interactions.
#' @param stroke character. Optional. Stroke color (default "#394a70").
#' @param strokeWidth numeric. Optional. Stroke width (default 1).
#' @param strokeOpacity numeric. Optional. Stroke opacity (default 0.3).
#' @param strokeDasharray numeric or vector. Optional. Stroke dash pattern (default c(3, 2)).
#' @param ... Additional SVG attributes (e.g. \code{opacity}, \code{strokeLinecap}, etc.).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_rhumbs(nb = 32, coords = "geo", pos = c(0, 0), fill = "#38896F") |>
#'   viz_render()
viz_rhumbs <- function(
  map,
  id = NULL,
  nb = 16,
  pos = c(10, 10),
  coords = "svg",
  stroke = "#394a70",
  strokeWidth = 1,
  strokeOpacity = 0.3,
  strokeDasharray = c(3, 2),
  ...
) {
  add_layer(
    map,
    "rhumbs",
    id = id,
    nb = nb,
    pos = pos,
    coords = coords,
    stroke = stroke,
    strokeWidth = strokeWidth,
    strokeOpacity = strokeOpacity,
    strokeDasharray = strokeDasharray,
    ...
  )
}
