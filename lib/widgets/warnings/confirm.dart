import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final dynamic Function()? onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
  });

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
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.023474),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Icon(
                Icons.question_mark_rounded,
                size: MediaQuery.of(context).size.height * 0.056338,
                color: ourOrange,
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.0187793),
              Text(
                title,
                style:  TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02112676,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.009389),
              Text(
                description,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018779,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.018779),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RectangularElevatedButton(
                    width: MediaQuery.of(context).size.height * 0.12910798,
                    onPressed: onConfirm,
                    text: AppLocalizations.of(context)!.yes,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
