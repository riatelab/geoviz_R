HTMLWidgets.widget({
  name: "save",
  type: "output",
  factory: function(el) {
    return {
      renderValue: function(x, file = 'map.svg') {
        el.innerHTML = "";
        let svg = geoviz.draw(deepDeserializeGeoJSON(x));
        el.appendChild(svg);

 const serializer = new XMLSerializer();
  let source = serializer.serializeToString(svg);

  if (!source.includes('xmlns="http://www.w3.org/2000/svg"')) {
    source = source.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"');
  }

  source = '<?xml version="1.0" standalone="no"?>\r\n' + source;

  const blob = new Blob([source], { type: 'image/svg+xml;charset=utf-8' });
  const url = URL.createObjectURL(blob);

  const link = document.createElement('a');
  link.href = url;
  link.download = file;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  URL.revokeObjectURL(url);
    }
    };
  }
});
