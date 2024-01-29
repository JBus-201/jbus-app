
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/home/widgets/profile_container.dart';
import 'package:jbus_app/screens/home/widgets/rows/money_row.dart';
import 'package:jbus_app/screens/home/widgets/rows/others_row.dart';
import 'package:jbus_app/screens/home/widgets/rows/start_your_trip_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double walletBalance = 24.6;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ourWhite,
              //ourLightGray,
              ourWhite
            ], // Adjust the colors as needed
          ),
        ),
        child: Center(
          child: Column(
            children: [
              ProfileContainer(walletBalance: walletBalance),
              const SizedBox(
                height: 20,
              ),
              const StartYourTripRow(),
              const MoneyRow(),
              const OthersRow(),
            ],
          ),
        ),
      ),
    );
  }
}
