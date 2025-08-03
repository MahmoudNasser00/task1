import '../../data/data_sources/predict_training_remote_data_source.dart';

class PredictTrainingUseCase {
  final PredictTrainingRemoteDataSource dataSource;
  PredictTrainingUseCase(this.dataSource);

  Future<int> call({
    required double temperature,
    required double humidity,
    required double windSpeed,
  }) {
    return dataSource.predictTrainingSuitability(
      temperature: temperature,
      humidity: humidity,
      windSpeed: windSpeed,
    );
  }
}