import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(languageCode: 'en')) {
    on<LocalizationEvent>((event, emit) {});

    on<SwitchToArabicLanguageEvent>(_switchToArabicLanguageEvent);
    on<SwitchToEnglishLanguageEvent>(_switchToEnglishLanguageEvent);
    on<SwitchToSystemLanguageEvent>(_switchToSystemLanguageEvent);

    String? local = sl<SharedPreferences>().getString('local');
    if (local != null) {
      if (local == 'en') {
        add(SwitchToEnglishLanguageEvent());
      } else {
        add(SwitchToArabicLanguageEvent());
      }
    } else {
      add(SwitchToEnglishLanguageEvent());
    }
  }

  FutureOr<void> _switchToArabicLanguageEvent(
      SwitchToArabicLanguageEvent event, Emitter<LocalizationState> emit) {
    String languageCode = state.languageCode;
    languageCode = 'ar';
    sl<SharedPreferences>().setString('local', 'ar');

    emit(state.copyWith(languageCode));
  }

  FutureOr<void> _switchToEnglishLanguageEvent(
      SwitchToEnglishLanguageEvent event, Emitter<LocalizationState> emit) {
    String languageCode = state.languageCode;
    languageCode = 'en';
    sl<SharedPreferences>().setString('local', 'en');

    emit(state.copyWith(languageCode));
  }

  FutureOr<void> _switchToSystemLanguageEvent(SwitchToSystemLanguageEvent event, Emitter<LocalizationState> emit) {
  String languageCode = state.languageCode;
    languageCode = 'en';
    sl<SharedPreferences>().setString('local', 'en');

    emit(state.copyWith(languageCode));
  }
}
