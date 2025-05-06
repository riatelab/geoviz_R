# d3carto

`d3carto` is an R package for thematic mapping. As its name suggests, it's an htmlwidget based on the [d3.js](https://d3js.org/) ecosystem ported by Mike Bostock. More specifically, it is an implementation of the [geoviz](https://riatelab.github.io/geoviz/) JavaScript library developed by [RiateLab](https://riate.cnrs.fr/riatelab.html). The package can be used to create a wide range of interactive, zoomable vector maps, taking advantage of d3's many features: proprtional symbols, pictograms, typologies, choropleth maps, Spikes, tiles, Droing cartograms, etc. 

# Principles

- The d3carto package is an R implementation of the geoviz JavaScript library via a htmlwidget. Its development follows the evolution of the library. The parameter names are the same. You can therefore refer to the geoviz documentation [here](https://riatelab.github.io/geoviz/).

- d3carto is not intended to compete with other mapping packages in R, such as mapsf or tmap. Since it's based on d3.js, the philosophy behind this package is completely different.

- d3carto lets you create maps in SVG format. Therefore, the map parameters use svg attributes rather than the usual R parameters. Thus, `strokeWidth` is used rather than `lwd`, `fill` rather than `col`, `stroke` rather than `border`, etc.

- Projections

d3carto is designed to work with geographic data in wgs84 (not projected). Geometries are then projected on the fly using the create() function. The projections used come from the d3.js ecosystem (d3-geo, d3-geo-projection & d3-geo-polygon).

- Pan and zoom

d3carto offers two types of zoom. The classic type and the “versor” type. Versor lets you change the projection center on the fly. This can be used, for example, to create interactive globes.

- Tooltips

Maps created with d3carto are interactive. It is therefore possible to create tooltips to access information contained in geographic objects.

- Map types

todo

# Install

todo

# Example

todo

# xxx

xxx
