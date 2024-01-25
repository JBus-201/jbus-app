part of 'password_bloc.dart';

sealed class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class UpdatePasswordEvent extends PasswordEvent {
  const UpdatePasswordEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
