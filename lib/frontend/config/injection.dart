import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plusone/frontend/config/api_client.dart';
import 'package:plusone/frontend/data/repositories/user_repository.dart';
import 'package:plusone/frontend/data/repositories/user_repository_remote.dart';
import 'package:plusone/frontend/data/services/user_service.dart';
import 'package:plusone/frontend/ui/auth/view_models/auth_view_model.dart';
import 'package:plusone/frontend/config/interceptor.dart';

final getIt = GetIt.instance;

void startUp() {
  //dio
    getIt.registerLazySingleton<Dio>(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          // 4xx — ожидаемые ответы API, не бросаем исключение внутри Dio
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      dio.interceptors.add(LoggingInterceptor());
      return dio;
    });
  
  //services
  getIt.registerLazySingleton<UserService>(() => UserService(getIt<Dio>()));
  //repos
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryRemote(getIt<UserService>()),
  );
  //vm
  getIt.registerFactory<AuthViewModel>(
    () => AuthViewModel(userRepository: getIt<UserRepository>()),
  );
}
