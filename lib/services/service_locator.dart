import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jbus_app/constants/strings.dart' as constants;
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:jbus_app/services/authentication_interceptor.dart';
import 'package:jbus_app/services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton(NavigationService());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton(sharedPreferences);
  sl.registerSingleton<Interceptor>(AuthenticationInterceptor(sl()));

  final dio = Dio();
  dio.interceptors.add(sl());
  dio.interceptors.add(LogInterceptor());
  dio.options.headers['Content-Type'] = 'application/json';
  sl.registerSingleton(dio);

  sl.registerSingleton(ApiService(sl(), baseUrl: constants.baseUrl));

  sl.registerSingleton(AuthService(sl()));
}
