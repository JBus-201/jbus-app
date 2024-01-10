import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
      : super(const SignupState(
            icon: Icons.visibility_off_outlined, obscureText: true)) {
    on<SignupEvent>((event, emit) {});

    on<SwitchToVisibilityOnEvent>(_switchToVisibilityOnEvent);
    on<SwitchToVisibilityOffEvent>(_switchToVisibilityOffEvent);
  }

  FutureOr<void> _switchToVisibilityOnEvent(
      SwitchToVisibilityOnEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(Icons.visibility_outlined, false));
  }

  FutureOr<void> _switchToVisibilityOffEvent(
      SwitchToVisibilityOffEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(Icons.visibility_off_outlined, true));
  }
}
