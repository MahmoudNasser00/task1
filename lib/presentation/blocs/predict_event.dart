part of 'predict_bloc.dart';

abstract class PredictEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartPrediction extends PredictEvent {
  final double temperature;
  final double humidity;
  final double windSpeed;

  StartPrediction({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [temperature, humidity, windSpeed];
}