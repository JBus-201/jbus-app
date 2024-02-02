import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoButtonForUpdating extends StatelessWidget {
  const NoButtonForUpdating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: OutlinedButton.styleFrom(
          fixedSize: const Size(111, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.no,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: ourNavey,
        ),
      ),
    );
  }
}
