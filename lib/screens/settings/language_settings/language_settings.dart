import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSettingsScreen extends StatelessWidget {
  final AppLocalizations locale;

  const LanguageSettingsScreen({Key? key, required this.locale})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.language),
      ),
      body: Center(
        child: Text(locale.language),
      ),
    );
  }
}
