#' viz_grid
#' @export
viz_grid <- function(data, step = 20, type = "square",
                            width = 1000, height = 1000,
                            elementId = NULL) {

  # conversion sf → geojson côté R
  if (inherits(data, "sf")) {
    data <- geojsonsf::sf_geojson(data)
    data <- jsonlite::fromJSON(data, simplifyVector = FALSE)
  }

  # Préparer l'objet "svg" attendu par JS
  svg <- list(
    width = width,
    height = height,
    projection = NULL
  )

  # Préparer les options JS
  opts <- list(
    data = data,
    step = step,
    type = type
  )

  # Construire l'objet x qui sera passé au widget
  x <- list(
    svg = svg,
    opts = opts
  )

  # Créer l'HTMLWidget
  htmlwidgets::createWidget(
    name = "grid",
    x = x,
    width = width,
    height = height,
    package = "geoviz",
    elementId = elementId
  )
}
