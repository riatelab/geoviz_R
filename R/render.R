#' Render
#'
#' @param map a d3carto object create with the create() function. Use |> to chain instructions.
#' @param elementId The HTML element ID (id) of the <div> container in which the widget will be rendered.
#' @return a geoviz html widget
#' @export
render <- function(map, elementId = NULL) {
  htmlwidgets::createWidget(
    name = "render",
    x = r2json(map),
    package = "d3carto",
    elementId = elementId
  )
}

