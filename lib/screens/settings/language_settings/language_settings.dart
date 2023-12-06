import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //ThemeBloc themeBloc = ThemeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                S.of(context).arabic,
              ),
              onPressed: () {
                final themeBloc = BlocProvider.of<LocalizationBloc>(context);
                themeBloc.add(SwitchToArabicLanguageEvent());
              },
            ),
            ElevatedButton(
              child: Text(
                S.of(context).english,
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
