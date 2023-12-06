import 'package:flutter/material.dart';
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
        child: Text(locale.signIn),
      ),
    );
  }
}
