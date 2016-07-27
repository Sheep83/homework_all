selectedIndex = null;
var Farm = require('./farm.js');

window.onload = function(){
  var farm = new Farm();

  var request = new XMLHttpRequest();
  request.open("GET", "http://localhost:3000/animals");
  request.onload = function(){
    if(request.status === 200){
      console.log('Data Retrieved');
      console.log(request);
      var animalObjects = JSON.parse(request.responseText);
      for(animal of animalObjects){
        farm.animals.push(animal);
        submitButton = document.getElementById('submit-button');
        submitButton.onclick = updateDb;
        var dropDown = document.getElementById('drop-down');
        dropDown.onchange = populateDefaults;
        var populateDefaults = function(event){
          var index = this.value;
          // console.log(farm);
          var currentName = document.getElementById('name-field').placeholder = farm.animals[index].name;
          var currentType = document.getElementById('type-field').placeholder = farm.animals[index].type;
          var currentAge = document.getElementById('age-field').placeholder = farm.animals[index].age;
          selectedIndex = index;   
        }
        var updateDb = function(){
          console.log('clicked!');
          console.log(farm);
          console.log(selectedIndex);
          object = farm.animals[selectedIndex];
          console.log(object._id)
          var request = new XMLHttpRequest();
          request.open("PUT", "http://localhost:3000/animals/" + object._id);
          request.setRequestHeader("Content-Type", "application/json");
          console.log(request);
          request.onload = function(){
            console.log(request.status);
            if(request.status === 200){
              request.send(JSON.stringify({
                "_id" : object._id,
                "name": object.name,
                "type": object.type,
                "age" : object.age
              }));

            }
          }
          


        }
      }
      displayFarm(farm);
    }
  }
  request.send(null);
}

var displayFarm = function(farm){
  var dropDown = document.getElementById('drop-down');
  farm.animals.forEach(function(item, index){
    item.index = index;
    var listItem = document.createElement('option');
    listItem.innerText = item.name + " the " + item.type;
    listItem.value = index;
    dropDown.appendChild(listItem);
  })  

}

// var updateDb = function(){
//   console.log('clicked!');
//   console.log(farm);
//   // var request = new XMLHttpRequest();
//   //   request.open("POST", url);
//   //   request.setRequestHeader("Content-Type", "application/json");
//   //   request.onload = function(){
//   //     if(request.status === 200){
//   //     }
//   //   }
//   //   request.send(JSON.stringify( //**YOUR OBJECT HERE **//  ));


// }




