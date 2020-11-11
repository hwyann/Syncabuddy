import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 30, maxZoom: 10, duration: 1000 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/hwyan/ckhcu824503jy19qmvy8bauel'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const element = document.createElement('i');
    element.className = 'fas fa-map-marker-alt';
    element.style.color = 'white';
      element.style.width = '25px';
  element.style.height = '25px';

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
