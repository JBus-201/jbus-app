import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/themes/theme_controller.dart';

class AppLightTheme extends AppTheme {
  @override
  Color getMainBlue() => ourBlue;

  @override
  Color getMainOrange() => ourOrange;

  @override
  Color getThirdColor() => const Color.fromARGB(255, 246, 246, 246);

  @override
  Color getPointFColor() => const Color.fromARGB(255, 225, 209, 159);

  @override
  Color getPointSColor() => const Color.fromARGB(255, 176, 155, 57);

  @override
  Color getWhiteColor() => ourWhite;

  @override
  Color getDarkGrayColor() => ourDarkGray;

    @override
  LinearGradient getGoldGradient() => goldButtonGradient;
  
  @override
  LinearGradient getBlueButtonGradient() => blueButtonGradient;
  
  @override
  LinearGradient getOrangeButtonGradient() => orangeButtonGradient;

  @override
  ThemeData createTheme() {
    return ThemeData(
        useMaterial3: true,

        //AppBar theme
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0),
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: getMainBlue())),

        // Scaffold        
        scaffoldBackgroundColor: getWhiteColor(),

        // Colors
        primaryColor: getMainBlue(),

        // Fonts
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

        // ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                foregroundColor:getWhiteColor(),
                backgroundColor: getMainBlue(),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), 
                ))),

        /// TextButtons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      color: getMainBlue(),
                      decoration: TextDecoration.underline)),
        ),

        //TabBarTheme
        tabBarTheme: TabBarTheme(
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            labelColor: getMainOrange(),
            indicatorColor: getMainOrange(),
            dividerColor: getMainOrange()),
        
        // FloatingActionButton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: getMainOrange(), foregroundColor: getWhiteColor())
        );
  }
}

//AppBarStyle for Gradient color

class AppBarStyle extends StatelessWidget {
  const AppBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            themeState.thememode == ThemeMode.light ? ourWhite : ourDarkThemeBackgroundNavey,
            themeState.thememode == ThemeMode.light ? ourWhite.withOpacity(0) : ourDarkThemeBackgroundNavey.withOpacity(0)
          ])),
    );});
  }
}
