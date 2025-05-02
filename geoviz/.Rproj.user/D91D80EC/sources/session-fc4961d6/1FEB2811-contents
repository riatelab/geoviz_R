#' Create a new geo visualization
#'
#' @param projection Name of the projection (default: "NaturalEarth1")
#' @return A geo_pipeline object (JSON-compatible list)
#' @export
create_map <- function(projection = "NaturalEarth1") {
  structure(list(
    projection = projection,
    layers = list()
  ), class = "geo_pipeline")
}

#' Add graticule to the map
#' @param map A geo_pipeline object
#' @export
add_graticule <- function(map) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "graticule")))
  map
}

#' Add outline to the map
#' @param map A geo_pipeline object
#' @export
add_outline <- function(map) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "outline")))
  map
}

#' Add a header to the map
#' @param map A geo_pipeline object
#' @param text Text to display as header
#' @export
add_header <- function(map, text) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "header", text = text)))
  map
}

#' Render the map to HTML using htmlwidgets
#' @param map A geo_pipeline object
#' @export
render_geo <- function(map, width = NULL, height = NULL, elementId = NULL) {
  stopifnot(inherits(map, "geo_pipeline"))
  htmlwidgets::createWidget(
    name = "geo_widget",
    x = map,
    width = width,
    height = height,
    package = "rgeoviz",
    elementId = elementId
  )
}

# Méthode asJSON pour la classe geo_pipeline
asJSON.geo_pipeline <- function(x, ...) {
  # Convertir les objets params et layers en une structure simple
  list(
    projection = x$projection,
    layers = lapply(x$layers, function(layer) {
      if ("text" %in% names(layer)) {
        return(list(type = layer$type, text = layer$text))
      } else {
        return(list(type = layer$type))
      }
    })
  )
}

# Exemple d'utilisation
map <- create_map("NaturalEarth1") |>
  add_graticule() |>
  add_outline() |>
  add_header("Carte test")

# Convertir en JSON avec jsonlite
library(jsonlite)
json_str <- toJSON(asJSON(map), auto_unbox = TRUE, pretty = TRUE)

# Afficher le JSON
cat(json_str)
