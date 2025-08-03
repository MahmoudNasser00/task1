import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/predict_training_usecase.dart';

part 'predict_event.dart';
part 'predict_state.dart';

class PredictBloc extends Bloc<PredictEvent, PredictState> {
  final PredictTrainingUseCase useCase;
  PredictBloc(this.useCase) : super(PredictInitial()) {
    on<StartPrediction>((event, emit) async {
      emit(PredictLoading());
      try {
        final prediction = await useCase(
          temperature: event.temperature,
          humidity: event.humidity,
          windSpeed: event.windSpeed,
        );
        emit(PredictLoaded(prediction == 1));
      } catch (_) {
        emit(PredictError("Prediction failed"));
      }
    });
  }
}