#' Save the map
#'
#' The \code{viz_save} function allows to doawnload the map
#' @param map A \code{geoviz} object created with \code{viz_create}.
#' @export
#' @param map a geoviz object create with the \code{viz_create}
#' @export
viz_save <- function(map, elementId = NULL) {
  htmlwidgets::createWidget(
    name = "save",
    x = r2json(map),
    package = "geoviz",
    elementId = elementId
  )
}

