/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	selectedIndex = null;
	var Farm = __webpack_require__(1);

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






/***/ },
/* 1 */
/***/ function(module, exports) {

	var Farm = function(){
	  this.animals = [];
	}

	module.exports = Farm;


/***/ }
/******/ ]);