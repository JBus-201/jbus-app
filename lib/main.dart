import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:jbus_app/themes/dark_theme.dart';
import 'package:jbus_app/themes/light_theme.dart';
import 'package:jbus_app/themes/theme_model.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppLightTheme().lightTheme(),
      darkTheme: AppDarkTheme().darkTheme(),
      themeMode: context.watch<ThemeModel>().currentThemeMode,
      home: SignupScreen(),
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

