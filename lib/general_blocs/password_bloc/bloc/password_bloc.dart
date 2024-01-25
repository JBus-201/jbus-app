import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(const PasswordState()) {
    on<PasswordEvent>((event, emit) {});

    on<UpdatePasswordEvent>(_updatePasswordEvent);
  }

  FutureOr<void> _updatePasswordEvent(
      UpdatePasswordEvent event, Emitter<PasswordState> emit) {
    String password;
    password = event.password;

    emit(state.copyWith(password));
  }
}
