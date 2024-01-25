part of 'name_bloc.dart';

sealed class NameEvent extends Equatable {
  const NameEvent();
}

class UpdateNameEvent extends NameEvent {
  const UpdateNameEvent({this.firstName = '', this.lastName = ''});
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [firstName, lastName];
}
