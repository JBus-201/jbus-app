import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/localization/bloc/localization_bloc.dart';
import 'package:jbus_app/screens/settings/language_settings/bloc/language_settings_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnglishButton extends StatelessWidget {
  const EnglishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSettingsBloc, LanguageSettingsState>(
      builder: (context, state) {
        return RectangularElevatedButton(
          text: AppLocalizations.of(context)!.english,
          fontWeight: FontWeight.w600,
            height: 60,
            fontSize: 24,
          gradient: state.englishButtonColorLight,
          gradientForDark: state.englishButtonColorDark,
          onPressed: () {
            final languageBloc = BlocProvider.of<LocalizationBloc>(context);
            languageBloc.add(SwitchToEnglishLanguageEvent());

            final languageSettingsBloc =
                BlocProvider.of<LanguageSettingsBloc>(context);
            languageSettingsBloc.add(ChangeEnglishButtonColorEvent());
          },
        );
      },
    );
  }
}
