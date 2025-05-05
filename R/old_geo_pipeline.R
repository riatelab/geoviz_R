create_map <- function(projection = "NaturalEarth1") {
  structure(list(
    projection = projection,
    layers = list()
  ), class = "geo_pipeline")
}

add_graticule <- function(map) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "graticule")))
  map
}

add_outline <- function(map) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "outline")))
  map
}

add_header <- function(map, text) {
  stopifnot(inherits(map, "geo_pipeline"))
  map$layers <- append(map$layers, list(list(type = "header", text = text)))
  map
}

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
