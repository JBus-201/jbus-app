import 'package:dio/dio.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;

  AuthenticationInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sharedPreferences.getString(AuthService.tokenKey);
    if (token != null) options.headers['Authentication'] = 'Bearer $token';
    handler.next(options);
  }
}
