import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/theme_controller.dart';

class AppLightTheme extends AppTheme {
  @override
  Color getMainBlue() => ourBlue;

  @override
  Color getMainOrange() => ourOrange;

  @override
  @override
  ThemeData createTheme() {
    return ThemeData(
        useMaterial3: true,
        //AppBar theme
        cardTheme: const CardTheme(
          color: ourWhite,
          elevation: 0.5,
          shadowColor: ourVeryLightGray,
          surfaceTintColor: ourBlack,
        ),
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
        scaffoldBackgroundColor: ourWhite,

        // Colors
        primaryColor: getMainBlue(),

        // Fonts
        fontFamily: 'Roboto',
        //fontFamily: 'PTSerif',
        //fontFamily: '.SF UI Display',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        focusColor: ourBlue,
        // ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                foregroundColor: ourWhite,
                backgroundColor: getMainBlue(),
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
              foregroundColor: ourNavey,
              textStyle: TextStyle(
                  color: getMainBlue(), decoration: TextDecoration.underline)),
        ),

        //TabBarTheme
        tabBarTheme: TabBarTheme(
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            labelColor: getMainBlue(),
            indicatorColor: getMainBlue(),
            dividerColor: getMainBlue()),

        //bottomNavigationTheme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ourWhite,
          elevation: 0,
          unselectedIconTheme: IconThemeData(color: ourBlue50),
          unselectedLabelStyle: TextStyle(color: ourBlue50),
          unselectedItemColor: ourBlue50,
          selectedIconTheme: const IconThemeData(color: ourBlue),
          selectedLabelStyle: const TextStyle(color: ourBlue),
          selectedItemColor: ourBlue,
        ),
        // FloatingActionButton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: getMainBlue(), foregroundColor: ourWhite));
  }
}

//AppBarStyle for Gradient color
