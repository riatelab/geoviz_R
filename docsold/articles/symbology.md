# Symbology

The strength of the geoviz package lies in its ability to create
thematic maps from statistical data. To achieve this, many functions are
available.

First, let’s load the packages and some data.

``` r
library(geoviz)
library(sf)

world <- st_read(
  system.file("gpkg/world.gpkg", package = "geoviz"),
  quiet = TRUE
)

cities <- st_read(
  system.file("gpkg/cities.gpkg", package = "geoviz"),
  quiet = TRUE
)
```

## Proportional symbols

With the `viz_prop` function, you can quickly draw a map with
proportionnal symbols. At a minimum, you need two parameters: `data` (a
spatial data frame) and `var` (the variable to map). Note that you
should use absolute quantitative data (stocks) here.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_prop(data = world, var = "pop", fill = "#38896F") |>
viz_render()
```

With the `k` attribute (and possibily `fixmax`), you can change the size
of the circles. With `symbol`, it is possible to change the type of
symbol—for example: `"circle"`, `"square"`, `"spike"`, `"halfcircle"`.
Additionally, you can modify all the usual graphical styles (`fill`,
`stroke`, `strokeWidth`…).

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_prop(data = world, var = "pop", k = 30, 
         fill = "#38896F", symbol = "square") |>
viz_render()
```

The legend can be configured using the prefixes `leg_`. With the prefix
`leg_circle_...`, you can modify the appearance of circles. With the
prefix `leg_line_...`, you can modify the appearance of lines. With the
prefix `leg_values_...`, you can modify the style of the values.
Everything is configurable. To better understand, you can refer to the
documentation of the legend functions and/or to the dedicated vignette.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_prop(data = world, var = "pop", k = 30, 
         fill = "#38896F", symbol = "circle", leg_type = "separate",
         leg_circle_fill = "#38896F", leg_title = "Population",
         leg_subtitle = "in million inh.", leg_note = "made with geoviz",
         leg_values_round = 0, leg_values_factor = 1/1000000) |>
viz_render()
```

## Choropleth

In thematic cartography, according to the rules of graphic semiology,
relative quantitative data (percentages, indices, ratios) must be
represented using visual order variables. The most classic
representation is the choropleth map. The simplest way to create a
chropleth map with the geoviz library is to use `viz_choro`. As
previously, you need two parameters: `data` (a spatial data frame) and
`var` (the variable to map).

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc") |>
viz_render()
```

To change class boundaries, you have access to several discretization
methods from the JavaScript library
[statsbreaks](https://github.com/riatelab/statsbreaks). You can choose
them using the `method` parameter. The available methods are:
“quantile”, “q6”, “equal”, “jenks”, “msd”, “geometric”, “headtail”,
“pretty”, “arithmetic”, “nestedmeans”. In addition, with `nb`, you can
specify the number classes. For the msd method only , you can also
choose the parameters `sd` (number of standard deviations to include)
and `middle` (to define whether the mean is at the center of a class or
at a class boundary).

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc", method = "jenks", nb = 4) |>
viz_render()
```

If you prefer, you can also directly specify the class boundaries using
the `breaks` parameter.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc",
          breaks = c(200, 1000, 5000, 10000, 50000, 200000)) |>
viz_render()
```

Regarding colors, you have access to all palettes available in the
JavaScript library [dispocal](https://github.com/riatelab/dicopal.js/).
See [here](https://observablehq.com/@neocartocnrs/dicopal-library). For
example, you can use:

- **Sequential**

`"BluGrn"`, `"BluYl"`, `"BrwnYl"`, `"BurgYl"`, `"Burg"`, `"DarkMint"`,
`"Emrld"`, `"Magenta"`, `"Mint"`, `"OrYel"`, `"Peach"`, `"PinkYl"`,
`"PurpOr"`, `"Purp"`, `"RedOr"`, `"SunsetDark"`, `"Sunset"`,
`"TealGrn"`, `"Teal"`, `"agGrnYl"`, `"agSunset"`, `"Algae"`, `"Amp"`,
`"Deep"`, `"Dense"`, `"Gray"`, `"Haline"`, `"Ice"`, `"Matter"`, `"Oxy"`,
`"Phase"`, `"Solar"`, `"Speed"`, `"Tempo"`, `"Thermal"`, `"Turbid"`,
`"Blues"`, `"BuGn"`, `"BuPu"`, `"GnBu"`, `"Greens"`, `"Greys"`,
`"OrRd"`, `"Oranges"`, `"PuBuGn"`, `"PuBu"`, `"PuRd"`, `"Purples"`,
`"RdPu"`, `"Reds"`, `"YlGnBu"`, `"YlGn"`, `"YlOrBr"`, `"YlOrRd"`,
`"Blues10"`, `"Blues7"`, `"Inferno"`, `"Magma"`, `"Plasma"`,
`"Viridis"`, `"Cube1"`, `"CubeYF"`, `"LinearL"`, `"Acton"`, `"Bamako"`,
`"Batlow"`, `"Bilbao"`, `"Buda"`, `"Davos"`, `"Devon"`, `"GrayC"`,
`"Hawaii"`, `"Imola"`, `"LaJolla"`, `"LaPaz"`, `"Nuuk"`, `"Oleron"`,
`"Oslo"`, `"Tokyo"`, `"Turku"`, `"Carrots"`, `"BlueFluorite"`,
`"AridElevation"`, `"Florida"`

- **Diverging**

`"ArmyRose"`, `"Earth"`, `"Fall"`, `"Geyser"`, `"TealRose"`, `"Temps"`,
`"Tropic"`, `"Balance"`, `"Curl"`, `"Delta"`, `"BrBG"`, `"PRGn"`,
`"PiYG"`, `"PuOr"`, `"RdBu"`, `"RdGy"`, `"RdYlBu"`, `"RdYlGn"`,
`"Spectral"`, `"BlueDarkOrange12"`, `"BlueDarkOrange18"`,
`"BlueDarkRed12"`, `"BlueDarkRed18"`, `"BlueGray"`, `"BlueGreen"`,
`"BlueGrey"`, `"BlueOrange10"`, `"BlueOrange12"`, `"BlueOrange8"`,
`"BlueOrangeRed"`, `"BrownBlue10"`, `"BrownBlue12"`, `"GreenMagenta"`,
`"RedYellowBlue"`, `"Berlin"`, `"Broc"`, `"Cork"`, `"Lisbon"`, `"Roma"`,
`"Tofino"`, `"Vik"`

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc", colors = "BlueOrangeRed") |>
viz_render()
```

You can also choose any colors you want by specifying a vector.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc",
          colors = c("#ffffcc", "#c7e9b4", "#7fcdbb",
                     "#41b6c4", "#2c7fb8", "#253494")) |>
viz_render()
```

## Typology

To create a typology map, you can use the `viz_typo` function. As
before, you need at least two parameters: `data` (a spatial data frame)
and `var` (a qualitative variable).

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_typo(data = world, var = "region") |>
viz_render()
```

Of course, you can change the palette with the `colors` parameter. For
example, you can use for example:

`"Antique"`, `"Bold"`, `"Pastel"`, `"Prism"`, `"Safe"`, `"Vivid"`,
`"Accent"`, `"Dark2"`, `"Paired"`, `"Pastel1"`, `"Pastel2"`, `"Set1"`,
`"Set2"`, `"Set3"`, `"BlueRed"`, `"GreenOrange"`, `"PurpleGray"`,
`"GrandBudapest3"`, `"IsleOfDogs2"`, `"Moonrise5"`

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_typo(data = world, var = "region", colors = "Pastel") |>
viz_render()
```

There are other palettes in dicopal, but some are only available for a
fixed number of classes. Fortunately, you can also directly choose your
own colors.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_typo(data = world, var = "region",
         colors = c("#e41a1c", "#377eb8", "#4daf4a",
                    "#984ea3", "#ff7f00", "#ffff33")) |>
viz_render()
```

To properly determine the order of the types in the legend and which
color corresponds to which category, you can also use the `order`
argument.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_typo(data = world, var = "region",
         order = c("Antarctica", "Oceania", "Africa", 
                   "America", "Asia", "Europe"),
         colors = c("#e41a1c", "#377eb8", "#4daf4a",
                    "#984ea3", "#ff7f00", "#ffff33")) |>
viz_render()
```

Obviously, all these functions also work on point objects.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_typo(data = st_centroid(world), var = "region", r = 10,
         order = c("Antarctica", "Oceania", "Africa", 
                    "America", "Asia", "Europe"),
         colors = c("#e41a1c", "#377eb8", "#4daf4a",
                    "#984ea3", "#ff7f00", "#ffff33")) |>
viz_render()
```

    ## Warning: st_centroid assumes attributes are constant over geometries

## pictograms

Another way to represent qualitative data is to use pictograms. For
this, you can use the `viz_picto` function with the `data` and `var`
parameters.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_picto(data = world, var = "region") |>
viz_render()
```

Some symbols are selected by default. But you can choose the ones you
want from this list:

`"circle"`, `"square"`, `"triangle"`, `"pentagon"`, `"hexagon"`,
`"roundsquare"`, `"pillow"`, `"drop"`, `"egg"`, `"star12"`, `"star8"`,
`"star"`, `"diamond"`, `"trapzium"`, `"plus"`, `"minus"`, `"arrow"`,
`"stop"`, `"vbar"`, `"crescent"`, `"donut"`, `"heart"`, `"clover"`,
`"fist"`, `"check"`, `"plane"`, `"rocket"`, `"boat"`, `"pin"`,
`"hospital"`, `"flower"`, `"cloud"`, `"human"`, `"tent"`, `"beer"`,
`"boom"`, `"nuke"`, `"target"`, `"missing"`

To see what they look like, you can click
\|here\](<https://observablehq.com/embed/@neocartocnrs/symbols@826?cells=symbols>).

To choose the symbols you want and define their display `order`, you can
use the order and `symbols` parameters.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_picto(data = world, var = "region",
          order = c("Antarctica", "Oceania", "Africa", 
                    "America", "Asia", "Europe"),
          symbols = c("hospital", "flower", "cloud",
                      "beer", "nuke", "plane")) |>
viz_render()
```

These symbols are configurable. You can change the color (`fill`), the
size (`r`), and even add a bounding circle, which is also customizable
(`background`). With the dodge parameter, you can even spread the
symbols apart to avoid overlaps.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_picto(data = world, var = "region", background = TRUE,
          r = 8, fill = "#38896F", dodge = TRUE) |>
viz_render()
```

## Combinaisons

With geoviz, it is of course possible to combine these representation
modes by overlaying layers. You just need to pay attention to the
position of the legends so that they do not overlap.

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_typo(data = world, var = "region",
         colors = "Pastel", leg_pos = c(10, 100)) |>
viz_prop(data = world, var = "pop", k = 30, 
         leg_values_round = 0, leg_values_factor = 1/1000000,
         fill = "none", stroke = "#38896F",
         strokeWidth = 1.5) |>
viz_render()
```

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_choro(data = world, var = "gdppc",
         colors = "OrRd", leg_pos = c(10, 100)) |>
viz_prop(data = world, var = "pop", k = 30, 
         leg_values_round = 0, leg_values_factor = 1/1000000,
         fill = "none", stroke = "#38896F",
         strokeWidth = 1.5) |>
viz_render()
```

With the functions viz_propchoro and viz_proptypo, you can also display
two variables simultaneously by coloring the circles. In this case, you
must use `var1` (for symbols) and `var2` (for colors). The legends can
be configured using the prefixes `leg1` and `leg2`. Then, you can use
exactly the same parameters as in the previous functions.

For example:

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_proptypo(data = world, var1 = "pop", k = 30,
             leg1_values_round = 0, leg1_values_factor = 1/1000000,
             var2 = "region", colors = "Pastel") |>
viz_render()
```

Or:

``` r
viz_create(projection = "EqualEarth", zoomable = T) |>
viz_path(data = world, fill = "#CCC") |>
viz_propchoro(data = world, var1 = "pop", k = 30,
             leg1_values_round = 0, leg1_values_factor = 1/1000000,
             var2 = "gdppc", colors = "OrRd") |>
viz_render()
```

That’s about it for now. To go further, go to the Symbology (advanced)
section.
