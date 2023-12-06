import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return currentTheme == ThemeMode.light
        ? _lightTheme.getMainColor()
        : _darkTheme.getMainColor();
  }

  Color getSecondaryColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getSecondaryColor()
        : _darkTheme.getSecondaryColor();
  }

  Color getThirdColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getThirdColor()
        : _darkTheme.getThirdColor();
  }

  Color getPointFColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getPointFColor()
        : _darkTheme.getPointFColor();
  }

  Color getPointSColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getPointSColor()
        : _darkTheme.getPointSColor();
  }

  Color getWhiteColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getWhiteColor()
        : _darkTheme.getWhiteColor();
  }

  Color getDarkGrayColor() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getDarkGrayColor()
        : _darkTheme.getDarkGrayColor();
  }

  LinearGradient getGradient() {
    return currentTheme == ThemeMode.light
        ? _lightTheme.getGoldGradient()
        : _darkTheme.getGoldGradient();
  }
}
