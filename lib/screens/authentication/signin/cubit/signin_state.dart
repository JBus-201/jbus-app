import 'package:equatable/equatable.dart';

sealed class SigninState extends Equatable {
  final String email;
  final String password;

  const SigninState({this.email = '', this.password = ''});

  @override
  List<Object> get props => [email, password];
}

final class Signinfilling extends SigninState {
  const Signinfilling({super.email, super.password});

  copyWith({String? email, String? password}) {
    return Signinfilling(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {}

final class SigninFailure extends SigninState {}
