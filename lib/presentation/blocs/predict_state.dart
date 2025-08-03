part of 'predict_bloc.dart';

abstract class PredictState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PredictInitial extends PredictState {}
class PredictLoading extends PredictState {}
class PredictLoaded extends PredictState {
  final bool isPerfect;
  PredictLoaded(this.isPerfect);

  @override
  List<Object?> get props => [isPerfect];
}
class PredictError extends PredictState {
  final String message;
  PredictError(this.message);

  @override
  List<Object?> get props => [message];
}