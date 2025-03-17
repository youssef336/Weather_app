// ignore_for_file: file_names

import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = '38f1524c6da54e25ad9210757241507';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "opps there was an error , please try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opps there was an error , please try later");
    }
  }
}
