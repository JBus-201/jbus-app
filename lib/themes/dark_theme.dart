import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
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
      cardTheme: const CardTheme(
        color: ourDarkGray,
        elevation: 0.5,
        shadowColor: ourGray,
        surfaceTintColor: ourBlack,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ourDarkThemeBackgroundNavey,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(ourWhite))),
      //AppBar theme
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: ourWhite),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: getMainOrange())),
      scaffoldBackgroundColor: ourDarkThemeBackgroundNavey,
      listTileTheme: const ListTileThemeData(
          iconColor: ourWhite, selectedColor: ourWhite, textColor: ourWhite),
      dividerColor: ourBlack.withOpacity(0),
      // Colors
      primaryColor: getMainBlue(),

      // Fonts
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: ourWhite)),

      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 2,
              foregroundColor: ourDarkThemeBackgroundNavey,
              backgroundColor: getMainOrange(),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))),

      /// TextButtons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: ourWhite,
            textStyle: const TextStyle(
                color: ourWhite, decoration: TextDecoration.underline)),
      ),
      focusColor: ourOrange,
      //TabBarTheme
      tabBarTheme: TabBarTheme(
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ourOrange),
        labelColor: ourOrange,
        indicatorColor: ourOrange,
        dividerColor: ourOrange,
        unselectedLabelColor: ourOrange50,
      ),

      //bottomNavigationTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ourDarkThemeBackgroundNavey,
        elevation: 0,
        unselectedIconTheme: IconThemeData(color: ourGray50),
        unselectedLabelStyle: TextStyle(color: ourGray50),
        unselectedItemColor: ourGray50,
        selectedIconTheme: const IconThemeData(color: ourOrange),
        selectedLabelStyle: const TextStyle(color: ourOrange),
        selectedItemColor: ourOrange,
      ),

      // FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: getMainOrange(), foregroundColor: ourWhite),
    );
  }
}
