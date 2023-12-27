import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(thememode: ThemeMode.light)) {
    on<ThemeEvent>((event, emit) {});

    on<SwitchToLightThemeEvent>(_switchToLightThemeEvent);
    on<SwitchToDarkThemeEvent>(_switchToDarkThemeEvent);
    on<SwitchToSystemThemeEvent>(_switchToSystemThemeEvent);
  }

  FutureOr<void> _switchToLightThemeEvent(SwitchToLightThemeEvent event, Emitter<ThemeState> emit) {
    //ThemeMode themeMode = ThemeMode.light;

    emit(state.copyWith(ThemeMode.light));
  }

  FutureOr<void> _switchToDarkThemeEvent(SwitchToDarkThemeEvent event, Emitter<ThemeState> emit) {
    //ThemeMode themeMode = ThemeMode.dark;

    emit(state.copyWith(ThemeMode.dark));
  }

  FutureOr<void> _switchToSystemThemeEvent(SwitchToSystemThemeEvent event, Emitter<ThemeState> emit) {
    //ThemeMode themeMode = ThemeMode.system;
    // if (kDebugMode) {
    //   print('Theme Mode');
    // }

    emit(state.copyWith(ThemeMode.system));
  }
}
