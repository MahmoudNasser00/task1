import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required String date,
    required double temperature,
    required double humidity,
    required double windSpeed,
  }) : super(
          date: date,
          temperature: temperature,
          humidity: humidity,
          windSpeed: windSpeed,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'],
      temperature: json['day']['avgtemp_c'].toDouble(),
      humidity: json['day']['avghumidity'].toDouble(),
      windSpeed: json['day']['maxwind_kph'].toDouble(),
    );
  }
}