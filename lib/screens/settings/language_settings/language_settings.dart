import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/services/service_locator.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();
    //ThemeBloc themeBloc = ThemeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.language),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                locale.arabic,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<LocalizationBloc>(context);
                themeBloc.add(SwitchToArabicLanguageEvent());
              },
            ),
            ElevatedButton(
              child: Text(
                locale.english,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<LocalizationBloc>(context);
                themeBloc.add(SwitchToEnglishLanguageEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
