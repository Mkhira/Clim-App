import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'e4d474caf410b45117ec1dc3a3a6b3a5';
const opeanweatherurl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    var url = '$opeanweatherurl?q=$cityname&appid=$apikey&units=metric';
    Networkhelpper networkhelpper = Networkhelpper(url: url);
    var weatherdata = await networkhelpper.getdata();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentlocation();

    Networkhelpper networkhelpper = Networkhelpper(
        url:
            '$opeanweatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networkhelpper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
