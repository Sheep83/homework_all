
window.onload = function () {
    var url = 'https://restcountries.eu/rest/v1'
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var countries = JSON.parse(jsonString);
            main(countries);
        }
    }
    button = document.querySelector( 'button' );
    button.addEventListener('click', function(){
        var map = new Map ({lat: 0, lng: 0,}, 2);
        var geo = new GeoLocator(map);
        geo.setCenter();
    })
    request.send();
};

var main = function (countries) {
    populateSelect(countries);
    var cached = localStorage.getItem("selectedCountry");
    var selected = countries[0];
    if(cached){
        selected = JSON.parse(cached);
        document.querySelector('#countries').selectedIndex = selected.index;
    }
    updateDisplay(selected);
    document.querySelector('#info').style.display = 'block';
}

var populateSelect = function (countries) {
    var parent = document.querySelector('#countries');
    countries.forEach(function (item, index) {
        item.index = index;
        var option = document.createElement("option");
        option.value = index.toString();
        option.text = item.name;
        parent.appendChild(option);
    });
    parent.style.display = 'block';
    parent.addEventListener('change', function (e) {
        var index = this.value;
        var country = countries[index];
        updateDisplay(country);
        localStorage.setItem("selectedCountry",JSON.stringify(country));
    });
}

var updateDisplay = function (lala) {
    var tags = document.querySelectorAll('#info p');
    tags[0].innerText = lala.name;
    tags[1].innerText = lala.population;
    tags[2].innerText = lala.capital;
    var latLng = { lat: lala.latlng[0], lng: lala.latlng[1] }
    var map = new Map(latLng, 4);
    map.addMarker(latLng);
    map.addInfoWindow(latLng, lala);
    map.bindClick();
}


var Map = function( latLng, zoom ){
  this.googleMap = new google.maps.Map( document.getElementById( 'map' ), {
    center: latLng,
    zoom: zoom
})

  this.addMarker = function(latLng, title){
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.googleMap,
      title: title
  })
    return marker;
}
  this.bindClick = function() {
    var counter = 1;
    google.maps.event.addListener( this.googleMap, 'click', function(event){
      var latLng = {lat: event.latLng.lat(), lng: event.latLng.lng()}
      console.log(event);
      this.addMarker( latLng, counter.toString() );
      counter += 1;
    }.bind (this))
  }

  this.addInfoWindow = function( latLng, object ){
    var marker = this.addMarker( latLng, object.name  )
    marker.addListener( 'click', function(){
        var infoWindow = new google.maps.InfoWindow({
          content: "<b>Country name :</b> " + object.name + "<br>" + "<b>Population : </b>" + object.population + "<br>" + "<b>Capital City : </b>" + object.capital
      })
        infoWindow.open(this.map, marker)
    })
}
}


var GeoLocator = function(map) {
    this.map = map;
    this.setCenter = function() {
      navigator.geolocation.getCurrentPosition( function( position ){
        var pos = { lat: position.coords.latitude, lng: position.coords.longitude};
        var zoomLevel = 1
        this.map.googleMap.panTo(pos);
        this.map.addMarker(pos);
        this.map.googleMap.setZoom(13);
    }.bind(this))

  }

}