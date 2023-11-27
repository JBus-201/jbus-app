import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/dark_theme.dart';
import 'package:jbus_app/themes/light_theme.dart';

import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  await Future.delayed(const Duration(seconds: 4));
  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<LocalizationBloc>(
          create: (BuildContext context) => LocalizationBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, localizationState) {
            return MaterialApp(
              home: const SignupScreen(),
              locale: const Locale('en'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: AppLightTheme().lightTheme(),
              darkTheme: AppDarkTheme().darkTheme(),
              themeMode: themeState.thememode,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
