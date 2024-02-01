import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class CVVTextField extends StatelessWidget {
  const CVVTextField({super.key});
  static final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //int previousTextControllerLength = 0;
    return OurTextFormField(
        label: AppLocalizations.of(context)!.cvv,
        hintText: '###',
        icon: Icons.numbers_rounded,
        textInputAction: TextInputAction.next,
        controller: cvvController,
        keyboardType: TextInputType.number,
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (value) {
          // if (previousTextControllerLength < cardNumberController.text.length) {
          //   if (cardNumberController.text.length == 4 ||
          //       cardNumberController.text.length == 9 ||
          //       cardNumberController.text.length == 14) {
          //     cardNumberController.text = '${cardNumberController.text} ';
          //   }
          // } else if (cardNumberController.text.length == 5 ||
          //     cardNumberController.text.length == 10 ||
          //     cardNumberController.text.length == 15) {
          //   cardNumberController.text = cardNumberController.text
          //       .substring(0, cardNumberController.text.length - 1);
          // }

          // previousTextControllerLength = cardNumberController.text.length;

          final cardBloc = BlocProvider.of<CardBloc>(context);
          cardBloc.add(ChangeCVVEvent(cvv: cvvController.text));
        },
        maxLength: 3,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.sorryPleaseEnterACvv;
          }
          final bool numberValid = RegExp('^[0-9]{3}\$').hasMatch(value.trim());

          if (numberValid) {
            return null;
          } else {
            return AppLocalizations.of(context)!.notValidCvvNumber;
          }
        });
  }
}
