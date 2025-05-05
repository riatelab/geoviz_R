library(sf)
library(jsonlite)
world <- st_read("../world.json")


library("sf")
world <- st_read("../world.json")

# Helpers
convert_sf_to_geojson <- function(x) {
  if (inherits(x, "sf")) {
    geojsonsf::sf_geojson(x)
  } else {
    x
  }
}

save_geojson <- function(geojson, filename) {
  # Écriture du fichier GeoJSON
  writeLines(geojson, con = filename)
  cat("Fichier GeoJSON sauvegardé sous :", filename, "\n")
}

toJSON <- function(map) {
  params_converted <- lapply(map$params, convert_sf_to_geojson)
  layers_converted <- lapply(map$layers, function(layer) {
    if ("data" %in% names(layer)) {
      layer$data <- convert_sf_to_geojson(layer$data)  # Conversion spécifique pour les objets spatiaux
    }
    return(layer)
  })
  map_combined <- list(
    params = params_converted,
    layers = layers_converted
  )

  return(jsonlite::toJSON(map_combined, pretty = TRUE, auto_unbox = TRUE))
}

# Create


# create <- function(...) {
#   args <- lapply(list(...), convert_sf_to_geojson)
#   structure(
#     c(args, list(params = list(...), layers = list())),
#     class = "d3carto"
#   )
# }

create <- function(...) {
structure(
    list(params = list(...), layers = list()),
    class = "d3carto"
  )
}

# Add Layers (generic)
add_layer <- function(map, type, ...) {
  if (!inherits(map, "d3carto")) {
    stop("L'objet 'map' doit être de classe 'd3carto'.")
  }
  layer <- c(list(type = type), list(...))
  map$layers <- append(map$layers, list(layer))
  return(map)
}

# Type layers
graticule <- function(map, ...) add_layer(map, "graticule", ...)
outline   <- function(map, ...) add_layer(map, "outline", ...)
header   <- function(map, ...) add_layer(map, "header", ...)

# Render
render <- function(map, elementId = NULL) {
  stopifnot(inherits(map, "d3carto"))
  htmlwidgets::createWidget(
    name = "geo_widget",
    x = toJSON(map),
    package = "rgeoviz",
    elementId = elementId
  )
}

# ------ TEST

map <- create(projection = "NaturalEarth1") |> graticule(strokeWidth = 2) |> header(text="coucou", fill = "red")

x <- toJSON(map)

x
mapjson <- toJSON(map$layers, pretty = TRUE)
mapjson <- toJSON(map$params, pretty = TRUE)
mapjson

geojson <- convert_sf_to_geojson(world)


save_geojson(geojson, "world_map.geojson")
