part of 'theme_switcher_bloc.dart';

@immutable
sealed class ThemeSwitcherState {}

class ThemeSwitcherInitial extends ThemeSwitcherState {}

class ThemeSwitched extends ThemeSwitcherState {
  final ThemeMode themeMode;

  ThemeSwitched(this.themeMode);
}
