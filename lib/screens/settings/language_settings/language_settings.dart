import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/settings/language_settings/widgets/arabic_button.dart';
import 'package:jbus_app/screens/settings/language_settings/widgets/english_button.dart';
import 'package:jbus_app/screens/settings/language_settings/widgets/system_button.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.all(MediaQuery.of(context).size.height * 0.01877934),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05399061,
              ),
              const ArabicButton(),
              const EnglishButton(),
              const SystemButton(),
            ],
          ),
        ),
      ),
    );
  }
}
