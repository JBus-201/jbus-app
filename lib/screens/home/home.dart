import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/home/widgets/profile_container.dart';
import 'package:jbus_app/screens/home/widgets/rows/money_row.dart';
import 'package:jbus_app/screens/home/widgets/rows/others_row.dart';
import 'package:jbus_app/screens/home/widgets/rows/start_your_trip_row.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                themeState.thememode == ThemeMode.light
                    ? ourWhite
                    : ourDarkGray,
                //ourLightGray,
                themeState.thememode == ThemeMode.light
                    ? ourWhite
                    : ourDarkGray,
              ], // Adjust the colors as needed
            ),
          ),
          child: const Center(
            child: Column(
              children: [
                ProfileContainer(),
                SizedBox(
                  height: 20,
                ),
                StartYourTripRow(),
                MoneyRow(),
                OthersRow(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
