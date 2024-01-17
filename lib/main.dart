import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/screens/others/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:jbus_app/services/navigation_service.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/dark_theme.dart';
import 'package:jbus_app/themes/light_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:jbus_app/constants/firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'services/service_locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 4));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  final status = await sl<AuthService>().getApiStatus();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<LocalizationBloc>(
          create: (BuildContext context) => LocalizationBloc(),
        ),
        BlocProvider<WalletBloc>(
          create: (BuildContext context) => WalletBloc(),
        ),
      ],
      child: MyApp(homeScreen: _getHomeScreen(status)),
    ),
  );
}

Widget _getHomeScreen(UserStatus status) {
  switch (status) {
    case UserStatus.notLoggedIn:
      return const SignupScreen();
    case UserStatus.loggedIn:
      return const Dashbourd();
    case UserStatus.inTrip:
      return const Dashbourd();
    default:
      return const SignupScreen();
  }
}

class MyApp extends StatelessWidget {
  final Widget homeScreen;

  const MyApp({super.key, required this.homeScreen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, localizationState) {
            GoogleMapsApi.askForLocationPermission();
            return MaterialApp(
              navigatorKey: sl<NavigationService>().navigatorKey,
              home: homeScreen,
              locale: Locale(localizationState.languageCode),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppLightTheme().createTheme(),
              darkTheme: AppDarkTheme().createTheme(),
              themeMode: themeState.thememode,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
