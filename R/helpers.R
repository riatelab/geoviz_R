
convert_sf_to_geojson <- function(x) {
  if (inherits(x, "sf")) {
    geojsonsf::sf_geojson(x)
  } else {
    x
  }
}

save_geojson <- function(geojson, filename) {
  writeLines(geojson, con = filename)
  cat("GeoJSON file saved as:", filename, "\n")
}

r2json <- function(map) {
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

