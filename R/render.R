# Render
render <- function(map, elementId = NULL) {
 # stopifnot(inherits(map, "d3carto"))
  htmlwidgets::createWidget(
    name = "render",
    x = r2json(map),
    package = "d3carto",
    elementId = elementId
  )
}

