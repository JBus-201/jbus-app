import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signUp),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final themeBloc = BlocProvider.of<ThemeBloc>(context);
          if (themeBloc.currentTheme == ThemeMode.light) {
            themeBloc.add(DarkThemeModeEvent());
          } else {
            themeBloc.add(LightThemeModeEvent());
          }
        },
        child: Text(S.of(context).darkTheme),
      )),
    );
  }
}
