import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(const NameState()) {
    on<NameEvent>((event, emit) {});

    on<UpdateNameEvent>(_updateNameEvent);
  }

  FutureOr<void> _updateNameEvent(
      UpdateNameEvent event, Emitter<NameState> emit) {
    String firstName;
    String lastName;

    if (event.firstName == '') {
      firstName = state.firstName;
    } else {
      firstName = event.firstName;
    }

    if (event.lastName == '') {
      lastName = state.lastName;
    } else {
      lastName = event.lastName;
    }

    emit(state.copyWith(firstName, lastName));
  }
}
