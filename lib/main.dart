import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/general_blocs/email_bloc/bloc/email_bloc.dart';
import 'package:jbus_app/general_blocs/mobile_number_bloc/bloc/mobile_number_bloc.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/general_blocs/password_bloc/bloc/password_bloc.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/screens/settings/language_settings/bloc/language_settings_bloc.dart';
import 'package:jbus_app/screens/settings/theme_settings/bloc/theme_settings_bloc.dart';
import 'package:jbus_app/screens/trip/bloc/pickup_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
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
  final firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${json.decode(message.data['value'])['Body']}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.body}');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    print('Message data: ${json.decode(message.data['value'])['Body']}');
  });

  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    print('Got a message whilst in the background!');
    print('Message data: ${json.decode(message.data['value'])['Body']}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.body}');
    }
  });

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
        BlocProvider<PickupBloc>(
          create: (BuildContext context) => PickupBloc(),
        ),
        BlocProvider<WalletBloc>(
          create: (BuildContext context) => WalletBloc(),
        ),
        BlocProvider<LanguageSettingsBloc>(
          create: (BuildContext context) => LanguageSettingsBloc(),
        ),
        BlocProvider<ThemeSettingsBloc>(
          create: (BuildContext context) => ThemeSettingsBloc(),
        ),
        BlocProvider<EmailBloc>(
          create: (BuildContext context) => EmailBloc(),
        ),
        BlocProvider<MobileNumberBloc>(
          create: (BuildContext context) => MobileNumberBloc(),
        ),
        BlocProvider<NameBloc>(
          create: (BuildContext context) => NameBloc(),
        ),
        BlocProvider<PasswordBloc>(
          create: (BuildContext context) => PasswordBloc(),
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
      return const HomeScreen();
    case UserStatus.inTrip:
      return const Dashboard();
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
