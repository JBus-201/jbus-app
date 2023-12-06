import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/services/service_locator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.signUp),
      ),
      body: Center(
        child: Text(locale.signUp),
      ),
    );
  }
}
