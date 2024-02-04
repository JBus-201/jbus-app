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
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347418),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Icon(
                Icons.question_mark_rounded,
                size: MediaQuery.of(context).size.height * 0.056338,
                color: ourOrange,
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.018779),
              Text(
                title,
                style:  TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02112676,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.00938967),
              Text(
                description,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.01877934,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FazaRequestBT(totalAmountNeeded: amount, route: route),

                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
