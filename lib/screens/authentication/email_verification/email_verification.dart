import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final AppLocalizations locale = localeInstance();
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.email),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text(
              locale.signUp,
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
