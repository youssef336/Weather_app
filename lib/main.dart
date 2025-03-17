import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const Weather_app());
}

// ignore: camel_case_types
class Weather_app extends StatelessWidget {
  const Weather_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // primarySwatch: getThemeColor(
                //     BlocProvider.of<GetWeatherCubit>(context)
                //         .weatherModel
                //         ?.condition),
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                ),
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  // Define MaterialColor groups
  MaterialColor sunnyColor = Colors.orange;
  MaterialColor cloudyColor = Colors.blueGrey;
  MaterialColor foggyColor = Colors.grey;
  MaterialColor rainColor = Colors.blue;
  MaterialColor snowColor = Colors.grey; // Using grey as a proxy for snow
  MaterialColor thunderColor = Colors.yellow;
  if (condition == null) {
    return Colors.blue;
  }
  // Group weather conditions and map to MaterialColor
  if (condition == "Sunny" || condition == "Clear") {
    return sunnyColor; // Bright color for sunny or clear conditions
  } else if (condition == "Partly cloudy" ||
      condition == "Cloudy" ||
      condition == "Overcast") {
    return cloudyColor; // Grey shades for cloudy or overcast
  } else if (condition == "Mist" ||
      condition == "Fog" ||
      condition == "Freezing fog") {
    return foggyColor; // Neutral grey for misty or foggy conditions
  } else if (condition == "Patchy rain possible" ||
      condition == "Light rain" ||
      condition == "Moderate rain at times" ||
      condition == "Heavy rain" ||
      condition == "Patchy light rain" ||
      condition == "Heavy rain at times") {
    return rainColor; // Blue shades for rain
  } else if (condition == "Patchy snow possible" ||
      condition == "Light snow" ||
      condition == "Moderate snow" ||
      condition == "Heavy snow" ||
      condition == "Patchy heavy snow" ||
      condition == "Blowing snow" ||
      condition == "Blizzard") {
    return snowColor; // Grey for snowy conditions
  } else if (condition == "Patchy sleet possible" ||
      condition == "Light sleet" ||
      condition == "Moderate or heavy sleet" ||
      condition == "Light sleet showers" ||
      condition == "Moderate or heavy sleet showers") {
    return foggyColor; // Grey for sleet
  } else if (condition == "Patchy freezing drizzle possible" ||
      condition == "Freezing drizzle" ||
      condition == "Heavy freezing drizzle") {
    return foggyColor; // Grey for freezing drizzle
  } else if (condition == "Thundery outbreaks possible" ||
      condition == "Patchy light rain with thunder" ||
      condition == "Moderate or heavy rain with thunder" ||
      condition == "Patchy light snow with thunder" ||
      condition == "Moderate or heavy snow with thunder") {
    return thunderColor; // Yellow for thunderstorm conditions
  } else if (condition == "Ice pellets" ||
      condition == "Light showers of ice pellets" ||
      condition == "Moderate or heavy showers of ice pellets") {
    return foggyColor; // Grey for ice pellets
  } else if (condition == "Light rain shower" ||
      condition == "Moderate or heavy rain shower" ||
      condition == "Torrential rain shower") {
    return rainColor; // Blue shades for rain showers
  } else if (condition == "Light snow showers" ||
      condition == "Moderate or heavy snow showers") {
    return snowColor; // Grey for snow showers
  } else {
    return foggyColor; // Default color if the condition is not recognized
  }
}
