import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({required String date, required double temperature})
    : super(date: date, temperature: temperature);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'],
      temperature: json['day']['avgtemp_c'].toDouble(),
    );
  }
}
