part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class SwitchToLightThemeEvent extends ThemeEvent {}
class SwitchToDarkThemeEvent extends ThemeEvent {}
class SwitchToSystemThemeEvent extends ThemeEvent {}

