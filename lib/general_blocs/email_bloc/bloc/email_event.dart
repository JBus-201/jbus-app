part of 'email_bloc.dart';

sealed class EmailEvent extends Equatable {
  const EmailEvent();
}

class UpdateEmailEvent extends EmailEvent {
  const UpdateEmailEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}
