import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/Weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInaitialstate());
  WeatherModel? weatherModel;
  getweather({required String cityname}) async {
    try {
      weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityname);
      emit(WeatherLoadedstate(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherfailureState());
    }
  }
}
