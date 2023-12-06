import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({
    Key? key,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
  }) : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).email),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text(
              S.of(context).signUp,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            }),
      ),
    );
  }
}
