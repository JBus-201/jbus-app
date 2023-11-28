import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jbus_app/constants/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 4));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
