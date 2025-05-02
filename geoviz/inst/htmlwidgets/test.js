HTMLWidgets.widget({
  name: 'test',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        //el.innerHTML = ""; // Vide le conteneur
/*        el.style.width = width + "px";
        el.style.height = height + "px";*/

          let svg = geoviz.create({ projection: "NaturalEarth1" });
          svg.outline();
          svg.graticule();
          svg.header({ text: x });
          const rendered = svg.render();
          el.appendChild(rendered);
      },

      resize: function(width, height) {
/*        el.style.width = width + "px";
        el.style.height = height + "px";*/
      }
    };
  }
});
