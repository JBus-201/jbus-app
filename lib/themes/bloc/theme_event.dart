part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class LightThemeModeEvent extends ThemeEvent {}
class DarkThemeModeEvent extends ThemeEvent {}

