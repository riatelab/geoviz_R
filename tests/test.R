library(sf)
world <- st_read("tests/world.json")


library(d3carto)

map <- create(projection="Bertin1953") |>
  outline(fill = "#CCC") |>
  graticule() |>
  render()

map
