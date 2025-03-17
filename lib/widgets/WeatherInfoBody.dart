// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             
              getThemeColor(weatherModel.condition),
              getThemeColor(weatherModel.condition)[300]!,
              getThemeColor(weatherModel.condition)[50]!,
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Image.network("https:${weatherModel.image}"),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(weatherModel.Temp.round().toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      children: [
                        Text("MaxTemp: ${weatherModel.MaxTemp.round()}"),
                        Text("MinTemp: ${weatherModel.MinTemp.round()}"),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                weatherModel.condition,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
