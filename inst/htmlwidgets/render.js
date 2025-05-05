HTMLWidgets.widget({
  name: "render",
  type: "output",
  factory: function(el) {
    return {
      renderValue: function(x) {
         console.log(x);
        el.innerHTML = "";
        let svg = geoviz.draw(x);
        el.appendChild(svg);
      }
    };
  }
});
