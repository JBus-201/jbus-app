import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/others/card/bloc/card_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class CardNumberTextField extends StatelessWidget {
  const CardNumberTextField({super.key});
  static final TextEditingController cardNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    int previousTextControllerLength = 0;
    return OurTextFormField(
        label: AppLocalizations.of(context)!.cardNumber,
        icon: Icons.numbers_rounded,
        hintText: '#### #### #### ####',
        textInputAction: TextInputAction.next,
        controller: cardNumberController,
        keyboardType: TextInputType.number,
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (value) {
          if (previousTextControllerLength < cardNumberController.text.length) {
            if (cardNumberController.text.length == 4 ||
                cardNumberController.text.length == 9 ||
                cardNumberController.text.length == 14) {
              cardNumberController.text = '${cardNumberController.text} ';
            }
          } else if (cardNumberController.text.length == 5 ||
              cardNumberController.text.length == 10 ||
              cardNumberController.text.length == 15) {
            cardNumberController.text = cardNumberController.text
                .substring(0, cardNumberController.text.length - 1);
          }

          previousTextControllerLength = cardNumberController.text.length;

          final cardBloc = BlocProvider.of<CardBloc>(context);
          cardBloc.add(
              ChangeCardNumberEvent(cardNumber: cardNumberController.text));
        },
        maxLength: 19,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.sorryPleaseEnterACardNumber;
          }
          String filterdValue = value.trim();
          filterdValue = filterdValue.replaceAll(' ', '');
          //print(filterdValue);

          final bool numberValid =
              RegExp('^[0-9]{16}\$').hasMatch(filterdValue);
          //RegExp regex = RegExp(r'^\d{16}$');
          //'^d{16}\$'

          if (numberValid) {
            return null;
          } else {
            return AppLocalizations.of(context)!.notValidCardNumber;
          }
        });
  }
}
