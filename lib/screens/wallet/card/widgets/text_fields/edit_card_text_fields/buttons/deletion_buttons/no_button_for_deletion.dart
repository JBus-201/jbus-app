import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoButtonForDeletion extends StatelessWidget {
  const NoButtonForDeletion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourNavey,
          fixedSize: const Size(120, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.no,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ourWhite,
        ),
      ),
    );
  }
}
