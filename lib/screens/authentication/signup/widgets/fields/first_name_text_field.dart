import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/widgets/fields/text_form_field.dart';

class FirstNameTextField extends StatelessWidget {
  const FirstNameTextField({super.key});

  static final TextEditingController firstNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
      label: S.of(context).firstName,
      icon: Icons.person_outline_outlined,
      textInputAction: TextInputAction.next,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      autocorrect: true,
      enableSuggestions: true,
      maxLength: 15,
      counterText: '',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).sorryPleaseEnterYourFirstName;
        }

        final bool firstNameValid = RegExp('^[A-Za-z]{1,15}\$').hasMatch(value);
        if (firstNameValid) {
          return null;
        } else {
          return S.of(context).sorryPleaseEnterAValidName;
        }
      },
    );
  }
}
