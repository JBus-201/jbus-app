part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  const LocalizationState({required this.languageCode});
  final String languageCode;

  @override
  List<Object> get props => [languageCode];

  LocalizationState copyWith(String languageCode) {
    return LocalizationState(languageCode: languageCode);
  }
}
