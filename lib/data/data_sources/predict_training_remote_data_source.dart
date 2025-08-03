import 'package:dio/dio.dart';

class PredictTrainingRemoteDataSource {
  final Dio dio;
  PredictTrainingRemoteDataSource(this.dio);

  Future<int> predictTrainingSuitability({
    required double temperature,
    required double humidity,
    required double windSpeed,
  }) async {
    final url = 'http://192.168.1.8:5001/predict';
    final response = await dio.post(
      url,
      data: {
        "features": [temperature, humidity, windSpeed],
      },
    );
    return response.data['prediction'][0];
  }
}
