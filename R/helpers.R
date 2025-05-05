
convert_sf_to_geojson <- function(x) {
  if (inherits(x, "sf") || inherits(x, "sfc")) {
    return(geojsonsf::sf_geojson(x))
  }
  if (is.data.frame(x) && any(sapply(x, inherits, "sfc"))) {
    x <- sf::st_as_sf(x)
    return(geojsonsf::sf_geojson(x))
  }
  return(x)
}

save_geojson <- function(geojson, filename) {
  writeLines(geojson, con = filename)
  cat("GeoJSON file saved as:", filename, "\n")
}

r2json <- function(map) {
  params_converted <- lapply(map$params, convert_sf_to_geojson)
  layers_converted <- lapply(map$layers, function(layer) {
    lapply(layer, convert_sf_to_geojson)
  })
  map_combined <- list(
    params = params_converted,
    layers = layers_converted
  )
  jsonlite::toJSON(map_combined, pretty = TRUE, auto_unbox = TRUE)
}


create <- function(...) {
structure(
    list(params = list(...), layers = list()),
    class = "d3carto"
  )
}

add_layer <- function(map, type, ...) {
  if (!inherits(map, "d3carto")) {
    stop("d3carto class needed")
  }
  layer <- c(list(type = type), list(...))
  map$layers <- append(map$layers, list(layer))
  return(map)
}

# Layer types
graticule <- function(map, ...) add_layer(map, "graticule", ...)
outline   <- function(map, ...) add_layer(map, "outline", ...)
header   <- function(map, ...) add_layer(map, "header", ...)
path   <- function(map, ...) add_layer(map, "path", ...)
base   <- function(map, ...) add_layer(map, "base", ...)
path   <- function(map, ...) add_layer(map, "path", ...)
simple   <- function(map, ...) add_layer(map, "simple", ...)
layer   <- function(map, ...) add_layer(map, "layer", ...)
tile   <- function(map, ...) add_layer(map, "tile", ...)
text   <- function(map, ...) add_layer(map, "text", ...)
label   <- function(map, ...) add_layer(map, "label", ...)
footer   <- function(map, ...) add_layer(map, "footer", ...)
scalebar   <- function(map, ...) add_layer(map, "scalebar", ...)
north   <- function(map, ...) add_layer(map, "north", ...)

prop   <- function(map, ...) add_layer(map, "prop", ...)
choro   <- function(map, ...) add_layer(map, "choro", ...)
typo   <- function(map, ...) add_layer(map, "typo", ...)
symbol   <- function(map, ...) add_layer(map, "symbol", ...)
propchoro   <- function(map, ...) add_layer(map, "propchoro", ...)
proptypo   <- function(map, ...) add_layer(map, "proptypo", ...)
