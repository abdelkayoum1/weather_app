import 'package:weather_app/modele/weather_model.dart';

class GetWeather {}

class GetweatherNotState extends GetWeather {}

class Getweatherinfostate extends GetWeather {
  final WeatherModel weathermodel;

  Getweatherinfostate(this.weathermodel);
}

class Getweatherexcetption extends GetWeather {}
