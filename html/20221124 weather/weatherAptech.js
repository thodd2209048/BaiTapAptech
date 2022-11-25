let weather = {
  apiKey: "R6QEe1uO6rwsoAAiuK9hQZPmHGxao8io",
  fetchWeather: function() {
    fetch (
    "http://dataservice.accuweather.com/currentconditions/v1/353412?apikey=R6QEe1uO6rwsoAAiuK9hQZPmHGxao8io&details=true"
  )
  .then((response) => response.json())
  .then((data) => this.displayWeather(data));
  },
  displayWeather: function(data) {
    const temp = data[0].Temperature.Metric.Value;
    let icon = data[0].WeatherIcon;
    if (icon < 10) {
      icon = "0" + icon;
    }
    const description = data[0].WeatherText;
    const windSpeed = data[0].Wind.Speed.Metric.Value;
    const windGust = data[0].WindGust.Speed.Metric.Value;
    const pressure = data[0].Pressure.Metric.Value;
    const uv = data[0].UVIndex;
    const today = new Date();
    const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    const dayText = days[today.getDay()] + ', ' 
                    + months[today.getMonth()] + ' '
                    + today.getDate() + ' '
                    + today.getFullYear();
    let minute = today.getMinutes();
    if (minute < 10) {
      minute = "0" + minute;
    }
    let hour = today.getHours();
    if (hour < 10) {
      hour = "0" + hour;
    }
    console.log(temp, description, windSpeed, windGust, pressure, uv, dayText, icon);

    document.querySelector('.hour').innerText = hour + ':' + minute;
    document.querySelector('.time').innerHTML = dayText;
    document.querySelector(".temp").innerText = temp + '°C';
    document.querySelector('.icon').src = "https://developer.accuweather.com/sites/default/files/" + icon + "-s.png";
    document.querySelector('.description').innerText = description;
    document.querySelector('#wind').innerText = windSpeed + ' km/h';
    document.querySelector('#windGust').innerText = windGust + ' km/h';
    document.querySelector('#pressure').innerText = pressure + ' mb';
    document.querySelector('#uv').innerText = uv;
  }
};
document.onload = weather.fetchWeather();

