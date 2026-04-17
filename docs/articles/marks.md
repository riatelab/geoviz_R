# Marks

The cartographic representations produced with the geoviz package are
based on specific graphical marks defined within the package. These
marks are used in the various rendering functions, but they can also be
used directly on their own. We have already seen the `viz_path` mark,
which allows spatial dataframes to be displayed. But there are other
types as well. Let’s start with the `viz_circle` mark to understand the
principle.

## Circle

As the name implies, the `viz_circle` function is used to draw circles.
The `r` attribute allows to define the radius. To customize the style,
you can use svg attributes with camelcase notation such as `stroke`,
`fill`, `strokeWidth`, `fillOpacity`, `strokeDasharray`…

**1 - SVG position**

You can use this mark to add a circle to the map, giving its x,y
position with the pos attribute. In this case, the circle is static, it
doesn’t move when you zoom in on the map.

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_circle(r = 10, pos = c(300, 100), coords = "svg", fill = "#38896F") |>
  viz_render()
```

**2 - Geographic position**

You can also give a geographic position in latitude and longitude. In
this case, set `coords` to `"geo"`. In this case, the circle move when
you zoom in on the map.

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_circle(r = 10, pos = c(72.88, 19.07), coords = "geo", fill = "#38896F") |>
  viz_render()
```

**3 - based on a spatial dataframe**

The mark circle can also be used to draw circles from a spatial
dataframe, using the `data` attribute instead of the pos attribute. If
the input data contains points, the circles are mapped onto these
points. In the case of polygons or multipolygons, the circle is drawn at
the center of the largest polygon.

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_circle(r = 5, data = world, fill = "#38896F") |>
  viz_render()
```

**4 - Proportionnal symbols**

To vary the the *area of the circles* proportionally to an absolute
quantitative data, all you have to do is specify the variable name in
the `r` attribute. Moreover, the `k` parameter lets you define the
radius of the largest circle. The `fixmax` parameter allows you to set
this radius to a specific value. This one is very useful for comparing
different maps or for time evolution.

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_circle(r = "pop", k = 30, data = world, fill = "#38896F") |>
  viz_render()
```

## Text

It’s exactly the same principle for text. You can position text using
SVG coordinates, geographic coordinates, or from a spatial dataframe.

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_text(text = "Hello Geoviz", fontSize = 30, fontWeight = "bold", coords = "svg", pos = c(300, 100), fill = "#38896F") |>
  viz_render()
```

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_text(data = world, text = "ISO3", fill = "#38896F") |>
  viz_render()
```

## Square

The `viz_square` function mark is used to draw squares. The `side`
attribute allows to define the size of the square (instead of r for
circles). Otherwise, the function works exactly the same.

For example:

``` r
viz_create(projection = "equalEarth", zoomable = T) |>
  viz_path(datum = world, fill = "#CCC", fillOpacity = 0.5) |>
  viz_square(data = world, side = 5, angle = 45, fill = "#38896F") |>
  viz_render()
```

## Spike

The `viz_spike` function allows to create spikes. You can vary the
`width`, `height` and `straight` parameters.

For example:

``` r
afr <- world[world$region == "Africa",]
viz_create(projection = "mercator", zoomable = T) |>
  viz_path(datum = afr, fill = "#CCC", fillOpacity = 0.5) |>
  viz_spike(data = afr, height = "pop", k = 200, fill = "#38896F", stroke = "#38896F") |>
  viz_render()
```

## Half-circle

The `viz_halfcircle` function is used to draw half-circles. The `r`
attribute allows to define the radius.

``` r
afr <- world[world$region == "Africa",]
viz_create(projection = "mercator", zoomable = T) |>
  viz_path(datum = afr, fill = "#CCC", fillOpacity = 0.5) |>
  viz_halfcircle(data = afr, r = 30, fill = "#38896F") |>
  viz_render()
```

## Symbol

As the name implies, the function `viz_symbol` is used to draw symbols.
The r attribute allows to define the size of the symbol (radius of the
circle including the symbol).

``` r
afr <- world[world$region == "Africa",]
viz_create(projection = "mercator", zoomable = T) |>
  viz_path(datum = afr, fill = "#CCC", fillOpacity = 0.5) |>
  viz_symbol(data = afr, r = "gdp", k = 60, fill = "#38896F", symbol = "fist") |>
  viz_render()
```

## It’s very powerfull

With marks and legend, yout can custom your maps as you want. Here find
a mushroom map.

``` r
afr <- world[world$region == "Africa",]
viz_create(projection = "mercator", zoomable = T) |>
  viz_path(datum = afr, fill = "#CCC", fillOpacity = 0.5) |>
  viz_halfcircle(data = afr, r = "gdp", fill = "#F13C47", fillOpacity = 0.7, tip = "GDP: $gdp") |>
  viz_halfcircle(data = afr, r = "pop", fill = "#319ABF", fillOpacity = 0.7, angle = 180, tip = "POP: $pop") |>
  viz_leg_mushrooms(top_data = afr$gdp, bottom_data = afr$pop, 
                    title = "Inequalities\nin Africa",
                    top_title = "Wealth", bottom_title = "Population",
                    frame = TRUE, pos = c(20, 200)
                    ) |>
  viz_render()
```
