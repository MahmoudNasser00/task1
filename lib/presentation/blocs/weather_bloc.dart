import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/get_weather_usecase.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final forecast = await getWeather(event.city);
        emit(WeatherLoaded(forecast));
      } catch (_) {
        emit(WeatherError('Failed to fetch weather'));
      }
    });
  }
}
