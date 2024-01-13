import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationSettingsScreen extends StatelessWidget {
  final AppLocalizations locale;

  const NotificationSettingsScreen({super.key, required this.locale});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.notifications),
      ),
    );
  }
}
