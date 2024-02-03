import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/faza/buttons/requestforfaza.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class NeedFazaDialog extends StatelessWidget {
  final String title;
  final String description;
  final int amount;
  final BusRoute route;

  const NeedFazaDialog({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        backgroundColor:
            themeState.thememode == ThemeMode.light ? ourWhite : ourDarkGray,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.question_mark_rounded,
                size: 48,
                color: ourOrange,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FazaRequestBT(totalAmountNeeded: amount, route: route),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: const Text("Cancel"),
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
