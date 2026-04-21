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



library(sf)
world <- st_read(
  system.file("gpkg/world.gpkg", package = "geoviz"),
  quiet = TRUE
)
afr <- world[world$region== "Africa",]
viz_create(projection = "Mercator", background = "white", domain =  afr) |>
  viz_path(data = world, fill = "#9e9696") |>
  viz_minimap(
    width = 200,
    projection = "EqualEarth",
    pos = c(20, 20),
    location_type = "polygon"
  ) |>
  viz_render()



library(sf)
world <- st_read(
  system.file("gpkg/world.gpkg", package = "geoviz"),
  quiet = TRUE
)

world <- st_read(
  system.file("gpkg/world.gpkg", package = "geoviz"),
  quiet = TRUE
)
aus <- world[world$ISO3 == "AUS", ]

viz_create(margin = 5, projection = "meractor") |>
viz_clipPath(id = "my_clip", datum = aus) |>
viz_tile(url = "worldterrain", clipPath = "url(#my_clip)") |>
viz_render()

viz_radialGradient(
  id = "my_gradient", color1 = "#63b0af",
  color2 = "#428c8b"
) |>
viz_path(datum = world, fill = "url(#my_gradient)") |>
viz_render()





# library(geoviz)
# devtools::install_github("neocarto/geoviz_R")

library(sf)
world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
cities <- st_read(system.file("gpkg/cities.gpkg", package = "geoviz"), quiet = TRUE)
# getwd()
# viz_create(projection = "EqualEarth", zoomable = T) |>
#   viz_path(data = world) |>
#   viz_exportSVG("test.svg")


viz_create(projection = "EqualEarth", zoomable = T) |>
  viz_choro(data = world, var = "gdppc", breaks = bks, colors = cols,
            opacity = 0.1,
            leg_pos = c(10,50), leg_title = "Population",
            leg_subtitle = "in 2020", leg_note = "mad with geoviz",
            leg_type = "horizontal") |>
  viz_render()


viz_create(projection = "EqualEarth", zoomable = T) |>
  viz_path(data = world, fill = "#CCC") |>
  viz_leg_circles_nested(  nb = 6,
                           gap = 5,
                           title = "Population",
                           subtitle = "In inh.",
                           circle_fill = "#38896F",
                           circle_fillOpacity = 0.5,
                           circle_stroke = "white",
                           line_stroke = "#38896F",
                           line_width = 50,
                           line_length = 80,
                           values_dy = -5,
                           values_round = 0,
                           values_textAnchor = "end",
                           values_fill = "#38896F",
                           note = "Made with Geoviz",
                           note_dy = 5) |>
  viz_render()

viz_create(projection = "EqualEarth", zoomable = T, width = 1000) |>
viz_path(data = world, fill = "#CCC") |>
  viz_leg_choro_vertical(pos = c(420, 250)) |>
  viz_render()


viz_create(projection = "EqualEarth", zoomable = T) |>
  viz_typo(data = world, var = "region", colors = "Set1") |>
  viz_render()


viz_create(projection = "EqualEarth", background = "white", zoomable = T, control = c(10,10)) |>
  viz_path(datum = world, fill = "#f1f3f5") |>
  viz_leg_choro_vertical(pos = c(0, 0)) |>
  viz_render()



viz_create(projection = "EqualEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC") |>
  viz_path(data = cities, fill = "black",r = 2) |>
  viz_render()


 viz_create(
   projection = "EqualEarth", zoomable = TRUE
 ) |>
 viz_path(
   datum = world, fill = "#f1f3f5"
 ) |>
 viz_picto(
   data = world, var = "region",
   symbols = c("human", "heart", "fist", "clover", "rocket", "plane"),
   leg_type = "horizontal", leg_pos = c(400, 350),
   leg_symbol_spacing = 40, fill = "#38896F"
 ) |>
 viz_render()

 viz_create(projection = "EqualEarth", zoomable = T) |>
   viz_typo(data = st_centroid(world), var = "region", r = 10,
            order = c("Antarctica", "Oceania", "Africa",
                      "America", "Asia", "Europe"),
            colors = c("#e41a1c", "#377eb8", "#4daf4a",
                       "#984ea3", "#ff7f00", "#ffff33")) |>
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


africa <- world[world$region == "Africa",]
viz_create(projection = "mercator", domain = africa, margin = 20) |>
  viz_clipPath(id = "my_clip_path", datum =  africa )|>
  viz_shadow(id = "shadow", stdDeviation =  4,
             dx = 4, dy = 4, opacity = 0.3) |>
  viz_outline()|>
  viz_path(datum = world, fill = "white", fillOpacity = 0.3) |>
  viz_path(data = africa,   filter =  "url(#shadow)") |>
viz_rhumbs(pos = c(0,-10), coords = "geo", stroke = "white", strokeWidth = 2, strokeDasharray = c(5,3)) |>
  viz_path(data = africa, fill = "#d6bc47", fillOpacity = 1) |>
viz_sketch(data = africa, simplify = 1, strokeOpacity = 0.6) |>
  viz_tile(url = "hillshade", clipPath = "url(#my_clip_path)", opacity = 0.3) |>
  viz_header(text = "The African continent", background_fill = "black", fill = "white") |>
  viz_pattern(stroke = "white", angle = 45) |>
viz_scalebar()|>
  viz_north()|>
  viz_render()


head(cities)
