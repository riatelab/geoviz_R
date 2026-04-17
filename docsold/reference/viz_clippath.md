# Add a clipPath

The clipPath function allows to create a clip layer. The function adds a
clip layer to the SVG container

## Usage

``` r
viz_clipPath(map, ...)
```

## Arguments

- id:

  string (optional) An identifier for the clip path.

- datum:

  object (optional, default = { type: "Sphere" }) The geometry to clip.

- permanent:

  logical or string (optional, default = FALSE) Whether the clip path is
  permanent (static) or not.

## Value

The identifier of the created clip path (e.g. `"url(#id)"`).

## See also

See all parameters in the
[documentation](https://riatelab.github.io/geoviz/global.html#effect/clipPath)
of the underlying JS library.

## Examples

``` r
library(sf)
world <- st_read(system.file("gpkg/world.gpkg", package = "geoviz"), quiet = TRUE)
aus <- world[world$ISO3 == "AUS",]

viz_create(margin = 5, width = 750) |>
  viz_clippath(id = "my_clip", datum = aus) |>
  viz_path(datum = aus, fill = "#38896F", clipPath = "url(#my_clip)") |>
  viz_render()
#> Error in viz_clippath(viz_create(margin = 5, width = 750), id = "my_clip",     datum = aus): could not find function "viz_clippath"
```
