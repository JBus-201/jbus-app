import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:jbus_app/widgets/buttons/text_button.dart';

class SignUpButtonSIS extends StatelessWidget {
  const SignUpButtonSIS({super.key});
  @override
  Widget build(BuildContext context) {
    return OurTextButton(
      text: AppLocalizations.of(context)!.createAccount,
      onPressed: () {
        Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupScreen(),
          ),
        );
      },
    );
  }
}
