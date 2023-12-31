import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final languageBloc = BlocProvider.of<LocalizationBloc>(context);
    //ThemeBloc themeBloc = ThemeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.arabic,
              ),
              onPressed: () {
                final languageBloc = BlocProvider.of<LocalizationBloc>(context);
                languageBloc.add(SwitchToArabicLanguageEvent());
                //locale = localeInstance();
              },
            ),
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.english,
              ),
              onPressed: () {
                final languageBloc = BlocProvider.of<LocalizationBloc>(context);
                languageBloc.add(SwitchToEnglishLanguageEvent());
                //locale = localeInstance();
              },
            ),
            RectangularElevatedButton(
                text: "change Theme",
                width: 200,
                onPressed: () {
                  final themeBloc = BlocProvider.of<ThemeBloc>(context);
                  final currentTheme =
                      BlocProvider.of<ThemeBloc>(context).state.thememode;
                  currentTheme == ThemeMode.light
                      ? themeBloc.add(SwitchToDarkThemeEvent())
                      : themeBloc.add(SwitchToLightThemeEvent());
                }),
          ],
        ),
      ),
    );
  }
}
