import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RectangularElevatedButton(
              text: '',
              //AppLocalizations.of(context)!.language,
              width: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
            RectangularElevatedButton(
              text: '',
              //AppLocalizations.of(context)!.language,
              width: 100,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),

            CircularElevatedButton(
              icon: Icons.apple,
              //AppLocalizations.of(context)!.language,
              //width: 150,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
            RectangularElevatedButton(
              text: '',
              //AppLocalizations.of(context)!.language,
              width: 200,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
            RectangularElevatedButton(
              text: '',
              //AppLocalizations.of(context)!.language,
              width: 250,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
            RectangularElevatedButton(
              text: '',
              //AppLocalizations.of(context)!.language,
              width: 300,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
            // ElevatedButton(
            //     child: Text(
            //       AppLocalizations.of(context)!.settings,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ThemeSettingsScreen()),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
