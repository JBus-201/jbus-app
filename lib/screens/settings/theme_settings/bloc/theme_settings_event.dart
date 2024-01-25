part of 'theme_settings_bloc.dart';

@immutable
sealed class ThemeSettingsEvent {}

class ChangeLightThemeButtonColorEvent extends ThemeSettingsEvent {}
class ChangeDarkThemeButtonColorEvent extends ThemeSettingsEvent {}
class ChangeSystemThemeButtonColorEvent extends ThemeSettingsEvent {}
