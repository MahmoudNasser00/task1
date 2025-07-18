part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWeather extends WeatherEvent {
  final String city;
  LoadWeather(this.city);

  @override
  List<Object?> get props => [city];
}
