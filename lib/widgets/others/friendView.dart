import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendViewDialog extends StatelessWidget {
  final int id;
  final String? name;
  final String? profileImage;
  const FriendViewDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.profileImage});

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 0.5)),
                child: profileImage != null
                    ? Image.asset('$profileImage')
                    : const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              Text(
                '${AppLocalizations.of(context)!.userId}: $id',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                '$name',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              RectangularElevatedButton(
                width: 150,
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
