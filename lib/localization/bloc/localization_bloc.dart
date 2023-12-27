import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(languageCode: 'en')) {
    on<LocalizationEvent>((event, emit) {});

    on<SwitchToArabicLanguageEvent>(_switchToArabicLanguageEvent);
    on<SwitchToEnglishLanguageEvent>(_switchToEnglishLanguageEvent);
  }

  FutureOr<void> _switchToArabicLanguageEvent(SwitchToArabicLanguageEvent event, Emitter<LocalizationState> emit) {
    String languageCode = state.languageCode;
    languageCode = 'ar';

    emit(state.copyWith(languageCode));
  }

  FutureOr<void> _switchToEnglishLanguageEvent(SwitchToEnglishLanguageEvent event, Emitter<LocalizationState> emit) {
    String languageCode = state.languageCode;
    languageCode = 'en';

    emit(state.copyWith(languageCode));
  }
}
