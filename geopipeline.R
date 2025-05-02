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

# Serialize
library(jsonlite)
#json_str <- toJSON(layers, auto_unbox = TRUE, pretty = TRUE)
serialize <- function(map){

json <- toJSON( list(
  params = map$params,
  layers = map$layers
), auto_unbox = TRUE, pretty = TRUE)
}




# Test

map <- create(projection = "NaturalEarth1", domain="ss") |>
  graticule(stroke = "red", color = "blue") |>
  outline(stroke = "green", width = 2)

x <- serialize(map)
x


# ---------------------------------------
# -----------------------------------------



# Fonction de vérification et de conversion des objets sf en GeoJSON
convert_sf_to_geojson <- function(arg) {
  if (inherits(arg, "sf")) {
    return(sf::st_as_geojson(arg))  # Convertir en GeoJSON si c'est un objet sf
  }
  return(arg)  # Sinon, retourner l'argument tel quel
}

convert_map_layers_to_geojson <- function(map) {
  map$layers <- lapply(map$layers, function(layer) {
    # Appliquer la conversion pour chaque paramètre de chaque couche
    layer <- lapply(layer, convert_sf_to_geojson)
    return(layer)
  })
  return(map)
}





# Exemple d'utilisation avec des paramètres supplémentaires
map <- create(projection = "NaturalEarth1") |>
  graticule(stroke = "red", color = "blue") |>
  outline(stroke = "green", width = 2)

map <- convert_map_layers_to_geojson(map)

layers = map$layers

# Convertir en JSON


# Afficher le JSON

library(sf)
world <- st_read("../world.json")

map <- create(projection = "NaturalEarth1") |>
  path(data = world) |>
  outline(stroke = "green", strokeWidth = 2)

map <- convert_map_layers_to_geojson(map)

json_str <- toJSON(map$layers, auto_unbox = TRUE, pretty = TRUE)
json_str

write(json_str, file = "mon_map.json")

