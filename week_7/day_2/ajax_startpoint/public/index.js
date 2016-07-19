window.onload = function(){
  console.log('window loaded');
  var url = 'https://restcountries.eu/rest/v1';
  var request = new XMLHttpRequest();
  request.open( "GET", url );
  request.onload = function(){
    if (request.status === 200) {
      var jsonString = request.responseText;
      var countries = JSON.parse( jsonString );
      populateSelect(countries);
    }
  }
  request.send( null );
}  /// main function end

function populateSelect(countries){
  var list = document.getElementById( 'drop-down-list' );
  list.onchange = function(event){
    displayData(event, countries);
  }
  for (item in countries) {
    var listItem = document.createElement( 'option' );
    listItem.innerText = countries[item].name;
    listItem.value = item;
    list.appendChild( listItem );
  }
}

function displayData(event, countries){
  var index = event.target.value;
  console.log(countries[index]);
  var infoBox = document.getElementById( 'info' );
  cName = document.createElement( 'p' );
  cPop = document.createElement( 'p' );
  cCap = document.createElement( 'p');
  cName.innerText = countries[index].name;
  cPop.innerText = countries[index].population;
  cCap.innerText = countries[index].capital;
  infoBox.appendChild(cName);
  infoBox.appendChild(cPop);
  infoBox.appendChild(cCap);
} 



