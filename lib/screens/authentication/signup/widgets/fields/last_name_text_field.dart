import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({super.key});

  static final TextEditingController lastNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
      label: AppLocalizations.of(context)!.lastName,
      icon: Icons.person_outline_outlined,
      textInputAction: TextInputAction.next,
      controller: lastNameController,
      keyboardType: TextInputType.name,
      autocorrect: true,
      enableSuggestions: true,
      maxLength: 15,
      counterText: '',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.sorryPleaseEnterYourLastName;
        }
        final bool firstNameValid =
            RegExp('^[A-Za-z]{1,15}\$').hasMatch(value.trim());
        if (firstNameValid) {
          return null;
        } else {
          return AppLocalizations.of(context)!.sorryPleaseEnterAValidName;
        }
      },
    );
  }
}
