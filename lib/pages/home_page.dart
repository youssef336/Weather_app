import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/weatherSearch.dart';
import 'package:weather_app/widgets/WeatherInfoBody.dart';
import 'package:weather_app/widgets/noWeatherBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text(
            "Weather App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Weathersearch();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInaitialstate) {
            return const noWeatherBody();
          } else if (state is WeatherLoadedstate) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "oops there was an error 😯, ",
                    style: TextStyle(fontSize: 22, fontFamily: 'Pacifico'),
                  ),
                  Text(
                    "please try later ",
                    style: TextStyle(fontSize: 22, fontFamily: 'Pacifico'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
