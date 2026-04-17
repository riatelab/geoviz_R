# Create and render

First, let’s load packages and some data.

``` r
library(geoviz)
library(sf)

world <- st_read(
  system.file("gpkg/world.gpkg", package = "geoviz"),
  quiet = TRUE
)
```

## Create

Every map starts with the `viz_create` function. It initializes the map
and defines a number of general parameters, such as the size (`width`),
the margins (`margins`), the projection (`projection`), or the
background color (`background`). This is also where you determine
whether the map is zoomable or not, using the `zoomable` parameter.

From a technical perspective, the function produces a list containing
the map parameters and an initially empty list of layers to be
displayed.

``` r
map <- viz_create(projection = "EqualEarth", 
                  margin = c(20,0,0,0), 
                  background = "#55bee0")
str(map)
```

    ## List of 2
    ##  $ params:List of 12
    ##   ..$ id        : chr "map"
    ##   ..$ width     : NULL
    ##   ..$ resize    : logi TRUE
    ##   ..$ domain    : NULL
    ##   ..$ responsive: logi TRUE
    ##   ..$ projection: chr "EqualEarth"
    ##   ..$ background: chr "#55bee0"
    ##   ..$ fontFamily: NULL
    ##   ..$ margin    : num [1:4] 20 0 0 0
    ##   ..$ zoomable  : NULL
    ##   ..$ control   : logi TRUE
    ##   ..$ warning   : logi TRUE
    ##  $ layers: list()
    ##  - attr(*, "class")= chr "geoviz"

At this stage, the function does not draw anything.

## Add layers

Once the map has been initialized with the `viz_create` function, the
geoviz package provides many functions to display layers. Each function
has its own specific parameters and is designed to display a particular
type of layer. For example, you can use `viz_path` to add gemeotries,
`viz_graticule` to add graticules, or `viz_header` to add a title, etc.

So you can write this

``` r
map <- viz_create(projection = "EqualEarth")
map <- viz_outline(map)
map <- viz_graticule(map, stroke = "white", step =20)
map <- viz_path(map, data = world)
map <- viz_header(map, text = "Hello World")
str(map)
```

    ## List of 2
    ##  $ params:List of 12
    ##   ..$ id        : chr "map"
    ##   ..$ width     : NULL
    ##   ..$ resize    : logi TRUE
    ##   ..$ domain    : NULL
    ##   ..$ responsive: logi TRUE
    ##   ..$ projection: chr "EqualEarth"
    ##   ..$ background: NULL
    ##   ..$ fontFamily: NULL
    ##   ..$ margin    : num [1:4] 0 0 0 0
    ##   ..$ zoomable  : NULL
    ##   ..$ control   : logi TRUE
    ##   ..$ warning   : logi TRUE
    ##  $ layers:List of 4
    ##   ..$ :List of 4
    ##   .. ..$ type       : chr "outline"
    ##   .. ..$ stroke     : chr "none"
    ##   .. ..$ strokeWidth: num 1
    ##   .. ..$ fill       : chr "#B5DFFD"
    ##   ..$ :List of 8
    ##   .. ..$ type           : chr "graticule"
    ##   .. ..$ step           : num 20
    ##   .. ..$ stroke         : chr "white"
    ##   .. ..$ fill           : chr "none"
    ##   .. ..$ strokeWidth    : num 0.8
    ##   .. ..$ strokeLinecap  : chr "square"
    ##   .. ..$ strokeLinejoin : chr "round"
    ##   .. ..$ strokeDasharray: num 2
    ##   ..$ :List of 11
    ##   .. ..$ type       : chr "path"
    ##   .. ..$ data       :Classes 'sf' and 'data.frame':  209 obs. of  11 variables:
    ##   .. .. ..$ ISO3  : chr [1:209] "GNQ" "TUV" "MDV" "AND" ...
    ##   .. .. ..$ NAMEen: chr [1:209] "Equatorial Guinea" "Tuvalu" "Maldives" "Andorra" ...
    ##   .. .. ..$ NAMEfr: chr [1:209] "Guinée-Équatoriale" "Tuvalu" "Maldives" "Andorre" ...
    ##   .. .. ..$ id    : chr [1:209] "GNQ" "TUV" "MDV" "AND" ...
    ##   .. .. ..$ name  : chr [1:209] "Equatorial Guinea" "Tuvalu" "Maldives" "Andorra" ...
    ##   .. .. ..$ region: chr [1:209] "Africa" "Oceania" "Asia" "Europe" ...
    ##   .. .. ..$ pop   : chr [1:209] "1402985" "11792" "540542" "77146" ...
    ##   .. .. ..$ gdp   : chr [1:209] "10021856754" "48855550" "4030203167" "3155065488" ...
    ##   .. .. ..$ gdppc : chr [1:209] "7143.24" "4143.11" "7455.86" "40897.33" ...
    ##   .. .. ..$ year  : chr [1:209] "2020" "2020" "2020" "2019" ...
    ##   .. .. ..$ geom  :sfc_MULTIPOLYGON of length 209; first list element: List of 2
    ##   .. .. .. ..$ :List of 1
    ##   .. .. .. .. ..$ : num [1:6, 1:2] 11.32 11.34 9.8 9.35 9.8 ...
    ##   .. .. .. ..$ :List of 1
    ##   .. .. .. .. ..$ : num [1:5, 1:2] 8.72 9.05 8.7 8.23 8.72 ...
    ##   .. .. .. ..- attr(*, "class")= chr [1:3] "XY" "MULTIPOLYGON" "sfg"
    ##   .. .. ..- attr(*, "sf_column")= chr "geom"
    ##   .. .. ..- attr(*, "agr")= Factor w/ 3 levels "constant","aggregate",..: NA NA NA NA NA NA NA NA NA NA
    ##   .. .. .. ..- attr(*, "names")= chr [1:10] "ISO3" "NAMEen" "NAMEfr" "id" ...
    ##   .. ..$ coords     : chr "geo"
    ##   .. ..$ clip       : logi TRUE
    ##   .. ..$ strokeWidth: num 1
    ##   .. ..$ tip        : logi FALSE
    ##   .. ..$ simplify   : logi FALSE
    ##   .. ..$ rewind     : logi FALSE
    ##   .. ..$ rewindPole : logi FALSE
    ##   .. ..$ clipOutline: num 0
    ##   .. ..$ r          : num 3
    ##   ..$ :List of 13
    ##   .. ..$ type                  : chr "header"
    ##   .. ..$ text                  : chr "Hello World"
    ##   .. ..$ fill                  : chr "#9e9696"
    ##   .. ..$ background_fill       : chr "white"
    ##   .. ..$ background_stroke     : chr "white"
    ##   .. ..$ background_strokeWidth: num 1
    ##   .. ..$ dominantBaseline      : chr "central"
    ##   .. ..$ textAnchor            : chr "middle"
    ##   .. ..$ lineSpacing           : num 0
    ##   .. ..$ margin                : num 8
    ##   .. ..$ fontSize              : num 26
    ##   .. ..$ dx                    : num 0
    ##   .. ..$ dy                    : num 0
    ##  - attr(*, "class")= chr "geoviz"

Or that (recomended)

``` r
map <- viz_create(projection = "EqualEarth") |>
viz_outline() |>
viz_graticule(stroke = "white", step =20) |>
viz_path(data = world) |>
viz_header(text = "Hello World")
str(map)
```

    ## List of 2
    ##  $ params:List of 12
    ##   ..$ id        : chr "map"
    ##   ..$ width     : NULL
    ##   ..$ resize    : logi TRUE
    ##   ..$ domain    : NULL
    ##   ..$ responsive: logi TRUE
    ##   ..$ projection: chr "EqualEarth"
    ##   ..$ background: NULL
    ##   ..$ fontFamily: NULL
    ##   ..$ margin    : num [1:4] 0 0 0 0
    ##   ..$ zoomable  : NULL
    ##   ..$ control   : logi TRUE
    ##   ..$ warning   : logi TRUE
    ##  $ layers:List of 4
    ##   ..$ :List of 4
    ##   .. ..$ type       : chr "outline"
    ##   .. ..$ stroke     : chr "none"
    ##   .. ..$ strokeWidth: num 1
    ##   .. ..$ fill       : chr "#B5DFFD"
    ##   ..$ :List of 8
    ##   .. ..$ type           : chr "graticule"
    ##   .. ..$ step           : num 20
    ##   .. ..$ stroke         : chr "white"
    ##   .. ..$ fill           : chr "none"
    ##   .. ..$ strokeWidth    : num 0.8
    ##   .. ..$ strokeLinecap  : chr "square"
    ##   .. ..$ strokeLinejoin : chr "round"
    ##   .. ..$ strokeDasharray: num 2
    ##   ..$ :List of 11
    ##   .. ..$ type       : chr "path"
    ##   .. ..$ data       :Classes 'sf' and 'data.frame':  209 obs. of  11 variables:
    ##   .. .. ..$ ISO3  : chr [1:209] "GNQ" "TUV" "MDV" "AND" ...
    ##   .. .. ..$ NAMEen: chr [1:209] "Equatorial Guinea" "Tuvalu" "Maldives" "Andorra" ...
    ##   .. .. ..$ NAMEfr: chr [1:209] "Guinée-Équatoriale" "Tuvalu" "Maldives" "Andorre" ...
    ##   .. .. ..$ id    : chr [1:209] "GNQ" "TUV" "MDV" "AND" ...
    ##   .. .. ..$ name  : chr [1:209] "Equatorial Guinea" "Tuvalu" "Maldives" "Andorra" ...
    ##   .. .. ..$ region: chr [1:209] "Africa" "Oceania" "Asia" "Europe" ...
    ##   .. .. ..$ pop   : chr [1:209] "1402985" "11792" "540542" "77146" ...
    ##   .. .. ..$ gdp   : chr [1:209] "10021856754" "48855550" "4030203167" "3155065488" ...
    ##   .. .. ..$ gdppc : chr [1:209] "7143.24" "4143.11" "7455.86" "40897.33" ...
    ##   .. .. ..$ year  : chr [1:209] "2020" "2020" "2020" "2019" ...
    ##   .. .. ..$ geom  :sfc_MULTIPOLYGON of length 209; first list element: List of 2
    ##   .. .. .. ..$ :List of 1
    ##   .. .. .. .. ..$ : num [1:6, 1:2] 11.32 11.34 9.8 9.35 9.8 ...
    ##   .. .. .. ..$ :List of 1
    ##   .. .. .. .. ..$ : num [1:5, 1:2] 8.72 9.05 8.7 8.23 8.72 ...
    ##   .. .. .. ..- attr(*, "class")= chr [1:3] "XY" "MULTIPOLYGON" "sfg"
    ##   .. .. ..- attr(*, "sf_column")= chr "geom"
    ##   .. .. ..- attr(*, "agr")= Factor w/ 3 levels "constant","aggregate",..: NA NA NA NA NA NA NA NA NA NA
    ##   .. .. .. ..- attr(*, "names")= chr [1:10] "ISO3" "NAMEen" "NAMEfr" "id" ...
    ##   .. ..$ coords     : chr "geo"
    ##   .. ..$ clip       : logi TRUE
    ##   .. ..$ strokeWidth: num 1
    ##   .. ..$ tip        : logi FALSE
    ##   .. ..$ simplify   : logi FALSE
    ##   .. ..$ rewind     : logi FALSE
    ##   .. ..$ rewindPole : logi FALSE
    ##   .. ..$ clipOutline: num 0
    ##   .. ..$ r          : num 3
    ##   ..$ :List of 13
    ##   .. ..$ type                  : chr "header"
    ##   .. ..$ text                  : chr "Hello World"
    ##   .. ..$ fill                  : chr "#9e9696"
    ##   .. ..$ background_fill       : chr "white"
    ##   .. ..$ background_stroke     : chr "white"
    ##   .. ..$ background_strokeWidth: num 1
    ##   .. ..$ dominantBaseline      : chr "central"
    ##   .. ..$ textAnchor            : chr "middle"
    ##   .. ..$ lineSpacing           : num 0
    ##   .. ..$ margin                : num 8
    ##   .. ..$ fontSize              : num 26
    ##   .. ..$ dx                    : num 0
    ##   .. ..$ dy                    : num 0
    ##  - attr(*, "class")= chr "geoviz"

At this stage, you still do not draw anything. You have created a
configuration file containing the data and parameters needed to build
the map.

## Render

This configuration file will be rendered using the
[`viz_render()`](https://riatelab.github.io/geoviz_R/reference/viz_render.md)
function.

``` r
viz_render(map)
```

Thus, creating a complete map with geoviz could be written as follows.

``` r
map <- viz_create(projection = "EqualEarth") |>
viz_outline() |>
viz_graticule(stroke = "white", step =20) |>
viz_path(data = world) |>
viz_header(text = "Hello World") |>
viz_render()
```

From a technical perspective, the viz_render function returns an HTML
block (+ JavaScript for interactivity) containing a map in SVG format.

## Save maps

The maps created with the geoviz package thus generate a web page. You
can save this web page with the `htmlwidgets` package:

``` r
library("htmlwidgets")
```

``` r
viz_create(zoomable = T) |>
viz_path(data = world, tip = T) |>
viz_render() |>
saveWidget("mymap.html", selfcontained = TRUE)
```

You can also directly save the map in SVG format to edit it with a
drawing software like Inkscape. For this, you just need to use the
`viz_save` command instead of `viz_render`.

``` r
viz_create() |>
viz_path(data = world) |>
viz_save("mymap.svg")
```

By doing this, the map is returned and a window opens, prompting you to
download it. Thus, the geoviz package can be a way to create draft maps
before refining them in a CAD environment.
