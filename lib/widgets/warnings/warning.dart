import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Warning extends StatelessWidget {
  final String title;
  final String description;
  final bool isWarning;
  const Warning(
      {super.key,
      required this.title,
      required this.description,
      this.isWarning = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        backgroundColor:
            themeState.thememode == ThemeMode.light ? ourWhite : ourDarkGray,
        child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347418),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                isWarning ? Icons.warning : Icons.task_alt_rounded,
                size: MediaQuery.of(context).size.height * 0.05633803,
                color: isWarning ? ourRed : ourGreen,
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.018779),
              Text(
                title,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0211267,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.00938967),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.018779),
              RectangularElevatedButton(
                width: MediaQuery.of(context).size.height * 0.17605634,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: AppLocalizations.of(context)!.ok,
              ),
            ],
          ),
        ),
      );
    });
  }
}
