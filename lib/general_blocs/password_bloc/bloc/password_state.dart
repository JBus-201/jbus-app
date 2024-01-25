part of 'password_bloc.dart';

class PasswordState extends Equatable {
  const PasswordState({this.password = 'Add a password here!'});

  final String password;

  @override
  List<Object> get props => [password];

  PasswordState copyWith(String password) {
    return PasswordState(password: password);
  }
}
