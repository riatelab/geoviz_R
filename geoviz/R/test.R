test <- function(x, width = NULL, height = NULL, elementId = NULL) {
  htmlwidgets::createWidget(
    x = x,
    name = 'test',
    width = width,
    height = height,
    package = 'rgeoviz',
    elementId = elementId
  )
}
