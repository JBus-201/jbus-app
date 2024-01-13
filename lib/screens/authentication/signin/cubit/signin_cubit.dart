import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/services/auth_service.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthService authService;
  final ApiService apiService;

  SigninCubit({required this.authService, required this.apiService})
      : super(const Signinfilling());

  void emailChanged(String value) {
    emit(Signinfilling(
      email: value,
      password: state.password,
    ));
  }

  void passwordChanged(String value) {
    emit(Signinfilling(
      email: state.email,
      password: value,
    ));
  }

  void submit() async {
    final email = state.email;
    final password = state.password;
    emit(SigninLoading());
    print("email: $email, password: $password");
    if (email.isEmpty || password.isEmpty) {
      print("in if");
      emit(SigninFailure());
      return;
    }
    print("after if");
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    print("in submit");
    try {
      final response = await apiService.login(loginRequest);
      print("in try 1");
      await authService.setLoggedIn(response.token);
      print("in try");
      log(response.toString());
    } catch (e) {
      print("in catch");
      emit(SigninFailure());
      return;
    }

    emit(SigninSuccess());
  }
}
