import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class CardHolderNameTextField extends StatelessWidget {
  const CardHolderNameTextField({super.key});
  static final TextEditingController cardHolderNameContorller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
        label: AppLocalizations.of(context)!.cardHolderNameOptional,
        icon: Icons.person_outline_rounded,
        textInputAction: TextInputAction.next,
        controller: cardHolderNameContorller,
        keyboardType: TextInputType.name,
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (value) {
          final cardBloc = BlocProvider.of<CardBloc>(context);
          cardBloc.add(ChangeCardHolderNameEvent(
              cardHolderName: cardHolderNameContorller.text));
        },
        maxLength: 30,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          final bool nameValid =
              RegExp('^[a-zA-Z ]{1,30}\$').hasMatch(value.trim());

          if (nameValid) {
            return null;
          } else {
            return AppLocalizations.of(context)!.notValidCardHolderName;
          }
        });
  }
}
