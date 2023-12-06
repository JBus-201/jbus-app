import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/services/service_locator.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.signIn),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text(
              locale.signIn,
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
