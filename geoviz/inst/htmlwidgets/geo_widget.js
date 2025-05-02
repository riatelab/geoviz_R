HTMLWidgets.widget({
  name: "geo_widget",
  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        el.innerHTML = "";

        let svg = geoviz.create({ projection: x.projection });

        x.layers.forEach(layer => {
          switch (layer.type) {
            case "graticule":
              svg.graticule();
              break;
            case "outline":
              svg.outline();
              break;
            case "header":
              svg.header({ text: layer.text });
              break;
          }
        });

        el.appendChild(svg.render());
      }
    };
  }
});
