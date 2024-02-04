part of 'theme_settings_bloc.dart';

class ThemeSettingsState extends Equatable {
  const ThemeSettingsState({
    this.lightButtonColorLight = naveyButtonGradient,
    this.darkButtonColorLight = naveyButtonGradient,
    this.systemButtonColorLight = blueButtonGradient,
    this.lightButtonColorDark = darkOrangeButtonGradient,
    this.darkButtonColorDark = darkOrangeButtonGradient,
    this.systemButtonColorDark = orangeButtonGradient,
  });

  final Gradient lightButtonColorLight;
  final Gradient darkButtonColorLight;
  final Gradient systemButtonColorLight;
  final Gradient lightButtonColorDark;
  final Gradient darkButtonColorDark;
  final Gradient systemButtonColorDark;

  @override
  List<Object> get props => [
        lightButtonColorLight,
        darkButtonColorLight,
        systemButtonColorLight,
        lightButtonColorDark,
        darkButtonColorDark,
        systemButtonColorDark
      ];

  ThemeSettingsState copyWith({
    required Gradient lightButtonColorLight,
    required Gradient darkButtonColorLight,
    required Gradient systemButtonColorLight,
    required Gradient lightButtonColorDark,
    required Gradient darkButtonColorDark,
    required Gradient systemButtonColorDark,
  }) {
    return ThemeSettingsState(
      lightButtonColorLight: lightButtonColorLight,
      darkButtonColorLight: darkButtonColorLight,
      systemButtonColorLight: systemButtonColorLight,
      lightButtonColorDark: lightButtonColorDark,
      darkButtonColorDark: darkButtonColorDark,
      systemButtonColorDark: systemButtonColorDark,
    );
  }
}
