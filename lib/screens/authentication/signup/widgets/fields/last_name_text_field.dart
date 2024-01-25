import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class LastNameTextField extends StatelessWidget {
  LastNameTextField({super.key});

  final TextEditingController lastNameController = TextEditingController();
  static String? lastName;

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
          lastName = value.trim();
          return null;
        } else {
          return AppLocalizations.of(context)!.sorryPleaseEnterAValidName;
        }
      },
    );
  }
}
