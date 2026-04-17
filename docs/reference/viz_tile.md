# Mercator tiles

The `viz_tile` function adds raster zoomable tiles to a map It requires
a Mercator projection.

## Usage

``` r
viz_tile(
  map,
  id = NULL,
  tileSize = 512,
  zoomDelta = 1,
  opacity = 1,
  url = "openstreetmap",
  clipPath = NULL
)
```

## Arguments

- map:

  A `geoviz` map created with `viz_create`.

- id:

  character. Optional. Unique layer id.

- tileSize:

  numeric. Optional. Tile size (default 512).

- zoomDelta:

  numeric. Optional. Zoom offset (default 1).

- opacity:

  numeric. Optional. Tile opacity (default 1).

- url:

  function or character. Optional. Tile source URL or preset
  ("openstreetmap", "opentopomap", "worldterrain", "worldimagery",
  "worldStreet", "worldphysical", "shadedrelief", "stamenterrain",
  "cartodbvoyager", "stamentoner", "stamentonerbackground",
  "stamentonerlite", "stamenwatercolor", "hillshade", "worldocean",
  "natgeo").

- clipPath:

  character. Optional. SVG clip-path definition (e.g. "url(#myclipid)").

## Examples

``` r
viz_create(projection = "mercator") |>
viz_tile(url = "worldphysical") |>
viz_render()

{"x":{
  "params": {
    "id": "map",
    "resize": true,
    "responsive": true,
    "projection": "mercator",
    "margin": [0, 0, 0, 0],
    "control": true,
    "warning": true
  },
  "layers": [
    {
      "type": "tile",
      "tileSize": 512,
      "zoomDelta": 1,
      "opacity": 1,
      "url": "worldphysical"
    }
  ]
},"evals":[],"jsHooks":[]}
```
