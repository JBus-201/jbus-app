part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

final class ThemeInitial extends ThemeState {}

class ChangeThemeModeState extends ThemeState {
  final ThemeMode currentTheme;
  ChangeThemeModeState({
    required this.currentTheme
    });
}
