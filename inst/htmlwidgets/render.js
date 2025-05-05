HTMLWidgets.widget({
  name: "render",
  factory: function(el,width, height) {
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
