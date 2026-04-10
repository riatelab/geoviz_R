HTMLWidgets.widget({
  name: "render",
  type: "output",
  factory: function(el, width, height) {
    return {
      renderValue: async function(x) {
        //console.log(x)
        x = deepDeserializeGeoJSON(x)
        if(!x.params.width){x.params.width = el.parentElement.clientWidth}
        el.innerHTML = "";
        let svg = await geoviz.draw(x);
        el.style.height = svg.getAttribute('height') + "px";
        el.appendChild(svg);
    }
  };
}
});

/*
HTMLWidgets.widget({
  name: "render",
  type: "output",
  factory: function(el, width, height) {
    return {
      renderValue: async function(x) {

        x = deepDeserializeGeoJSON(x);

        if (!x.params.width) {
          x.params.width = el.parentElement.clientWidth;
        }

        el.innerHTML = "";

        let svg = await geoviz.draw(x);

        el.appendChild(svg);
        let h = svg.getAttribute("height");
        if (!h || h === "0") {
          h = svg.getBoundingClientRect().height;
        }
        if (!h || h === 0) {
          h = 750;
        }
        console.log(h);
        el.style.height = h + "px";
      },
      resize: function(width, height) {
      }
    };
  }
});*/

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
