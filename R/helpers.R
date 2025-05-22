
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

# save_geojson <- function(geojson, filename) {
#   writeLines(geojson, con = filename)
#   cat("GeoJSON file saved as:", filename, "\n")
# }

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


add_layer <- function(map, type, ...) {
  if (!inherits(map, "d3geoviz")) {
    stop("d3carto class needed")
  }
  layer <- c(list(type = type), list(...))
  map$layers <- append(map$layers, list(layer))
  return(map)
}

