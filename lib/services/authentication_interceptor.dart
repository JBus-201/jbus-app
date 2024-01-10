import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;

  AuthenticationInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    final token = _sharedPreferences.getString('token');
    options.headers['Authentication'] = 'Bearer $token';
    handler.next(options);
  }
}
