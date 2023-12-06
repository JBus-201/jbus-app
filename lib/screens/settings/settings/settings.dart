import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RectangularElevatedButton(
              text: '',
              //S.of(context).language,
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
              //S.of(context).language,
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
              //S.of(context).language,
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
              //S.of(context).language,
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
              //S.of(context).language,
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
              //S.of(context).language,
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
            //       S.of(context).settings,
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
