# Earth raster layer

The `viz_earth` function displays PNG images representing the Earth's
surface (Natural Earth dataset or custom source). The image is projected
on-the-fly. The images are hosted on GitHub. You will need an internet
connection. This function is only relevant at the world scale.

## Usage

``` r
viz_earth(
  map,
  id = NULL,
  url = "NE2_50M_SR_W",
  resolution = 1,
  tileSize = 1024,
  opacity = 1,
  dx = 0,
  dy = 0,
  clipPath = NULL,
  max_canvas_size = NULL
)
```

## Arguments

- map:

  A `geoviz` map created with `viz_create`.

- id:

  character. Optional. Unique layer id.

- url:

  character. Optional. Image source. Can be one of
  ("GRAY_50M_SR","GRAY_50M_SR_OB","GRAY_50M_SR_W","HYP_50M_SR","HYP_50M_SR_W","MSR_50M",
  "NE1_50M_SR_W","NE2_50M_SR","NE2_50M_SR_W","OB_50M","PRIMSA_SR_50M","SR_50M")
  or a custom URL. Default is "NE2_50M_SR_W".

- resolution:

  numeric. Optional. Resolution factor (default 1). Increase for sharper
  rendering (e.g. 2 for Retina, 3 for high-quality export).

- tileSize:

  numeric. Optional. Tile size (default 1024).

- opacity:

  numeric. Optional. Layer opacity (default 1).

- dx:

  numeric. Optional. Horizontal shift (default 0).

- dy:

  numeric. Optional. Vertical shift (default 0).

- clipPath:

  a spatial dataframe used to clip the image (default uses map outline).

- max_canvas_size:

  numeric. Optional. Maximum raster size (in pixels) before tiling (e.g.
  2048).

## Examples

``` r
viz_create(projection = "EqualEarth", background = "white") |>
viz_earth(url = "NE2_50M_SR_W", resolution = 2) |>
viz_render()

{"x":{
  "params": {
    "id": "map",
    "resize": true,
    "responsive": true,
    "projection": "EqualEarth",
    "background": "white",
    "margin": [0, 0, 0, 0],
    "control": true,
    "warning": true
  },
  "layers": [
    {
      "type": "earth",
      "url": "NE2_50M_SR_W",
      "resolution": 2,
      "tileSize": 1024,
      "opacity": 1,
      "dx": 0,
      "dy": 0
    }
  ]
},"evals":[],"jsHooks":[]}
```
