library(sf)
library(d3carto)

world <- st_read("tests/world.json")



create(zoomable = "true") |>
  tile()|>
  # outline() |>
  # graticule() |>
  # layer(data = world) |>
  header(text = "Bonjour") |>
  render()

