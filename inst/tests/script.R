devtools::check()
devtools::document()
devtools::build_vignettes()

devtools::load_all()
library(sf)
# library(d3carto)

# devtools::install_github("neocarto/d3carto")

world <- st_read(system.file("gpkg/world.gpkg", package = "d3carto"), quiet = TRUE)


create() |>
  outline() |>
  graticule(step = 60, stroke = "red") |>
  path(datum = world, fill = "white", fillOpacity = 0.3) |>
  prop(data = world, var = "pop", fill = "red", tip = T) |>
  header(text = "Bonjour") |>
  save()


create(zoomable = T) |>
  outline() |>
  graticule(step = 60, stroke = "red") |>
  path(datum = world, fill = "white", fillOpacity = 0.3) |>
  prop(data = world, var = "pop", fill = "red", tip = T) |>
  header(text = "Bonjour") |>
  render() |>
  save("toto.svg")

create() |>
  tile() |>
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


create(projection = "NaturalEarth1", background = "#CCC", margin = list(100,00,20,20)) |>
  outline() |>
  graticule(step = 60, stroke = "red") |>
  layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  render()


