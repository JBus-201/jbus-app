part of 'localization_bloc.dart';

@immutable
sealed class LocalizationEvent {}

class SwitchToArabicLanguageEvent extends LocalizationEvent {}

class SwitchToEnglishLanguageEvent extends LocalizationEvent {}

//class SwitchToSystemLanguageEvent extends LocalizationEvent {}
