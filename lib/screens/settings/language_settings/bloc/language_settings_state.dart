part of 'language_settings_bloc.dart';

class LanguageSettingsState extends Equatable {
  const LanguageSettingsState({
    this.arabicButtonColorLight = naveyButtonGradient,
    this.englishButtonColorLight = naveyButtonGradient,
    this.systemButtonColorLight = naveyButtonGradient,
    this.arabicButtonColorDark = darkOrangeButtonGradient,
    this.englishButtonColorDark = darkOrangeButtonGradient,
    this.systemButtonColorDark = darkOrangeButtonGradient,
  });

  final Gradient arabicButtonColorLight;
  final Gradient englishButtonColorLight;
  final Gradient systemButtonColorLight;
  final Gradient arabicButtonColorDark;
  final Gradient englishButtonColorDark;
  final Gradient systemButtonColorDark;

  @override
  List<Object> get props => [
        arabicButtonColorLight,
        englishButtonColorLight,
        systemButtonColorLight,
        arabicButtonColorDark,
        englishButtonColorDark,
        systemButtonColorDark
      ];

  LanguageSettingsState copyWith({
    required Gradient arabicButtonColorLight,
    required Gradient englishButtonColorLight,
    required Gradient systemButtonColorLight,
    required Gradient arabicButtonColorDark,
    required Gradient englishButtonColorDark,
    required Gradient systemButtonColorDark,
  }) {
    return LanguageSettingsState(
      arabicButtonColorLight: arabicButtonColorLight,
      englishButtonColorLight: englishButtonColorLight,
      systemButtonColorLight: systemButtonColorLight,
      arabicButtonColorDark: arabicButtonColorDark,
      englishButtonColorDark: englishButtonColorDark,
      systemButtonColorDark: systemButtonColorDark,
    );
  }
}
