import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<List<WeatherEntity>> call(String city) {
    return repository.get3DaysForecast(city);
  }
}
