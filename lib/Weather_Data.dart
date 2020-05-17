import 'package:flutter/cupertino.dart';
import 'package:weather/Ntwork.dart';
import 'package:weather/Location.dart';
import 'package:weather_icons/weather_icons.dart';
const apiKey='973406ca8e606717178d9b934ec56f20';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Ntwrk networkHelper = Ntwrk(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = new Location();
    await l.getCurrentlocation();
    Ntwrk n = Ntwrk('https://api.openweathermap.org/data/2.5/weather?lat=${l.glatitude}&lon=${l.glongitude}&appid=$apiKey');
    var weatherData = await n.getData();
    return weatherData;
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return WeatherIcons.lightning;
    } else if (condition < 400) {
      return WeatherIcons.rain_wind;
    } else if (condition < 600) {
      return WeatherIcons.umbrella;
    } else if (condition < 700) {
      return WeatherIcons.snowflake_cold;
    } else if (condition < 800) {
      return WeatherIcons.wind;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition <= 804) {
      return WeatherIcons.cloud;
    } else {
      return WeatherIcons.cloud_refresh;
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

  String getImage(int temp) {
    if (temp > 25) {
      return 'sunny';
    } else if (temp > 20) {
      return 'sunny';
    } else if (temp < 10) {
      return 'Night';
    } else {
      return 'Cloudy';
    }
  }
}