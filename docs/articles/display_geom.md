# Display a basemap

``` r
library(geoviz)
```

As is usual in R, the geoviz package takes spatial data frames as input.
You therefore need to load the `sf` package to import geometries.

``` r
library(sf)
australia <- system.file("gpkg/aus.gpkg", package = "geoviz")
world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
aus <- st_read(dsn = australia, layer = "aus", quiet = TRUE)
roads <- st_read(dsn = australia, layer = "roads", quiet = TRUE)
ports <- st_read(dsn = australia, layer = "ports", quiet = TRUE)
```

## The `viz_path` function

The `viz_path` function is the one that allows you to display
geometries. It lets you stack layers and is highly configurable. All
parameters have default styles. The color is assigned randomly.

``` r
viz_create() |>
viz_path(data = aus) |>
viz_path(data = roads) |>
viz_path(data = ports) |>
viz_render()
```

Several parameters allow you to customize the appearance of geometries
in an SVG. For example, `strokeWidth` controls the thickness of lines or
polygon borders, while `pointRadius` sets the size of points or
vertices. `fill` defines the interior color of polygons, and `stroke`
sets the border color. `strokeDasharray` can be used to create dashed or
patterned lines. You can also adjust `opacity` to make elements more or
less transparent, and combine these settings to create clear, visually
appealing maps.

``` r
viz_create() |>
viz_path(data = aus, fill = "#CCC") |>
viz_path(data = roads, stroke = "#38896F",
         strokeDasharray = 3, strokeWidth = 2) |>
viz_path(data = ports, fill = "#CCC", stroke = "#38896F",
         strokeWidth = 3, pointRadius = 6 ) |>
viz_render()
```

## Data or datum?

In the `viz_path` function (and more generally in `geoviz`), there are
two parameters that allow you to add a spatial dataframe.

The `data` parameter lets you add geometries and iterate over each
element. You should use data whenever you want to differentiate between
individual elements (e.g., for a choropleth map, proportional symbols,
etc.).

In contrast, the `datum` parameter draws the entire layer at once
without iterating over each element. You can use `datum` to add a simple
base map with the same fill and stroke colors everywhere.

Using `data` versus `datum` also changes the default parameters. For
example, with `datum`, polygons do not have strokes by default, which
allows for shorter code.

``` r
viz_create() |>
viz_path(data = world, fill = "#38896F") |>
viz_render()
```

``` r
viz_create() |>
viz_path(datum = world, fill = "#38896F") |>
viz_render()
```

## Simplification

Geoviz renders geometries as SVG. If there are many points, rendering
can be slow. You can automatically lighten the base map by setting the
attribute `simplify = TRUE`. This simplifies automaticaly the base map,
making it lighter without significantly altering its appearance, and
zooming becomes much faster.

``` r
viz_create(projection  = "EqualEarth", zoomable = T) |>
viz_path(data = world, simplify = T, fill = "#38896F") |>
viz_render()
```

You can also assign any value between 0 and 1 to control the level of
simplification: 0 means very simplified, and 1 means no simplification
at all.

``` r
viz_create(projection  = "EqualEarth", zoomable = T) |>
viz_path(data = world, simplify = 0.05, fill = "#38896F") |>
viz_render()
```

## Dynamic simplification 🪄

You can specify `simplify = c(val1, val2)` to have a level of
simplification that vary according the zoom level. The fisrt value
allows to simplify the basemap. This is how it will appear when we zoom
in the most. The second value applies a second simplification. This is
how the base map will appear before zooming in. These two values allow
for two successive simplifications. They represent two states of the
base map corresponding to the smallest and largest zoom levels. Between
these two states, the base map takes on an intermediate appearance.

``` r
viz_create(projection  = "EqualEarth", zoomable = T) |>
viz_path(data = world, simplify = c(1, 0.05), fill = "#38896F") |>
viz_render()
```

## The Winding Order Problem

The geoviz package converts your geometries to GeoJSON. When applying a
map projection function, it can sometimes happen that polygons end up
with their vertices not ordered correctly. The convention is that the
outer ring of a polygon should be defined in a counter-clockwise
direction, while inner rings (holes) should be defined in a clockwise
direction. If this rule is not followed, some software may render holes
as solid areas or produce incorrect results in geometric calculations.

``` r
viz_create(projection  = "EqualEarth") |>
viz_path(data = world, simplify = 0.001, fill = "#38896F") |>
viz_render()
```

The `rewind` parameter automatically corrects the vertex order, making
the GeoJSON compliant and preventing display or processing issues. If
the problem is not resolved, you can try the `rewindPole` parameter.

``` r
viz_create(projection  = "EqualEarth") |>
viz_path(data = world, simplify = 0.001, rewind = T,
         rewindPole = T, fill = "#38896F") |>
viz_render()
```

## In other functions

Everything we’ve just seen also applies to all package functions based
on `viz_path`. You can therefore also use the simplify parameter when
creating a choropleth map.

``` r
viz_create(projection  = "EqualEarth", zoomable = T) |>
viz_choro(data = world, var = "gdppc",
          simplify = c(1, 0.05), fill = "#38896F") |>
viz_render()
```
