import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode currentTheme = ThemeMode.light;

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) {
      if (event is LightThemeModeEvent) {
        _onLightThemeMode(event, emit);
      } else if (event is DarkThemeModeEvent) {
        _onDarkThemeMode(event, emit);
      }
    });
  }

  void _onLightThemeMode(LightThemeModeEvent event, Emitter<ThemeState> emit) {
    currentTheme = ThemeMode.light;
    emit(ChangeThemeModeState(currentTheme: currentTheme));
  }

  void _onDarkThemeMode(DarkThemeModeEvent event, Emitter<ThemeState> emit) {
    currentTheme = ThemeMode.dark;
    emit(ChangeThemeModeState(currentTheme: currentTheme));
  }
}
