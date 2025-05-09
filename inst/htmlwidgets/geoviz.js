HTMLWidgets.widget({
  name: "render",
  type: "output",
  factory: function(el) {
    return {
      renderValue: function(x) {
       //console.log(deepDeserializeGeoJSON(x))
        el.innerHTML = "";
        //let svg = geoviz.draw(x);
        let svg = geoviz.draw(deepDeserializeGeoJSON(x));
        el.appendChild(svg);
      },
         renderValue: function(x, file = 'image.svg') {
       //console.log(deepDeserializeGeoJSON(x))
        el.innerHTML = "";
        //let svg = geoviz.draw(x);
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

// Helpers to deserliaze geoJSONs
function isGeoJSON(obj) {
  if (typeof obj !== 'object' || obj === null) return false;
  return ['Feature', 'FeatureCollection', 'Point', 'LineString', 'Polygon', 'MultiPoint', 'MultiLineString', 'MultiPolygon', 'GeometryCollection'].includes(obj.type);
}

function tryParseGeoJSON(value) {
  if (typeof value !== 'string') return value;
  try {
    const parsed = JSON.parse(value);
    return isGeoJSON(parsed) ? parsed : value;
  } catch (e) {
    return value;
  }
}

function deepDeserializeGeoJSON(obj) {
  if (Array.isArray(obj)) {
    return obj.map(deepDeserializeGeoJSON);
  } else if (typeof obj === 'object' && obj !== null) {
    const result = {};
    for (const [key, value] of Object.entries(obj)) {
      const parsedValue = tryParseGeoJSON(value);
      result[key] = deepDeserializeGeoJSON(parsedValue);
    }
    return result;
  } else {
    return obj;
  }
}
