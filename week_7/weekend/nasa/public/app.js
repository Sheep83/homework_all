
window.onload = function () {
    var url = 'https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=T1AUnT68vq8FeqlfaGROtZl5h6mk9iMoz9Z7MKNy'
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function () {
        if (request.status === 200) {
            var jsonString = request.responseText;
            var data = JSON.parse(jsonString);
            main(data);
        }
    }
    button = document.createElement( 'button' );
    button.addEventListener('click', function(){
        console.log('JPL redirect...')
    })
    request.send();
};

var main = function (data) {
    populateSelect(data);
    var cached = localStorage.getItem("selectedItem");
    var selected = data.near_earth_objects[0];

    if(cached){
        selected = JSON.parse(cached);
        document.querySelector('#info').selectedIndex = selected.index;
    }
    updateDisplay(selected);
    document.querySelector('#info').style.display = 'block';
}

var updateDisplay = function (data) {
    var stats = document.querySelectorAll('#info p');
    var url = data.nasa_jpl_url
    stats[0].innerHTML = "<b>Object Name : </b>" + data.name;
    stats[1].innerHTML = "<b>Object Name : </b>" + "<button type='button'><a href = " + url + ">JPL</a></button>";
    stats[2].innerHTML = "<b>Threat to Earth : </b>" + data.is_potentially_hazardous_asteroid; 
}

var populateSelect = function (data) {
    var dropDown = document.querySelector('#dropDown');
    data.near_earth_objects.forEach(function (item, index) {
        item.index = index;
        var option = document.createElement("option");
        option.value = index.toString();
        option.text = item.name;
        dropDown.appendChild(option);
    });
    dropDown.style.display = 'block';
    dropDown.addEventListener('change', function (e) {
        var index = this.value;
        var neo = data.near_earth_objects[index];
        updateDisplay(neo);
        localStorage.setItem("selectedItem",JSON.stringify(neo));
    });
}


