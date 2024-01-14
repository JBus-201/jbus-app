import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class EmailTextFieldForSignUp extends StatelessWidget {
  const EmailTextFieldForSignUp({
    super.key,
  });

  static final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
        label: AppLocalizations.of(context)!.email,
        icon: Icons.email_outlined,
        textInputAction: TextInputAction.next,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        enableSuggestions: false,
        maxLength: 40,
        counterText: '',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.sorryPleaseEnterYourEmail;
          }
          final bool emailValid =
              RegExp('^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})\$')
                  .hasMatch(value.trim());

          if (emailValid) {
            return null;
          } else {
            return AppLocalizations.of(context)!.sorryPleaseEnterAValidEmail;
          }
        });
  }
}
