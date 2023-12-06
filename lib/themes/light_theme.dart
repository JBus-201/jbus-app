import 'package:flutter/material.dart';

class AppLightTheme {
  
  // make them static, or use singletone...
  Color ourMainColor = const Color.fromARGB(255, 68, 142, 226);
  Color ourSecondaryColor = const Color.fromARGB(255, 242, 176, 62);
  Color ourThirdColor = const Color.fromARGB(255, 246, 246, 246);
  Color pointsFColor = const Color.fromARGB(255, 225, 209, 159);
  Color pointsSColor = const Color.fromARGB(255, 176, 155, 57);
  Color ourWhite = Colors.white;
  Color ourdarkGray = const Color.fromARGB(255, 65, 65, 65);
  LinearGradient gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 225, 209, 159),
      Color.fromARGB(255, 176, 155, 57)
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

  ThemeData lightTheme() {
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
            backgroundColor:
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
            //centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: ourMainColor)),
        scaffoldBackgroundColor: Colors.white,
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
                foregroundColor: Colors.white,
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

//AppBarStyle for Gradient color

class AppBarStyle extends StatelessWidget {
  const AppBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            AppLightTheme().ourWhite,
            AppLightTheme().ourWhite.withOpacity(0.9),
            AppLightTheme().ourWhite.withOpacity(0.8),
            AppLightTheme().ourWhite.withOpacity(0.8),
            AppLightTheme().ourWhite.withOpacity(0.6),
            AppLightTheme().ourWhite.withOpacity(0.3),
            AppLightTheme().ourWhite.withOpacity(0)
          ])),
    );
  }
}
