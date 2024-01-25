part of 'language_settings_bloc.dart';

@immutable
sealed class LanguageSettingsEvent {}

class ChangeArabicButtonColorEvent extends LanguageSettingsEvent {}
class ChangeEnglishButtonColorEvent extends LanguageSettingsEvent {}
class ChangeSystemButtonColorEvent extends LanguageSettingsEvent {}