import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/settings/theme_settings/bloc/theme_settings_bloc.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DarkThemeButton extends StatelessWidget {
  const DarkThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: RectangularElevatedButton(
            text: AppLocalizations.of(context)!.darkTheme,
            fontWeight: FontWeight.w600,
            height: 60,
            fontSize: 24,
            gradient: state.darkButtonColorLight,
            gradientForDark: state.darkButtonColorDark,
            onPressed: () {
              final themeBloc = BlocProvider.of<ThemeBloc>(context);
                  themeBloc.add(SwitchToDarkThemeEvent());
          
               final themeSettingsBloc =
                  BlocProvider.of<ThemeSettingsBloc>(context);
              themeSettingsBloc.add(ChangeDarkThemeButtonColorEvent());
            },
          ),
        );
      },
    );
  }
}
