import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoButtonForSending extends StatelessWidget {
  const NoButtonForSending({
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
          fixedSize:  Size(MediaQuery.of(context).size.height * 0.0140845, MediaQuery.of(context).size.height * 0.041079),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.no,
        style:  TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.0211267,
          fontWeight: FontWeight.w500,
          color: ourWhite,
        ),
      ),
    );
  }
}
