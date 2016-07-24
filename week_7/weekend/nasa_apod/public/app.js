window.onload = function () {
    visited = [];
    var url = 'https://api.nasa.gov/planetary/apod?&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
    var calendar = document.getElementById('inputDate');
    var button = document.getElementById('random');
    var historyDropDown = document.getElementById('history');
    calendar.onchange = getByDate;
    button.onclick = randomDate;
    historyDropDown.onchange = getFromHistory;
    console.log(url);
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var data = JSON.parse(jsonString);
        }
        main(data)
    }
    request.send();
}


var apodDisplay = function(data){
    var stats = document.querySelectorAll('#info p');
    var title = document.getElementById('subheading');
    title.innerHTML = "<b><center>" + data.title + "</center></b>"
    stats[0].innerHTML = "<b>Description : </b>" + data.explanation;
    stats[1].innerHTML = "<b>Copyright : </b>" + data.copyright;
    stats[2].innerHTML = "<b>Date : </b>" + data.date;
    showImage(data.url, 400, 300, data.url)

}
var showImage = function(src, width, height, alt) {
    var imgDiv = document.getElementById('img');
    if (imgDiv.firstChild){
        imgDiv.removeChild(imgDiv.firstChild);
        var img = document.createElement("img");
        img.src = src;
        img.width = 500;
        img.height = 375;
        img.alt = src;
        imgDiv.appendChild(img);
    }else{var img = document.createElement("img");
    img.src = src;
    img.width = 500;
    img.height = 375;
    img.alt = src;
    imgDiv.appendChild(img);
}

}

var main = function(data){
    apodDisplay(data);
    populateHistory(visited);
}

var randomDate = function(){
  array = [];
  randDay = Math.floor((Math.random() * 28) + 1);
  randMonth = Math.floor((Math.random() * 12) + 1);
  randYear = Math.floor(Math.random() * (2015 - 1996) + 1996);
  array.push(randYear, randMonth, randDay);
  randDate = array.join('-');
  console.log(randDate);
  url = 'https://api.nasa.gov/planetary/apod?date=' + randDate + '&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
  var request = new XMLHttpRequest();
  request.open("GET", url);
  request.onload = function () {
      if (request.status === 200) {
          var jsonString = request.responseText;
          var data = JSON.parse(jsonString);
          visited.push(data);
          console.log(visited);
          // localStorage.setItem("selectedHistory",JSON.stringify(data));
      }
      
      main(data);
  }
  request.send();
}

var getByDate = function(event){
    console.log(event);
    selected = event.target.value;
    url = 'https://api.nasa.gov/planetary/apod?&date=' + selected + '&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var data = JSON.parse(jsonString);
            visited.push(data);
            var length = localStorage.length;
            // localStorage.setItem("selectedHistory",JSON.stringify(data));
            console.log(visited);    
    }
        main(data);
    }
    request.send();
}

var populateHistory = function(visitedArray){
    // var objects = localStorage.getItem("selectedHistory",JSON.parse);
    // console.log(objects.size);
    var historyDropDown = document.querySelector('#history');
    historyDropDown.innerHTML = ""
    visitedArray.forEach(function (item, index) {
        item.index = index;
        var option = document.createElement("option");
        option.value = index.toString();
        option.text = item.date;
        historyDropDown.appendChild(option);
    });
    historyDropDown.style.display = 'block';
    
}

var getFromHistory = function(event){
    console.log(event);
    var index = this.value;
    var img = visited[index];
    console.log(index);    
    apodDisplay(img);
    // localStorage.setItem("selectedImg",JSON.stringify(img));
}

