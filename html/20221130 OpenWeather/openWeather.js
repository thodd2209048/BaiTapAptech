let weather = {
  apiKey: "API KEY", 
  fetchWeather: function() {
    fetch (
      "https://api.openweathermap.org/data/2.5/weather?q=hanoi&units=metric&appid="
      + this.apiKey
    )
    .then((response) => response.json())
    .then((data) => this.displayWeather(data));
  },
  displayWeather: function (data) {
    const {icon} = data.weather[0];
    const {temp} = data.main;
    const {description} = data.weather[0];
    document.querySelector("#icon").src = "http://openweathermap.org/img/wn/"+ icon + "@2x.png";
    document.querySelector("#temp").innerHTML = temp + "°C";
    document.querySelector("#title").innerHTML = description;
  }
};

weather.fetchWeather();