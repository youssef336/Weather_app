// ignore_for_file: non_constant_identifier_names

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double Temp;
  final double MaxTemp;
  final double MinTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.Temp,
      required this.MaxTemp,
      required this.MinTemp,
      required this.condition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityName: json["location"]["name"],
      date: DateTime.parse(
        json['current']['last_updated'],
      ),
      Temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      MaxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      MinTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
