import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RectangularElevatedButton(
              text: '',
              //locale.language,
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
              //locale.language,
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
              //locale.language,
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
              //locale.language,
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
              //locale.language,
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
              //locale.language,
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
            //       locale.settings,
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
