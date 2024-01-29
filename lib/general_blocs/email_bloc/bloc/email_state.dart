part of 'email_bloc.dart';

class EmailState extends Equatable {
  const EmailState({this.email = 'Add an email'});

  final String email;

  @override
  List<Object> get props => [email];

  EmailState copyWith(String email) {
    return EmailState(email: email);
  }
}
