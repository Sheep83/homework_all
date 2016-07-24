window.onload = function () {

    var calendar = document.getElementById('inputDate')
    // console.log(calendar);
    calendar.onchange = function(e, request){
        selected = e.target.value;
        url = 'https://api.nasa.gov/planetary/apod?&date=' + selected + '&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
        console.log(url);
        var request = new XMLHttpRequest();
        request.open("GET", url);
        request.onload = function () {
            if (request.status === 200) {
                var jsonString = request.responseText;
                var data = JSON.parse(jsonString);
                // console.log(data);
                apodDisplay(data);
                
            }
        }
        request.send();
    }
    var button = document.getElementById('random');
    button.onclick = randomDate();
    console.log(randDate);
    var url = 'https://api.nasa.gov/planetary/apod?date=' + randDate + '&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var data = JSON.parse(jsonString);
            console.log(data);   
        }
        main(data)
    }
    request.send();
}
    var url = 'https://api.nasa.gov/planetary/apod?&api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy';
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var data = JSON.parse(jsonString);
            // console.log(data);   
        }
        main(data)
    }
    request.send();


var apodDisplay = function(data){
    var stats = document.querySelectorAll('#info p');
    var title = document.getElementById('subheading');
    // console.log(title);
    // console.log(data);
    title.innerHTML = "<b><center>" + data.title + "</center></b>"
    stats[0].innerHTML = "<b>Description : </b>" + data.explanation;
        stats[1].innerHTML = "<b>Copyright : </b>" + data.copyright;
        stats[2].innerHTML = "<b>Date : </b>" + data.date;
        showImage(data.url, 400, 300, data.url)
     
    }
var showImage = function(src, width, height, alt) {
        var imgDiv = document.getElementById('img');
        console.log(img);
        if (imgDiv.firstChild){
            // console.log(imgDiv.firstChild);
            imgDiv.removeChild(imgDiv.firstChild);
            var img = document.createElement("img");
            img.src = src;
            img.width = 400;
            img.height = 300;
            img.alt = src;
            imgDiv.appendChild(img);
        }else{var img = document.createElement("img");
            img.src = src;
            img.width = 400;
            img.height = 300;
            img.alt = src;
            imgDiv.appendChild(img);
        }
        
    }

var main = function(data){
    apodDisplay(data);
    // console.log(data);
}

var randomDate = function(){
  array = [];
  randDay = Math.floor((Math.random() * 28) + 1);
  randMonth = Math.floor((Math.random() * 12) + 1);
  randYear = Math.floor(Math.random() * (2015 - 1996) + 1996);
  array.push(randYear, randMonth, randDay);
  randDate = array.join('-');
  return randDate;
}


