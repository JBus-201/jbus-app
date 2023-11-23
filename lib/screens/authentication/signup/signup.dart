import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/color_geters.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 2,
            foregroundColor: Colors.yellow,
            // const Color.fromARGB(255, 181, 158, 99),
            backgroundColor: GetThemeColors().getMainColor(context)),
        onPressed: () {
          final themeBloc = BlocProvider.of<ThemeBloc>(context);
          if (themeBloc.currentTheme == ThemeMode.light) {
            themeBloc.add(DarkThemeModeEvent());
          } else {
            themeBloc.add(LightThemeModeEvent());
          }
          // BlocProvider.of<ThemeBloc>(context).add(LightThemeModeEvent());
          // Provider.of<ThemeModel>(context, listen: false).toggleThemeMode();
        },
        child: Text(S.of(context).darkTheme),
      )),
    );
  }
}
