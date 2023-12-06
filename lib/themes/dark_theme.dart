import 'package:flutter/material.dart';
import 'package:jbus_app/themes/theme_controller.dart';

class AppDarkTheme extends AppTheme {
  /// Geters
  @override
  Color getMainColor() => const Color.fromARGB(255, 36, 51, 67);

  @override
  Color getSecondaryColor() => const Color.fromARGB(255, 242, 176, 62);

  @override
  Color getThirdColor() => const Color.fromARGB(255, 246, 246, 246);

  @override
  Color getPointFColor() => const Color.fromARGB(255, 225, 209, 159);

  @override
  Color getPointSColor() => const Color.fromARGB(255, 176, 155, 57);

  @override
  Color getWhiteColor() => Colors.white;

  @override
  Color getDarkGrayColor() => const Color.fromARGB(255, 65, 65, 65);

  /// Gradiant Colors
  @override
  LinearGradient getGoldGradient() => const LinearGradient(
        colors: [
          Color.fromARGB(255, 225, 209, 159),
          Color.fromARGB(255, 176, 155, 57)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  /// Theme Data
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
                color: getMainColor())),
        scaffoldBackgroundColor: getDarkGrayColor(),

        // Colors
        primaryColor: getMainColor(),

        // Fonts
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

        // ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                foregroundColor:const Color.fromARGB(255, 181, 158, 99),
                backgroundColor: getMainColor(),
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
          style: //ButtonStyle(textStyle: TextStyle(color: ourMainColor))
              TextButton.styleFrom(
                  textStyle: TextStyle(
                      color: getMainColor(),
                      decoration: TextDecoration.underline)),
        ),

        //TabBarTheme
        tabBarTheme: TabBarTheme(
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            labelColor: getSecondaryColor(),
            indicatorColor: getSecondaryColor(),
            dividerColor: getSecondaryColor()),
        
        // FloatingActionButton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: getSecondaryColor(), foregroundColor: getWhiteColor())
        );
  }
}

