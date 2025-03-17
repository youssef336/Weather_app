// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Weathersearch extends StatelessWidget {
  const Weathersearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Row(children: [
            Text(
              "Search City",
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async {
                var getweatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getweatherCubit.getweather(cityname: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  labelText: "Search",
                  border: OutlineInputBorder(),
                  hintText: 'Enter city name',
                  suffixIcon: Icon(Icons.search)),
            ),
          ],
        ),
      ),
    );
  }
}
