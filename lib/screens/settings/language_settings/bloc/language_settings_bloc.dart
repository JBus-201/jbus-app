import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';

part 'language_settings_event.dart';
part 'language_settings_state.dart';

class LanguageSettingsBloc
    extends Bloc<LanguageSettingsEvent, LanguageSettingsState> {
  LanguageSettingsBloc() : super(const LanguageSettingsState(
            // arabicButtonColorLight: naveyButtonGradient,
            // englishButtonColorLight: naveyButtonGradient,
            // systemButtonColorLight: naveyButtonGradient,
            // arabicButtonColorDark: darkOrangeButtonGradient,
            // englishButtonColorDark: darkOrangeButtonGradient,
            // systemButtonColorDark: darkOrangeButtonGradient,
            )) {
    on<LanguageSettingsEvent>((event, emit) {});

    on<ChangeArabicButtonColorEvent>(_changeArabicButtonColorEvent);
    on<ChangeEnglishButtonColorEvent>(_changeEnglishButtonColorEvent);
    on<ChangeSystemButtonColorEvent>(_changeSystemButtonColorEvent);
  }

  FutureOr<void> _changeArabicButtonColorEvent(
      ChangeArabicButtonColorEvent event, Emitter<LanguageSettingsState> emit) {
    Gradient arabicButtonColorLight = blueButtonGradient; //
    Gradient englishButtonColorLight = naveyButtonGradient;
    Gradient systemButtonColorLight = naveyButtonGradient;
    Gradient arabicButtonColorDark = orangeButtonGradient; //
    Gradient englishButtonColorDark = darkOrangeButtonGradient;
    Gradient systemButtonColorDark = darkOrangeButtonGradient;

    emit(state.copyWith(
      arabicButtonColorLight: arabicButtonColorLight, //
      englishButtonColorLight: englishButtonColorLight,
      systemButtonColorLight: systemButtonColorLight,
      arabicButtonColorDark: arabicButtonColorDark, //
      englishButtonColorDark: englishButtonColorDark,
      systemButtonColorDark: systemButtonColorDark,
    ));
  }

  FutureOr<void> _changeEnglishButtonColorEvent(
      ChangeEnglishButtonColorEvent event,
      Emitter<LanguageSettingsState> emit) {
    Gradient arabicButtonColorLight = naveyButtonGradient;
    Gradient englishButtonColorLight = blueButtonGradient; //
    Gradient systemButtonColorLight = naveyButtonGradient;
    Gradient arabicButtonColorDark = darkOrangeButtonGradient;
    Gradient englishButtonColorDark = orangeButtonGradient; //
    Gradient systemButtonColorDark = darkOrangeButtonGradient;

    emit(state.copyWith(
      arabicButtonColorLight: arabicButtonColorLight,
      englishButtonColorLight: englishButtonColorLight, //
      systemButtonColorLight: systemButtonColorLight,
      arabicButtonColorDark: arabicButtonColorDark,
      englishButtonColorDark: englishButtonColorDark, //
      systemButtonColorDark: systemButtonColorDark,
    ));
  }

  FutureOr<void> _changeSystemButtonColorEvent(
      ChangeSystemButtonColorEvent event, Emitter<LanguageSettingsState> emit) {
    Gradient arabicButtonColorLight = naveyButtonGradient;
    Gradient englishButtonColorLight = naveyButtonGradient;
    Gradient systemButtonColorLight = blueButtonGradient; //
    Gradient arabicButtonColorDark = darkOrangeButtonGradient;
    Gradient englishButtonColorDark = darkOrangeButtonGradient;
    Gradient systemButtonColorDark = orangeButtonGradient; //

    emit(state.copyWith(
      arabicButtonColorLight: arabicButtonColorLight,
      englishButtonColorLight: englishButtonColorLight,
      systemButtonColorLight: systemButtonColorLight, //
      arabicButtonColorDark: arabicButtonColorDark,
      englishButtonColorDark: englishButtonColorDark,
      systemButtonColorDark: systemButtonColorDark, //
    ));
  }
}
