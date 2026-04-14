devtools::check()
remove.packages("geoviz")

devtools::document()
devtools::install()
devtools::build_vignettes()

devtools::build()
devtools::load_all()

devtools::install()
devtools::load_all()





pkgdown::build_site()

# library(geoviz)
# devtools::install_github("neocarto/geoviz_R")

library(sf)
world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
cities <- st_read(system.file("gpkg/cities.gpkg", package = "geoviz"), quiet = TRUE)
# getwd()
# viz_create(projection = "EqualEarth", zoomable = T) |>
#   viz_path(data = world) |>
#   viz_exportSVG("test.svg")

viz_create(margin=20, zoomable = T, resize = FALSE, responsive = TRUE) |>
  viz_path(data = world, tip = T) |>
  viz_path(data = cities, tip = T) |>
  viz_gridchoro(data = cities, var = "population", grid = "square") |>
  viz_render()

viz_create(projection = "EqualEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC") |>
  viz_path(data = cities, fill = "black",r = 2) |>
  viz_render()



library("htmlwidgets")

viz_create(margin=20, zoomable = T) |>
  viz_path(data = world, tip = T) |>
  viz_render() |>
  saveWidget("mymap2.html", selfcontained = TRUE)

widget <- viz_grid(data = world, step = 20)
# Récupérer le JSON préparé côté R
geojson_input <- widget$x$opts$data
str(geojson_input)

plot(geojson_input)
# plot(grid)











viz_create(zoomable = T) |>
  viz_tile() |>
  viz_render()

viz_create(zoomable = "versor", projection = "Bertin1953") |>
  viz_sketch(data = world) |>
  viz_render()






viz_create(zoomable = "versor") |>
  # filtres
  viz_shadow(id = "ombre") |>
  viz_radialGradient(id ="gradiant") |>
  # Affichage
  viz_outline() |>
  viz_graticule(step = 60, stroke = "red") |>
  viz_path(datum = world, fill = "url(#gradiant)", stroke = "none") |>
  viz_prop(data = world, var = "pop", fill = "red", tip = T, filter = "url(#ombre)", k = 30,  dodge = T) |>
  viz_header(text = "Bonjour") |>
  viz_render()


viz_create(projection = "HoaXiaoguang", zoomable = "versor", width = 400) |>
  viz_outline() |>
  viz_graticule(stroke = "black", strokeWidth = 0.5) |>
  viz_path(datum = world, fill = "black", fillOpacity = 0.6) |>
  viz_outline(fill = "none", stroke = "black", strokeWidth = 1.2) |>
  viz_render()



viz_create() |>
  viz_path(datum = world, fill = "#CCC") |>
  viz_picto(data = world, var = "region", r = 7, fill = "black", dodge = T,
        symbols =  c("human", "heart", "fist", "clover", "rocket", "plane")) |>
  viz_render()

viz_create() |>
  viz_clipPath(id = "clip", datum = world) |>
  viz_tile(url = "worldimagery", clipPath="url(#clip)") |>
  viz_path(datum = world, fill = "none", stroke = "red") |>
  viz_render()


viz_create(zoomable = T) |>
  viz_outline() |>
  viz_graticule(step = 60, stroke = "red") |>
  viz_path(datum = world, fill = "white", fillOpacity = 0.3) |>
  viz_prop(data = world, var = "pop", fill = "red", tip = T) |>
  viz_header(text = "Bonjour") |>
  # viz_render() |>
  viz_save("toto.svg")

viz_create() |>
  viz_tile() |>
  viz_render()

viz_create(zoomable = T ) |>
  viz_tile() |>
  viz_graticule(step = 60, stroke = "red") |>
  viz_layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  viz_prop(data = world, var = "pop", fill = "red", dodge =F, tip=T, symbol = "circle") |>
  viz_header(text = "Bonjour") |>
  viz_render()


viz_create(zoomable = "versor", projection = "orthographic.rotate([30,-30])", width = 500) |>
  viz_outline() |>
  viz_graticule(step = 60, stroke = "red") |>
  viz_layer(datum = world, fill = "white", fillOpacity = 0.3) |>
  viz_prop(data = world, var = "pop", fill = "red", fillOpacity = 0.8) |>
  viz_header(text = "Bonjour") |>
  viz_render()

library("htmlwidgets")
saveWidget(map0, "ma_carte.html", selfcontained = TRUE)




