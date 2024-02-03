import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class AppBarStyle extends StatelessWidget {
  const AppBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: themeState.thememode == ThemeMode.light
                    ? const Alignment(0, -0.1)
                    : Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              themeState.thememode == ThemeMode.light
                  ? appBarLightGray
                  : ourDarkThemeBackgroundNavey.withOpacity(0.9),
              themeState.thememode == ThemeMode.light
                  ? ourWhite.withOpacity(0)
                  : ourDarkThemeBackgroundNavey.withOpacity(0)
            ])),
      );
    });
  }
}
