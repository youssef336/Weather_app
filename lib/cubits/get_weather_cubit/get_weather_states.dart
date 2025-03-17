import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherInaitialstate extends WeatherStates {}

class WeatherLoadedstate extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedstate({required this.weatherModel});
}

class WeatherfailureState extends WeatherStates {}
