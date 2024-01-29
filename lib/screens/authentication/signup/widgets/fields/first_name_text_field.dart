import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class FirstNameTextField extends StatelessWidget {
  FirstNameTextField({super.key});

  final TextEditingController firstNameController = TextEditingController();
  static String? firstName;

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
      label: AppLocalizations.of(context)!.firstName,
      icon: Icons.person_outline_outlined,
      textInputAction: TextInputAction.next,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      autocorrect: true,
      enableSuggestions: true,
      maxLength: 15,
      counterText: '',
      validator: (value) {
        firstName = value;
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.sorryPleaseEnterYourFirstName;
        }

        final bool firstNameValid = RegExp('^[A-Za-z]{1,15}\$').hasMatch(value);
        if (firstNameValid) {
          
          return null;
        } else {
          return AppLocalizations.of(context)!.sorryPleaseEnterAValidName;
        }
      },
    );
  }
}
