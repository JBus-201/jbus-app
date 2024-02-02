import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signin/signin.dart';
import 'package:jbus_app/widgets/buttons/text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignInButtonSUS extends StatelessWidget {
  const SignInButtonSUS({super.key});
  @override
  Widget build(BuildContext context) {
    return OurTextButton(
      text:AppLocalizations.of(context)!.alreadyHaveAnAccount ,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      },
    );
  }
}
