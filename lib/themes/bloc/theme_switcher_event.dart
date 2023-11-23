part of 'theme_switcher_bloc.dart';

@immutable
sealed class ThemeSwitcherEvent {}

class ToggleThemeEvent extends ThemeSwitcherEvent {}
