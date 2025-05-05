HTMLWidgets.widget({
  name: "render",
  type: "output",
  factory: function(el) {
    return {
      renderValue: function(x) {
        el.innerHTML = "";
        let svg = geoviz.draw(deepDeserializeGeoJSON(x));
        el.appendChild(svg);
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
