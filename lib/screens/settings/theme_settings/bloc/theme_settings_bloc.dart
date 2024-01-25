import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/constants/colors/gradients.dart';

part 'theme_settings_event.dart';
part 'theme_settings_state.dart';

class ThemeSettingsBloc extends Bloc<ThemeSettingsEvent, ThemeSettingsState> {
  ThemeSettingsBloc() : super(const ThemeSettingsState()) {
    on<ThemeSettingsEvent>((event, emit) {});

    on<ChangeLightThemeButtonColorEvent>(_changeLightThemeButtonColorEvent);
    on<ChangeDarkThemeButtonColorEvent>(_changeDarkThemeButtonColorEvent);
    on<ChangeSystemThemeButtonColorEvent>(_changeSystemThemeButtonColorEvent);
  }

  FutureOr<void> _changeLightThemeButtonColorEvent(
      ChangeLightThemeButtonColorEvent event,
      Emitter<ThemeSettingsState> emit) {
    Gradient lightButtonColorLight = blueButtonGradient; //
    Gradient darkButtonColorLight = naveyButtonGradient;
    Gradient systemButtonColorLight = naveyButtonGradient;
    Gradient lightButtonColorDark = orangeButtonGradient; //
    Gradient darkButtonColorDark = darkOrangeButtonGradient;
    Gradient systemButtonColorDark = darkOrangeButtonGradient;

    emit(state.copyWith(
      lightButtonColorLight: lightButtonColorLight, //
      darkButtonColorLight: darkButtonColorLight,
      systemButtonColorLight: systemButtonColorLight,
      lightButtonColorDark: lightButtonColorDark, //
      darkButtonColorDark: darkButtonColorDark,
      systemButtonColorDark: systemButtonColorDark,
    ));
  }

  FutureOr<void> _changeDarkThemeButtonColorEvent(
      ChangeDarkThemeButtonColorEvent event, Emitter<ThemeSettingsState> emit) {
    Gradient lightButtonColorLight = naveyButtonGradient;
    Gradient darkButtonColorLight = blueButtonGradient; //
    Gradient systemButtonColorLight = naveyButtonGradient;
    Gradient lightButtonColorDark = darkOrangeButtonGradient;
    Gradient darkButtonColorDark = orangeButtonGradient; //
    Gradient systemButtonColorDark = darkOrangeButtonGradient;

    emit(state.copyWith(
      lightButtonColorLight: lightButtonColorLight,
      darkButtonColorLight: darkButtonColorLight, //
      systemButtonColorLight: systemButtonColorLight,
      lightButtonColorDark: lightButtonColorDark,
      darkButtonColorDark: darkButtonColorDark, //
      systemButtonColorDark: systemButtonColorDark,
    ));
  }

  FutureOr<void> _changeSystemThemeButtonColorEvent(
      ChangeSystemThemeButtonColorEvent event,
      Emitter<ThemeSettingsState> emit) {
    Gradient lightButtonColorLight = naveyButtonGradient;
    Gradient darkButtonColorLight = naveyButtonGradient;
    Gradient systemButtonColorLight = blueButtonGradient; //
    Gradient lightButtonColorDark = darkOrangeButtonGradient;
    Gradient darkButtonColorDark = darkOrangeButtonGradient;
    Gradient systemButtonColorDark = orangeButtonGradient; //

    emit(state.copyWith(
      lightButtonColorLight: lightButtonColorLight,
      darkButtonColorLight: darkButtonColorLight,
      systemButtonColorLight: systemButtonColorLight, //
      lightButtonColorDark: lightButtonColorDark,
      darkButtonColorDark: darkButtonColorDark,
      systemButtonColorDark: systemButtonColorDark, //
    ));
  }
}
