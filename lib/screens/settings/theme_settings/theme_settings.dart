import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/settings/theme_settings/widgets/dark_theme_button.dart';
import 'package:jbus_app/screens/settings/theme_settings/widgets/light_theme_button.dart';
import 'package:jbus_app/screens/settings/theme_settings/widgets/system_theme_button.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.theme),
      ),
      body: Padding(
        padding:
            EdgeInsets.all(MediaQuery.of(context).size.height * 0.01877934),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05399061,
              ),
              const LightThemeButton(),
              const DarkThemeButton(),
              const SystemThemeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
