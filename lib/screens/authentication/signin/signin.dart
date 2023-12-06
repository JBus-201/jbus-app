import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text(
              S.of(context).signIn,
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
