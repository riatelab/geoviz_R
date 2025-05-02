# Create
create <- function(...) {
  params <- list(...)
 map <- list(
    params = params,
    layers = list()
  )
  structure(map, class = "geo_pipeline")
}

# Graticule
graticule <- function(map, ...) {
  stopifnot(inherits(map, "geo_pipeline"))
 layer_params <- list(type = "graticule", ...)
  map$layers <- append(map$layers, list(layer_params))
  map
}

# Outline
outline <- function(map, ...) {
  stopifnot(inherits(map, "geo_pipeline"))
  layer_params <- list(type = "outline", ...)
  map$layers <- append(map$layers, list(layer_params))
  map
}

# Path
path <- function(map, ...) {
  stopifnot(inherits(map, "geo_pipeline"))
  layer_params <- list(type = "path", ...)
  map$layers <- append(map$layers, list(layer_params))
  map
}



# Exemple d'utilisation avec des paramètres supplémentaires
map <- create(projection = "NaturalEarth1") |>
  graticule(stroke = "red", color = "blue") |>
  outline(stroke = "green", width = 2)

layers = map$layers

# Convertir en JSON
library(jsonlite)
json_str <- toJSON(layers, auto_unbox = TRUE, pretty = TRUE)

# Afficher le JSON

library(sf)
world <- st_read("../world.json")

map <- create(projection = "NaturalEarth1") |>
  path(data = world) |>
  outline(stroke = "green", strokeWidth = 2)
json_str <- toJSON(map$layers, auto_unbox = TRUE, pretty = TRUE)
json_str

write(json_str, file = "mon_map.json")
