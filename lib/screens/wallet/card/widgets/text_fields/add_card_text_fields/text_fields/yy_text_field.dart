import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class YYTextField extends StatelessWidget {
  const YYTextField({super.key});
  static final TextEditingController yyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
        label: AppLocalizations.of(context)!.expiryYearYY,
        labelFontSize: 11,
        hintText: 'yy',
        icon: Icons.date_range_outlined,
        textInputAction: TextInputAction.next,
        controller: yyController,
        keyboardType: TextInputType.number,
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (value) {
          final cardBloc = BlocProvider.of<CardBloc>(context);
          cardBloc.add(ChangeYYEvent(yy: yyController.text));
        },
        maxLength: 2,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.sorryPleaseEnterAYear;
          }
          final bool numberValid = RegExp('^[0-9]{2}\$').hasMatch(value.trim());

          if (numberValid == true) {
            if (int.parse(value) > 23 && int.parse(value) < 50) {
              return null;
            } else {
              return AppLocalizations.of(context)!.notValidYear;
            }
          }

          return AppLocalizations.of(context)!.notValidYear;
        });
  }
}
