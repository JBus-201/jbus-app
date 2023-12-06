import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/widgets/fields/text_form_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  static final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
        label: S.of(context).email,
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
            return S.of(context).sorryPleaseEnterYourEmail;
          }
          final bool emailValid =
              RegExp('^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})\$')
                  .hasMatch(value.trim());

          if (emailValid) {
            return null;
          } else {
            return S.of(context).sorryPleaseEnterAValidEmail;
          }
        });
  }
}
