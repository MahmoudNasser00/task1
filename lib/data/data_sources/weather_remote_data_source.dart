import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSource(this.dio);

  Future<List<WeatherModel>> get3DaysForecast(String city) async {
    const apiKey = '326b7349e7cc4e7b9d012514251807';
    final response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {'key': apiKey, 'q': city, 'days': 3},
    );

    final List data = response.data['forecast']['forecastday'];
    return data.map((day) => WeatherModel.fromJson(day)).toList();
  }
}
