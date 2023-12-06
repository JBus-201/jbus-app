import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).theme),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                S.of(context).darkTheme,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<ThemeBloc>(context);
                themeBloc.add(SwitchToDarkThemeEvent());
              },
            ),
            ElevatedButton(
              child: Text(
                S.of(context).lightTheme,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<ThemeBloc>(context);
                themeBloc.add(SwitchToLightThemeEvent());
              },
            ),
            ElevatedButton(
              child: Text(
                S.of(context).systemTheme,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<ThemeBloc>(context);
                themeBloc.add(SwitchToSystemThemeEvent());
              },
            ),
            const SizedBox(
              height: 50,
            ),
            RectangularElevatedButton(
              text: S.of(context).language,
              width: 250,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
