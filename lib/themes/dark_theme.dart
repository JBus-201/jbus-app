import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/theme_controller.dart';

class AppDarkTheme extends AppTheme {
  /// Geters
  @override
  Color getMainBlue() => const Color.fromARGB(255, 36, 51, 67);

  @override
  Color getMainOrange() => const Color.fromARGB(255, 242, 176, 62);

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
                color: getMainBlue())),
        scaffoldBackgroundColor: ourDarkThemeBackgroundNavey,

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
                foregroundColor:ourWhite,
                backgroundColor: getMainOrange(),
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
            backgroundColor: getMainOrange(), foregroundColor: ourWhite)
        );
  }
  
}

