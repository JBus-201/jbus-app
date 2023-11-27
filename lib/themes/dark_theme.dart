import 'package:flutter/material.dart';

class AppDarkTheme {
  // make them static, or use singletone...
  Color ourMainColor = const Color.fromARGB(255, 255, 77, 0);
  Color ourSecondaryColor = const Color.fromARGB(255, 255, 255, 255);
  Color ourThirdColor = const Color.fromARGB(255, 78, 46, 46);
  Color pointsFColor = const Color.fromARGB(255, 255, 77, 0);
  Color pointsSColor = const Color.fromARGB(255, 255, 77, 0);
  Color ourWhite = const Color.fromARGB(255, 7, 6, 6);
  Color ourdarkGray = const Color.fromARGB(255, 255, 255, 255);
  LinearGradient gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 77, 0),
      Color.fromARGB(255, 255, 77, 0),
    ], // Replace with your desired colors
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  Color getMainColor() {
    return ourMainColor;
  }

  Color getSecondaryColor() {
    return ourSecondaryColor;
  }

  ThemeData darkTheme() {
    return ThemeData(
        // textButtonTheme: TextButtonThemeData(
        //   style: //ButtonStyle(textStyle: TextStyle(color: ourMainColor))
        //       TextButton.styleFrom(
        //           textStyle: TextStyle(
        //               color: ourMainColor,
        //               decoration: TextDecoration.underline)),
        // ),
        useMaterial3: true,
        //AppBar theme

        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0),
            //centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: ourMainColor)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        //Colors
        primaryColor: ourMainColor,
        //Fonts
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        //ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                foregroundColor: const Color.fromARGB(255, 255, 77, 0),
                // const Color.fromARGB(255, 181, 158, 99),
                backgroundColor: ourMainColor,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius here
                ))),

        //TabBarTheme
        tabBarTheme: TabBarTheme(
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            labelColor: ourSecondaryColor,
            indicatorColor: ourSecondaryColor,
            dividerColor: ourSecondaryColor),
        // textButtonTheme: const TextButtonThemeData(
        //   style: ButtonStyle(),
        // ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ourSecondaryColor, foregroundColor: ourWhite)
        // Add more theme properties as needed
        );
  }
}
