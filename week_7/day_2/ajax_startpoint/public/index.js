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
  displayStorage(localStorage);
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
  var infoBox = document.getElementById( 'info' );
  cName = document.getElementById( 'cName' );
  cPop = document.getElementById( 'cPop' );
  cCap = document.getElementById( 'cCap' );
  cName.innerText = "The country name is " + " " + countries[index].name;
  cPop.innerText = "The population of " + countries[index].name + " is " + countries[index].population;
  cCap.innerText = "The capital city of " + countries[index].name + " is " + countries[index].capital;
  var borders = countries[index].borders;
  var prettyBorders = [];
  for (x of borders){
    for (y of countries){
      if (x === y.alpha3Code){
        prettyBorders.push(y.name);
        console.log(prettyBorders);
      }
    }
  }
  var borderList = prettyBorders.toString();
  brdrs = document.getElementById( 'brdrs')
  brdrs.innerText = countries[index].name + " shares a border with : " + " " + borderList;
  // infoBox.appendChild(cName);
  // infoBox.appendChild(cPop);
  // infoBox.appendChild(cCap);
  var array = [];
  array.push(countries[index].name, countries[index].population, countries[index].capital);
  localStorage.setItem('country_list', JSON.stringify(array));
} 

function displayStorage(localStorage){
  var stored = JSON.parse( localStorage.getItem('country_list') );
  console.log(stored);
  cName = document.getElementById( 'cName' );
  cPop = document.getElementById( 'cPop' );
  cCap = document.getElementById( 'cCap' );
  cName.innerText = "The country name is " + " " + stored[0];
  cPop.innerText = "The population of " + stored[0] + " is " + stored[1];
  cCap.innerText = "The capital city of " + stored[0] + " is " + stored[2];
}



