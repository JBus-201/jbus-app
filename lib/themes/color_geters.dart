import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/dark_theme.dart';
import 'package:jbus_app/themes/light_theme.dart';

class GetThemeColors {
  Color getMainColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().ourMainColor
        : AppDarkTheme().ourMainColor;
  }

  Color getSecondaryColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().ourSecondaryColor
        : AppDarkTheme().ourSecondaryColor;
  }

  Color getThirdColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().ourThirdColor
        : AppDarkTheme().ourThirdColor;
  }

  Color getPointFColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().pointsFColor
        : AppDarkTheme().pointsFColor;
  }

  Color getpointSColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().pointsSColor
        : AppDarkTheme().pointsSColor;
  }

  Color getWhiteColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().ourWhite
        : AppDarkTheme().ourWhite;
  }

  Color getDarkGrayColor(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().ourdarkGray
        : AppDarkTheme().ourdarkGray;
  }

  LinearGradient getGradient(context) {
    ThemeMode currentTheme = BlocProvider.of<ThemeBloc>(context).currentTheme;
    return currentTheme == ThemeMode.light
        ? AppLightTheme().gradient
        : AppDarkTheme().gradient;
  }
}
