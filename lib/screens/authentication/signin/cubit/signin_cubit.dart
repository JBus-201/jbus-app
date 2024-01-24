import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthService authService;
  final ApiService apiService;
  final SharedPreferences prefs;

  SigninCubit(
      {required this.authService,
      required this.apiService,
      required this.prefs})
      : super(SigninInitial());

  void login(LoginRequest credentials) async {
    emit(SigninLoading());
    try {
      final res = await apiService.login(credentials);
      await authService.setLoggedIn(res.token);
      await prefs.setString('user', json.encode(res.passengerDto.toJson()));
      emit(SigninSuccess());
    } catch (error) {
      emit(SigninFailure(error.toString()));
    }
  }
}
