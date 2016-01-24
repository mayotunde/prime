<!doctype html>
<html>
<head>
<title>Load Geojson point features with style from github</title>
  <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
   
  <script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
<body>
  <div id="map" style='width:700px;height:500px'></div>
  <script>
 var map = L.map('map').setView([4.60, 2.90], 3);
mapLink = '<a href="http://openstreetmap.org">openstreetmap</a>,'+'<a href="http://mapsnigeriainitiative.wordpress.com">mapsNI</a>,'+'Census data:NPC 2006'; 
L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {attribution: ' &copy; ' + mapLink,maxZoom: 18}).addTo(map);

var style= {fillColor:'brown', color:'black', fillOpacity:0.5};

  $.getJSON("", function(data) {
    var geojson = L.geoJson(data, {
      pointToLayer: function (feature, latlng) {
        marker = new L.circleMarker(latlng, style)
marker.bindPopup(feature.properties.address); return marker
      }}).addTo(map);
  });
  </script>
</body>
</html>
