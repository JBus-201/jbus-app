import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signIn),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text(
              AppLocalizations.of(context)!.signIn,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmailVerificationScreen()),
              );
            }),
      ),
    );
  }
}
