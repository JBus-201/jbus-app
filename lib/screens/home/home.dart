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
                    : ourMainDark,
                //ourLightGray,
                themeState.thememode == ThemeMode.light
                    ? ourWhite
                    : ourMainDark,
              ], // Adjust the colors as needed
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const ProfileContainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0235,
                ),
                const StartYourTripRow(),
                const MoneyRow(),
                const OthersRow(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
