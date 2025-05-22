#' Save
#'
#' @param map a d3geoviz object create with the create() function. Use |> to chain instructions.
#' @param elementId The HTML element ID (id) of the <div> container in which the widget will be rendered.
#' @return a geoviz html widget
#' @export
save <- function(map, elementId = NULL) {
  htmlwidgets::createWidget(
    name = "save",
    x = r2json(map),
    package = "d3geoviz",
    elementId = elementId
  )
}

