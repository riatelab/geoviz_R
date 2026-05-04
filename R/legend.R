#' Add a box legend
#'
#' The \code{viz_leg_box} function creates a box legend. The function adds a
#' legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param rect_width numeric. Optional. Width of the box (default 25).
#' @param rect_height numeric. Optional. Height of the box (default 17).
#' @param rect_fill character. Optional. Box fill color (default "#5d6266").
#' @param rect_stroke character. Optional. Stroke color (default "#303030").
#' @param rect_strokeWidth numeric. Optional. Stroke width (default 0.1).
#' @param label character. Optional. Text displayed (default "").
#' @param label_fill character. Optional. Text color (default "#363636").
#' @param label_fontSize numeric. Optional. Text size (default 10).
#' @param label_dx numeric. Optional. Horizontal shift (default 5).
#' @param label_dominantBaseline character. Optional. Dominant baseline (default "central").
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title font size (default 16).
#' @param subtitle character. Optional. Subtitle of the legend (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle font size (default 12).
#' @param note character. Optional. Note displayed above the legend (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note font size (default 10).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill color (default "white").
#' @param frame_stroke character. Optional. Frame stroke color (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame fill opacity (default 0.5).
#' @param ... Additional SVG attributes passed to elements (e.g. rect_*, label_*,
#' title_*, subtitle_*, note_*, frame_*, text_*).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_box(pos = c(20, 20), label = "Hello") |>
#'   viz_render()
viz_leg_box <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  rect_width = 25,
  rect_height = 17,
  rect_fill = "#5d6266",
  rect_stroke = "#303030",
  rect_strokeWidth = 0.1,
  label = "",
  label_fill = "#363636",
  label_fontSize = 10,
  label_dx = 5,
  label_dominantBaseline = "central",
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_box",
    id = id,
    pos = pos,
    gap = gap,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_fill = rect_fill,
    rect_stroke = rect_stroke,
    rect_strokeWidth = rect_strokeWidth,
    label = label,
    label_fill = label_fill,
    label_fontSize = label_fontSize,
    label_dx = label_dx,
    label_dominantBaseline = label_dominantBaseline,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a vertical typology legend
#'
#' The \code{viz_leg_typo_vertical} function creates a vertical legend for
#' typology layers. The function adds a legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param types character vector. Optional. Types (default c("A", "B", "C", "D")).
#' @param colors character vector. Optional. Colors (default c("#e41a1c", "#377eb8", "#4daf4a", "#984ea3")).
#' @param alphabetical logical. Optional. Alphabetical order (default TRUE).
#' @param rect_width numeric. Optional. Width of the boxes (default 25).
#' @param rect_height numeric. Optional. Height of the boxes (default 17).
#' @param rect_spacing numeric. Optional. Spacing between boxes (default 3).
#' @param rect_fill character. Optional. Box fill color (default "#5d6266").
#' @param rect_stroke character. Optional. Stroke color (default "#303030").
#' @param rect_strokeWidth numeric. Optional. Stroke width (default 0.1).
#' @param values_textAnchor character. Optional. Text anchor (default "middle").
#' @param values_dx numeric. Optional. Horizontal shift (default 0).
#' @param values_dy numeric. Optional. Vertical shift (default 5).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title font size (default 16).
#' @param subtitle character. Optional. Subtitle of the legend (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle font size (default 12).
#' @param note character. Optional. Note displayed above the legend (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note font size (default 10).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill color (default "white").
#' @param frame_stroke character. Optional. Frame stroke color (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame fill opacity (default 0.5).
#' @param ... Additional SVG attributes passed to elements (e.g. rect_*, title_*,
#' subtitle_*, note_*, frame_*, text_*).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_typo_vertical(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_typo_vertical <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  types = c("A", "B", "C", "D"),
  colors = c("#e41a1c", "#377eb8", "#4daf4a", "#984ea3"),
  alphabetical = TRUE,
  rect_width = 25,
  rect_height = 17,
  rect_spacing = 3,
  rect_fill = "#5d6266",
  rect_stroke = "#303030",
  rect_strokeWidth = 0.1,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_typo_vertical",
    id = id,
    pos = pos,
    gap = gap,
    types = types,
    colors = colors,
    alphabetical = alphabetical,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_spacing = rect_spacing,
    rect_fill = rect_fill,
    rect_stroke = rect_stroke,
    rect_strokeWidth = rect_strokeWidth,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}


#' Add a horizontal typology legend
#'
#' The \code{viz_leg_typo_horizontal} function creates a horizontal legend for
#' typology layers. The function adds a legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param types character vector. Optional. Types (default c("A", "B", "C", "D")).
#' @param colors character vector. Optional. Colors (default c("#e41a1c", "#377eb8", "#4daf4a", "#984ea3")).
#' @param alphabetical logical. Optional. Alphabetical order (default TRUE).
#' @param rect_width numeric. Optional. Width of the boxes (default 50).
#' @param rect_height numeric. Optional. Height of the boxes (default 14).
#' @param rect_spacing numeric. Optional. Spacing between boxes (default 0).
#' @param rect_fill character. Optional. Box fill color (default "#5d6266").
#' @param rect_stroke character. Optional. Stroke color (default "#303030").
#' @param rect_strokeWidth numeric. Optional. Stroke width (default 0.1).
#' @param values_textAnchor character. Optional. Text anchor (default "middle").
#' @param values_dx numeric. Optional. Horizontal shift (default 0).
#' @param values_dy numeric. Optional. Vertical shift (default 5).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title font size (default 16).
#' @param subtitle character. Optional. Subtitle of the legend.
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle font size (default 12).
#' @param note character. Optional. Note displayed above the legend.
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note font size (default 10).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill color (default "white").
#' @param frame_stroke character. Optional. Frame stroke color (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame fill opacity (default 0.5).
#' @param ... Additional SVG attributes passed to elements (e.g. rect_*, title_*,
#' subtitle_*, note_*, frame_*, text_*).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_typo_horizontal(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_typo_horizontal <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  types = c("A", "B", "C", "D"),
  colors = c("#e41a1c", "#377eb8", "#4daf4a", "#984ea3"),
  alphabetical = TRUE,
  rect_width = 50,
  rect_height = 14,
  rect_spacing = 0,
  rect_fill = "#5d6266",
  rect_stroke = "#303030",
  rect_strokeWidth = 0.1,
  values_textAnchor = "middle",
  values_dx = 0,
  values_dy = 5,
  values_fill = "#363636",
  values_fontSize = 10,
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_typo_horizontal",
    id = id,
    pos = pos,
    gap = gap,
    types = types,
    colors = colors,
    alphabetical = alphabetical,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_spacing = rect_spacing,
    rect_fill = rect_fill,
    rect_stroke = rect_stroke,
    rect_strokeWidth = rect_strokeWidth,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a horizontal choropleth legend
#'
#' The \code{viz_leg_choro_horizontal} function creates a horizontal legend for
#' choropleth layers. The function adds a legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param breaks numeric vector. Optional. Break values (default c(1, 2, 3, 4, 5)).
#' @param colors character vector. Optional. Colors (default c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d")).
#' @param rect_width numeric. Optional. Width of the boxes (default 50).
#' @param rect_height numeric. Optional. Height of the boxes (default 14).
#' @param rect_spacing numeric. Optional. Spacing between boxes (default 0).
#' @param rect_fill character. Optional. Box fill color (default "#5d6266").
#' @param rect_stroke character. Optional. Stroke color (default "#303030").
#' @param rect_strokeWidth numeric. Optional. Stroke width (default 0.1).
#' @param values_textAnchor character. Optional. Text anchor (default "middle").
#' @param values_dx numeric. Optional. Horizontal shift (default 0).
#' @param values_dy numeric. Optional. Vertical shift (default 5).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Multiplication factor for displayed values (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title font size (default 16).
#' @param subtitle character. Optional. Subtitle of the legend (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle font size (default 12).
#' @param note character. Optional. Note displayed above the legend (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note font size (default 10).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill color (default "white").
#' @param frame_stroke character. Optional. Frame stroke color (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame fill opacity (default 0.5).
#' @param ... Additional SVG attributes passed to elements (e.g. rect_*, title_*,
#' subtitle_*, note_*, frame_*, text_*).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_choro_horizontal(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_choro_horizontal <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  breaks = c(1, 2, 3, 4, 5),
  colors = c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d"),
  rect_width = 50,
  rect_height = 14,
  rect_spacing = 0,
  rect_fill = "#5d6266",
  rect_stroke = "#303030",
  rect_strokeWidth = 0.1,
  values_textAnchor = "middle",
  values_dx = 0,
  values_dy = 5,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_choro_horizontal",
    id = id,
    pos = pos,
    gap = gap,
    breaks = breaks,
    colors = colors,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_spacing = rect_spacing,
    rect_fill = rect_fill,
    rect_stroke = rect_stroke,
    rect_strokeWidth = rect_strokeWidth,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a vertical gradient legend
#'
#' The \code{viz_leg_gradient_vertical} function creates a vertical gradient legend.
#' It draws a series of colored rectangles with three labels aligned at top,
#' middle, and bottom. The function adds a legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Position of the legend (default c(0, 0)).
#' @param gap numeric. Optional. Gap between title/subtitle and rectangles (default 5).
#' @param colors character vector. Optional. Colors of the gradient (default c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d")).
#' @param rect_width numeric. Optional. Rectangle width (default 8).
#' @param rect_height numeric. Optional. Rectangle height (default 25).
#' @param rect_spacing numeric. Optional. Spacing between rectangles (default 0).
#' @param rect_stroke character. Optional. Stroke color of rectangles (default "white").
#' @param values_fontSize numeric. Optional. Font size of labels (default 12).
#' @param values_fill character. Optional. Label color (default "black").
#' @param text_high character. Optional. Label at top (default "High").
#' @param text_intermediate character. Optional. Label at middle (default "Intermediate").
#' @param text_low character. Optional. Label at bottom (default "Low").
#' @param reverse logical. Optional. Reverse the order of colors (default FALSE).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param ... Additional SVG attributes passed to elements.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_gradient_vertical(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_gradient_vertical <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 5,
  colors = c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d"),
  rect_width = 8,
  rect_height = 25,
  rect_spacing = 0,
  rect_stroke = "white",
  values_fontSize = 12,
  values_fill = "black",
  text_high = "High",
  text_intermediate = "Intermediate",
  text_low = "Low",
  reverse = FALSE,
  frame = FALSE,
  ...
) {
  add_layer(
    map,
    "leg_gradient_vertical",
    id = id,
    pos = pos,
    gap = gap,
    colors = colors,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_spacing = rect_spacing,
    rect_stroke = rect_stroke,
    values_fontSize = values_fontSize,
    values_fill = values_fill,
    text_high = text_high,
    text_intermediate = text_intermediate,
    text_low = text_low,
    reverse = reverse,
    frame = frame,
    ...
  )
}

#' Add a spike legend
#'
#' The \code{viz_leg_spikes} function adds a legend for spike marks.
#' It draws a series of spikes with heights proportional to values.
#' The function adds a legend layer to the SVG container.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param data numeric vector. Optional. Input values (default c(1, 200, 500, 1000)).
#' @param k numeric. Optional. Height of the highest spike (default 50).
#' @param fixmax numeric. Optional. Value mapped to height k.
#' @param nb numeric. Optional. Number of spikes (default 4).
#' @param spike_width numeric. Optional. Width of spikes (default 30).
#' @param spike_straight numeric. Optional. Shape of spikes (0 = curved, 1 = straight, default 0).
#' @param spike_spacing numeric. Optional. Spacing between spikes (default 3).
#' @param spike_fill character. Optional. Fill color (default "none").
#' @param spike_stroke character. Optional. Stroke color (default "black").
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. Shift in x (default 0).
#' @param values_dy numeric. Optional. Shift in y (default 5).
#' @param values_fill character. Optional. Label color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Multiplicative factor (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Title (default "").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_spikes(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_spikes <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  data = c(1, 1000),
  k = 50,
  fixmax = NULL,
  nb = 4,
  spike_width = 30,
  spike_straight = 0,
  spike_spacing = 3,
  spike_fill = "none",
  spike_stroke = "black",
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_spikes",
    id = id,
    pos = pos,
    gap = gap,
    data = data,
    k = k,
    fixmax = fixmax,
    nb = nb,
    spike_width = spike_width,
    spike_straight = spike_straight,
    spike_spacing = spike_spacing,
    spike_fill = spike_fill,
    spike_stroke = spike_stroke,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a proportional circles legend
#'
#' The \code{viz_leg_circles} function adds a legend for proportional circles.
#' It draws circles scaled by values, with optional reference lines and labels.
#' The function adds a legend layer to the SVG container.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param data numeric vector. Required. Input values.
#' @param k numeric. Optional. Radius of largest circle (default 50).
#' @param fixmax numeric. Optional. Value mapped to radius k.
#' @param nb numeric. Optional. Number of circles (default 4).
#' @param circle_fill character. Optional. Circle fill (default "none").
#' @param circle_stroke character. Optional. Circle stroke (default "#363636").
#' @param circle_spacing numeric. Optional. Spacing between circles (default 5).
#' @param line_stroke character. Optional. Line stroke color (default "#363636").
#' @param line_strokeDasharray character. Optional. Line dash style (default "1").
#' @param line_strokeWidth numeric. Optional. Line width (default 0.7).
#' @param line_length numeric. Optional. Line length (default 10).
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. X shift (default 5).
#' @param values_dy numeric. Optional. Y shift (default 0).
#' @param values_fill character. Optional. Label color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Scaling factor (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Title (default "").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_circles(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_circles <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  data = c(1, 1000),
  k = 50,
  fixmax = NULL,
  nb = 4,
  circle_fill = "none",
  circle_stroke = "#363636",
  circle_spacing = 5,
  line_stroke = "#363636",
  line_strokeDasharray = "1",
  line_strokeWidth = 0.7,
  line_length = 10,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_circles",
    id = id,
    pos = pos,
    gap = gap,
    data = data,
    k = k,
    fixmax = fixmax,
    nb = nb,
    circle_fill = circle_fill,
    circle_stroke = circle_stroke,
    circle_spacing = circle_spacing,
    line_stroke = line_stroke,
    line_strokeDasharray = line_strokeDasharray,
    line_strokeWidth = line_strokeWidth,
    line_length = line_length,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a nested proportional circles legend
#'
#' The \code{viz_leg_circles_nested} function adds a legend for nested proportional circles.
#' It displays circles with hierarchical/nested visual structure for comparative values.
#' The function adds a legend layer to the SVG container.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 5)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param data numeric vector. Required. Input values.
#' @param k numeric. Optional. Radius of largest circle (default 50).
#' @param fixmax numeric. Optional. Value mapped to radius k.
#' @param nb numeric. Optional. Number of circles (default 4).
#' @param circle_fill character. Optional. Fill color (default "none").
#' @param circle_stroke character. Optional. Stroke color (default "#363636").
#' @param line_stroke character. Optional. Line stroke color (default "#363636").
#' @param line_strokeDasharray character. Optional. Dash style (default "1").
#' @param line_strokeWidth numeric. Optional. Line width (default 0.7).
#' @param line_length numeric. Optional. Line length (default 10).
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. X shift (default 5).
#' @param values_dy numeric. Optional. Y shift (default 0).
#' @param values_fill character. Optional. Label color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Scaling factor (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Title (default "").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_circles_nested(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_circles_nested <- function(
  map,
  id = NULL,
  pos = c(0, 5),
  gap = 2,
  data = c(1, 1000),
  k = 50,
  fixmax = NULL,
  nb = 4,
  circle_fill = "none",
  circle_stroke = "#363636",
  line_stroke = "#363636",
  line_strokeDasharray = "1",
  line_strokeWidth = 0.7,
  line_length = 10,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_circles_nested",
    id = id,
    pos = pos,
    gap = gap,
    data = data,
    k = k,
    fixmax = fixmax,
    nb = nb,
    circle_fill = circle_fill,
    circle_stroke = circle_stroke,
    line_stroke = line_stroke,
    line_strokeDasharray = line_strokeDasharray,
    line_strokeWidth = line_strokeWidth,
    line_length = line_length,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a proportional squares legend
#'
#' The \code{viz_leg_squares} function adds a legend for proportional squares.
#' It displays squares scaled according to input values, optionally comparable via fixmax.
#' The function adds a legend layer to the SVG container.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param data numeric vector. Required. Input values.
#' @param k numeric. Optional. Side length of largest square (default 50).
#' @param fixmax numeric. Optional. Value mapped to side k.
#' @param nb numeric. Optional. Number of squares (default 4).
#' @param square_fill character. Optional. Fill color (default "none").
#' @param square_stroke character. Optional. Stroke color (default "#363636").
#' @param square_spacing numeric. Optional. Spacing between squares (default 5).
#' @param line_stroke character. Optional. Line stroke color (default "#363636").
#' @param line_strokeDasharray character. Optional. Dash pattern (default "1").
#' @param line_strokeWidth numeric. Optional. Line width (default 0.7).
#' @param line_length numeric. Optional. Line length (default 10).
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. X shift (default 5).
#' @param values_dy numeric. Optional. Y shift (default 0).
#' @param values_fill character. Optional. Label color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Scaling factor (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Title (default "").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_squares(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_squares <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  data = c(1, 1000),
  gap = 2,
  k = 50,
  fixmax = NULL,
  nb = 4,
  square_fill = "none",
  square_stroke = "#363636",
  square_spacing = 5,
  line_stroke = "#363636",
  line_strokeDasharray = "1",
  line_strokeWidth = 0.7,
  line_length = 10,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_squares",
    id = id,
    pos = pos,
    gap = gap,
    data = data,
    k = k,
    fixmax = fixmax,
    nb = nb,
    square_fill = square_fill,
    square_stroke = square_stroke,
    square_spacing = square_spacing,
    line_stroke = line_stroke,
    line_strokeDasharray = line_strokeDasharray,
    line_strokeWidth = line_strokeWidth,
    line_length = line_length,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a proportional nested squares legend
#'
#' The \code{viz_leg_squares_nested} function adds a legend for proportional nested squares.
#' It displays squares scaled according to input values, optionally comparable via fixmax.
#' The function adds a legend layer to the SVG container.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 5)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param data numeric vector. Required. Input values.
#' @param k numeric. Optional. Side length of largest square (default 50).
#' @param fixmax numeric. Optional. Value mapped to side k.
#' @param nb numeric. Optional. Number of squares (default 4).
#' @param square_fill character. Optional. Fill color (default "none").
#' @param square_stroke character. Optional. Stroke color (default "#363636").
#' @param square_spacing numeric. Optional. Spacing between squares (default 5).
#' @param line_stroke character. Optional. Line stroke color (default "#363636").
#' @param line_strokeDasharray character. Optional. Dash pattern (default "1").
#' @param line_strokeWidth numeric. Optional. Line width (default 0.7).
#' @param line_length numeric. Optional. Line length (default 10).
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. X shift (default 5).
#' @param values_dy numeric. Optional. Y shift (default 0).
#' @param values_fill character. Optional. Label color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Scaling factor (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Title (default "").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_squares_nested(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_squares_nested <- function(
  map,
  id = NULL,
  pos = c(0, 5),
  gap = 2,
  data = c(1, 1000),
  k = 50,
  fixmax = NULL,
  nb = 4,
  square_fill = "none",
  square_stroke = "#363636",
  square_spacing = 5,
  line_stroke = "#363636",
  line_strokeDasharray = "1",
  line_strokeWidth = 0.7,
  line_length = 10,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_squares_nested",
    id = id,
    pos = pos,
    gap = gap,
    data = data,
    k = k,
    fixmax = fixmax,
    nb = nb,
    square_fill = square_fill,
    square_stroke = square_stroke,
    square_spacing = square_spacing,
    line_stroke = line_stroke,
    line_strokeDasharray = line_strokeDasharray,
    line_strokeWidth = line_strokeWidth,
    line_length = line_length,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a proportional half-circles (mushrooms) legend
#'
#' The \code{viz_leg_mushrooms} function adds a legend for proportional half-circles.
#' It displays two sets of nested half-circles (top and bottom), each scaled according to input values.
#' The function adds a legend layer to the SVG container and returns the layer identifier.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param line_stroke character. Optional. Line stroke color (default "#363636").
#' @param line_strokeDasharray character. Optional. Dash pattern (default "1").
#' @param line_strokeWidth numeric. Optional. Line width (default 0.7).
#' @param line_length numeric. Optional. Line length (default 10).
#' @param top_data numeric vector. Optional. Input values for top half-circles.
#' @param top_k numeric. Optional. Radius of largest top half-circle (default 50).
#' @param top_fixmax numeric. Optional. Value mapped to radius k.
#' @param top_nb numeric. Optional. Number of top half-circles (default 4).
#' @param top_circle_fill character. Optional. Fill color (default "none").
#' @param top_circle_stroke character. Optional. Stroke color (default "black").
#' @param top_circle_cornerRadius numeric. Optional. Corner radius (default 5).
#' @param top_values_textAnchor character. Optional. Text anchor (default "start").
#' @param top_values_dx numeric. Optional. X shift (default 5).
#' @param top_values_dy numeric. Optional. Y shift (default 0).
#' @param top_values_factor numeric. Optional. Scaling factor (default 1).
#' @param top_values_decimal character. Optional. Decimal separator (default ".").
#' @param top_values_thousands character. Optional. Thousands separator (default " ").
#' @param top_title character. Optional. Title of top legend part (default "top_title").
#' @param bottom_data numeric vector. Optional. Input values for bottom half-circles.
#' @param bottom_k numeric. Optional. Radius of largest bottom half-circle (default 50).
#' @param bottom_fixmax numeric. Optional. Value mapped to radius k.
#' @param bottom_nb numeric. Optional. Number of bottom half-circles (default 4).
#' @param bottom_circle_fill character. Optional. Fill color (default "none").
#' @param bottom_circle_stroke character. Optional. Stroke color (default "black").
#' @param bottom_circle_cornerRadius numeric. Optional. Corner radius (default 5).
#' @param bottom_values_textAnchor character. Optional. Text anchor (default "start").
#' @param bottom_values_dx numeric. Optional. X shift (default 5).
#' @param bottom_values_dy numeric. Optional. Y shift (default 0).
#' @param bottom_values_factor numeric. Optional. Scaling factor (default 1).
#' @param bottom_values_decimal character. Optional. Decimal separator (default ".").
#' @param bottom_values_thousands character. Optional. Thousands separator (default " ").
#' @param bottom_title character. Optional. Title of bottom legend part (default "bottom_title").
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_mushrooms(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_mushrooms <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  line_stroke = "#363636",
  line_strokeDasharray = "1",
  line_strokeWidth = 0.7,
  line_length = 10,
  top_data = NULL,
  top_k = 50,
  top_fixmax = NULL,
  top_nb = 4,
  top_circle_fill = "none",
  top_circle_stroke = "black",
  top_circle_cornerRadius = 5,
  top_values_textAnchor = "start",
  top_values_dx = 5,
  top_values_dy = 0,
  top_values_factor = 1,
  top_values_decimal = ".",
  top_values_thousands = " ",
  top_title = "top_title",
  bottom_data = NULL,
  bottom_k = 50,
  bottom_fixmax = NULL,
  bottom_nb = 4,
  bottom_circle_fill = "none",
  bottom_circle_stroke = "black",
  bottom_circle_cornerRadius = 5,
  bottom_values_textAnchor = "start",
  bottom_values_dx = 5,
  bottom_values_dy = 0,
  bottom_values_factor = 1,
  bottom_values_decimal = ".",
  bottom_values_thousands = " ",
  bottom_title = "bottom_title",
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_mushrooms",
    id = id,
    pos = pos,
    gap = gap,
    line_stroke = line_stroke,
    line_strokeDasharray = line_strokeDasharray,
    line_strokeWidth = line_strokeWidth,
    line_length = line_length,
    top_data = top_data,
    top_k = top_k,
    top_fixmax = top_fixmax,
    top_nb = top_nb,
    top_circle_fill = top_circle_fill,
    top_circle_stroke = top_circle_stroke,
    top_circle_cornerRadius = top_circle_cornerRadius,
    top_values_textAnchor = top_values_textAnchor,
    top_values_dx = top_values_dx,
    top_values_dy = top_values_dy,
    top_values_factor = top_values_factor,
    top_values_decimal = top_values_decimal,
    top_values_thousands = top_values_thousands,
    top_title = top_title,
    bottom_data = bottom_data,
    bottom_k = bottom_k,
    bottom_fixmax = bottom_fixmax,
    bottom_nb = bottom_nb,
    bottom_circle_fill = bottom_circle_fill,
    bottom_circle_stroke = bottom_circle_stroke,
    bottom_circle_cornerRadius = bottom_circle_cornerRadius,
    bottom_values_textAnchor = bottom_values_textAnchor,
    bottom_values_dx = bottom_values_dx,
    bottom_values_dy = bottom_values_dy,
    bottom_values_factor = bottom_values_factor,
    bottom_values_decimal = bottom_values_decimal,
    bottom_values_thousands = bottom_values_thousands,
    bottom_title = bottom_title,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a vertical symbol legend
#'
#' The \code{viz_leg_symbol_vertical} function adds a vertical legend for symbol layers.
#' It displays categorized symbols arranged vertically with optional shapes and ordering.
#' The function creates a legend layer in the SVG container and returns the layer identifier.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param types character vector. Optional. Category labels (default c("A","B","C","D")).
#' @param symbols character vector. Optional. Symbol shapes (default c("circle","square","triangle","pentagon")).
#' @param alphabetical logical. Optional. Sort types alphabetically (default TRUE).
#' @param symbol_size numeric. Optional. Symbol size (default 10).
#' @param symbol_rotate numeric. Optional. Rotation angle (default 0).
#' @param symbol_spacing numeric. Optional. Spacing between symbols (default 4).
#' @param symbol_fill character. Optional. Symbol fill color (default "#2e2e2e").
#' @param symbol_stroke character. Optional. Symbol stroke color (default "#303030").
#' @param symbol_strokeWidth numeric. Optional. Symbol stroke width (default 0.5).
#' @param symbol_background logical. Optional. Add background circle (default FALSE).
#' @param values_textAnchor character. Optional. Text anchor (default "middle").
#' @param values_dx numeric. Optional. X shift (default 5).
#' @param values_dy numeric. Optional. Y shift (default 0).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#'
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_symbol_vertical(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_symbol_vertical <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  types = c("A", "B", "C", "D"),
  symbols = c("circle", "square", "triangle", "pentagon"),
  alphabetical = TRUE,
  symbol_size = 10,
  symbol_rotate = 0,
  symbol_spacing = 4,
  symbol_fill = "#2e2e2e",
  symbol_stroke = "#303030",
  symbol_strokeWidth = 0.5,
  symbol_background = FALSE,
  values_textAnchor = "middle",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_symbol_vertical",
    id = id,
    pos = pos,
    gap = gap,
    types = types,
    symbols = symbols,
    alphabetical = alphabetical,
    symbol_size = symbol_size,
    symbol_rotate = symbol_rotate,
    symbol_spacing = symbol_spacing,
    symbol_fill = symbol_fill,
    symbol_stroke = symbol_stroke,
    symbol_strokeWidth = symbol_strokeWidth,
    symbol_background = symbol_background,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a symbol horizontal legend
#'
#' The \code{viz_leg_symbol_horizontal} function adds a horizontal legend for symbol layers.
#' It displays a set of categorized symbols with optional shapes and ordering.
#' The function creates a legend layer in the SVG container and returns the layer identifier.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. Unique layer id.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param types character vector. Optional. Category labels (default c("A","B","C","D")).
#' @param symbols character vector. Optional. Symbol shapes (default c("circle","square","triangle","pentagon")).
#' @param alphabetical logical. Optional. Sort types alphabetically (default TRUE).
#' @param symbol_size numeric. Optional. Symbol size (default 10).
#' @param symbol_rotate numeric. Optional. Rotation angle (default 0).
#' @param symbol_spacing numeric. Optional. Spacing between symbols (default 4).
#' @param symbol_fill character. Optional. Symbol fill color (default "#2e2e2e").
#' @param symbol_stroke character. Optional. Symbol stroke color (default "#303030").
#' @param symbol_strokeWidth numeric. Optional. Symbol stroke width (default 0.5).
#' @param symbol_background logical. Optional. Add background circle (default FALSE).
#' @param values_textAnchor character. Optional. Text anchor (default "middle").
#' @param values_dx numeric. Optional. X shift (default 0).
#' @param values_dy numeric. Optional. Y shift (default 5).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title size (default 16).
#' @param subtitle character. Optional. Subtitle (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle size (default 12).
#' @param note character. Optional. Note (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note size (default 10).
#' @param frame logical. Optional. Draw frame (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill (default "white").
#' @param frame_stroke character. Optional. Frame stroke (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame opacity (default 0.5).
#' @param ... Additional SVG attributes.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_symbol_horizontal(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_symbol_horizontal <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  types = c("A", "B", "C", "D"),
  symbols = c("circle", "square", "triangle", "pentagon"),
  alphabetical = TRUE,
  symbol_size = 10,
  symbol_rotate = 0,
  symbol_spacing = 4,
  symbol_fill = "#2e2e2e",
  symbol_stroke = "#303030",
  symbol_strokeWidth = 0.5,
  symbol_background = FALSE,
  values_textAnchor = "middle",
  values_dx = 0,
  values_dy = 5,
  values_fill = "#363636",
  values_fontSize = 10,
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_symbol_horizontal",
    id = id,
    pos = pos,
    gap = gap,
    types = types,
    symbols = symbols,
    alphabetical = alphabetical,
    symbol_size = symbol_size,
    symbol_rotate = symbol_rotate,
    symbol_spacing = symbol_spacing,
    symbol_fill = symbol_fill,
    symbol_stroke = symbol_stroke,
    symbol_strokeWidth = symbol_strokeWidth,
    symbol_background = symbol_background,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    title = title,
    subtitle = subtitle,
    note = note,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}

#' Add a vertical choropleth legend
#'
#' The \code{viz_leg_choro_vertical} function creates a vertical legend for
#' choropleth layers. The function adds a legend layer to the map.
#'
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @param id character. Optional. ID of the layer.
#' @param pos numeric vector of length 2. Optional. Legend position (default c(0, 0)).
#' @param gap numeric. Optional. Gap between elements (default 2).
#' @param breaks numeric vector. Optional. Break values (default c(1, 2, 3, 4, 5)).
#' @param colors character vector. Optional. Colors (default c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d")).
#' @param rect_width numeric. Optional. Width of the boxes (default 25).
#' @param rect_height numeric. Optional. Height of the boxes (default 17).
#' @param rect_spacing numeric. Optional. Spacing between boxes (default 0).
#' @param rect_fill character. Optional. Box fill color (default "#5d6266").
#' @param rect_stroke character. Optional. Stroke color (default "#303030").
#' @param rect_strokeWidth numeric. Optional. Stroke width (default 0.1).
#' @param values_textAnchor character. Optional. Text anchor (default "start").
#' @param values_dx numeric. Optional. Horizontal shift (default 5).
#' @param values_dy numeric. Optional. Vertical shift (default 0).
#' @param values_fill character. Optional. Text color (default "#363636").
#' @param values_fontSize numeric. Optional. Font size (default 10).
#' @param values_factor numeric. Optional. Multiplication factor for displayed values (default 1).
#' @param values_decimal character. Optional. Decimal separator (default ".").
#' @param values_thousands character. Optional. Thousands separator (default " ").
#' @param title character. Optional. Legend title (default "Legend").
#' @param title_fill character. Optional. Title color (default "#363636").
#' @param title_fontSize numeric. Optional. Title font size (default 16).
#' @param subtitle character. Optional. Subtitle of the legend (default "").
#' @param subtitle_fill character. Optional. Subtitle color (default "#363636").
#' @param subtitle_fontSize numeric. Optional. Subtitle font size (default 12).
#' @param note character. Optional. Note displayed above the legend (default "").
#' @param note_fill character. Optional. Note color (default "#363636").
#' @param note_fontSize numeric. Optional. Note font size (default 10).
#' @param frame logical. Optional. Draw a frame around the legend (default FALSE).
#' @param frame_margin numeric. Optional. Frame margin (default 15).
#' @param frame_fill character. Optional. Frame fill color (default "white").
#' @param frame_stroke character. Optional. Frame stroke color (default "black").
#' @param frame_fillOpacity numeric. Optional. Frame fill opacity (default 0.5).
#' @param ... Additional SVG attributes passed to elements (e.g. rect_*, values_*,
#' title_*, subtitle_*, note_*, frame_*, text_*).
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geoviz"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", background = "white") |>
#'   viz_path(datum = world, fill = "#f1f3f5") |>
#'   viz_leg_choro_vertical(pos = c(20, 20)) |>
#'   viz_render()
viz_leg_choro_vertical <- function(
  map,
  id = NULL,
  pos = c(0, 0),
  gap = 2,
  breaks = c(1, 2, 3, 4, 5),
  colors = c("#fee5d9", "#fcae91", "#fb6a4a", "#cb181d"),
  rect_width = 25,
  rect_height = 17,
  rect_spacing = 0,
  rect_fill = "#5d6266",
  rect_stroke = "#303030",
  rect_strokeWidth = 0.1,
  values_textAnchor = "start",
  values_dx = 5,
  values_dy = 0,
  values_fill = "#363636",
  values_fontSize = 10,
  values_factor = 1,
  values_decimal = ".",
  values_thousands = " ",
  title = "Legend",
  title_fill = "#363636",
  title_fontSize = 16,
  subtitle = "",
  subtitle_fill = "#363636",
  subtitle_fontSize = 12,
  note = "",
  note_fill = "#363636",
  note_fontSize = 10,
  frame = FALSE,
  frame_margin = 15,
  frame_fill = "white",
  frame_stroke = "black",
  frame_fillOpacity = 0.5,
  ...
) {
  add_layer(
    map,
    "leg_choro_vertical",
    id = id,
    pos = pos,
    gap = gap,
    breaks = breaks,
    colors = colors,
    rect_width = rect_width,
    rect_height = rect_height,
    rect_spacing = rect_spacing,
    rect_fill = rect_fill,
    rect_stroke = rect_stroke,
    rect_strokeWidth = rect_strokeWidth,
    values_textAnchor = values_textAnchor,
    values_dx = values_dx,
    values_dy = values_dy,
    values_fill = values_fill,
    values_fontSize = values_fontSize,
    values_factor = values_factor,
    values_decimal = values_decimal,
    values_thousands = values_thousands,
    title = title,
    title_fill = title_fill,
    title_fontSize = title_fontSize,
    subtitle = subtitle,
    subtitle_fill = subtitle_fill,
    subtitle_fontSize = subtitle_fontSize,
    note = note,
    note_fill = note_fill,
    note_fontSize = note_fontSize,
    frame = frame,
    frame_margin = frame_margin,
    frame_fill = frame_fill,
    frame_stroke = frame_stroke,
    frame_fillOpacity = frame_fillOpacity,
    ...
  )
}
