import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc(this.signUpUseCase, this.loginUseCase) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUpUseCase(
          event.email,
          event.password,
          event.name,
        );
        if (user != null) {
          emit(AuthSuccess(user));
        } else {
          emit(AuthFailure("Sign up failed"));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(event.email, event.password);
        if (user != null) {
          emit(AuthSuccess(user));
        } else {
          emit(AuthFailure("Login failed"));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
