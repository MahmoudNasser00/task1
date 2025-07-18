import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/supabase_config.dart';
import 'data/auth_repository_impl.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/signup_usecase.dart';
import 'presentation/blocs/auth_bloc.dart';
import 'presentation/screens/welcome_screen.dart';
import 'package:dio/dio.dart';
import 'data/data_sources/weather_remote_data_source.dart';
import 'data/repositories_impl/weather_repository_impl.dart';
import 'domain/usecases/get_weather_usecase.dart';
import 'presentation/blocs/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();

  final authRepository = AuthRepositoryImpl();
  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthBloc(
                SignUpUseCase(authRepository),
                LoginUseCase(authRepository),
              ),
            ),
            BlocProvider(
              create: (_) => WeatherBloc(
                GetWeatherUseCase(
                  WeatherRepositoryImpl(WeatherRemoteDataSource(Dio())),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Supabase Auth App',
            home: const WelcomeScreen(),
          ),
        );
      },
    );
  }
}
