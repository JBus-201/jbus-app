part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({this.thememode = ThemeMode.light});
  final ThemeMode thememode;

  @override
  List<Object> get props => [thememode];

  ThemeState copyWith(ThemeMode thememode) {
    return ThemeState(thememode: thememode);
  }
}
