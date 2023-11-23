import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  ThemeSwitcherBloc() : super(ThemeSwitcherInitial()) {
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeSwitcherState> emit) {
    ThemeMode currentThemeMode = state is ThemeSwitched
        ? (state as ThemeSwitched).themeMode
        : ThemeMode.system;

    ThemeMode newThemeMode;

    switch (currentThemeMode) {
      case ThemeMode.system:
        newThemeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        newThemeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        newThemeMode = ThemeMode.system;
        break;
    }

    emit(ThemeSwitched(newThemeMode));
  }
}
