part of 'name_bloc.dart';

class NameState extends Equatable {
  const NameState({this.firstName = 'User Name', this.lastName = ""});

  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [firstName, lastName];

  NameState copyWith(String firstName, String lastName) {
    return NameState(firstName: firstName, lastName: lastName);
  }
}
