import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/dark_theme.dart';
import 'package:jbus_app/themes/light_theme.dart';

class ThemeColors {
  final ThemeMode currentTheme;
  final AppLightTheme _lightTheme;
  final AppDarkTheme _darkTheme;

  ThemeColors(BuildContext context)
      : currentTheme = BlocProvider.of<ThemeBloc>(context).state.thememode,
        _lightTheme = AppLightTheme(),
        _darkTheme = AppDarkTheme();

  Color getMainColor() {
    return currentTheme == ThemeMode.light ? _lightTheme.getMainBlue() : _darkTheme.getMainOrange();
  }

  Color getSecondaryColor() {
    return currentTheme == ThemeMode.light ? _lightTheme.getMainOrange() : _darkTheme.getMainBlue();
  }

  LinearGradient getMainGradient() {
    return currentTheme == ThemeMode.light ? blueButtonGradient : orangeButtonGradient;
  }
}
