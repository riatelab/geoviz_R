library(sf)
library(d3carto)

world <- st_read("tests/world.json")


map0 <-

  create(zoomable = T, projection = "NaturalEarth1") |>
  outline() |>
  graticule(step = 60, stroke = "red") |>
  layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  prop(data = world, var = "pop", fill = "red", dodge =T) |>
  header(text = "Bonjour") |>
  render()

create(zoomable = T ) |>
  tile() |>
  graticule(step = 60, stroke = "red") |>
  layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  prop(data = world, var = "pop", fill = "red", dodge =F, tip=T, symbol = "circle") |>
  header(text = "Bonjour") |>
  render()


  create(zoomable = "versor", projection = "orthographic", width = 500) |>
  outline() |>
  graticule(step = 60, stroke = "red") |>
  layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  prop(data = world, var = "pop", fill = "red", fillOpacity = 0.8) |>
  header(text = "Bonjour") |>
  render()

library("htmlwidgets")
saveWidget(map0, "ma_carte.html", selfcontained = TRUE)

getwd()

create(zoomable = T, projection = "NaturalEarth1") |>
  outline() |>
  graticule()
