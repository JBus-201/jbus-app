import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/fields/text_form_field.dart';

class PasswordTextFields extends StatelessWidget {
  const PasswordTextFields({super.key});

  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();

    String? password;

    return Column(
      children: [
        OurTextFormField(
            label: locale.password,
            icon: Icons.lock_outline_rounded,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            maxLength: 40,
            validator: (value) {
              password = value;

              final RegExp regex = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

              if (value == null || value.isEmpty) {
                return locale.sorryPleaseEnterAPassword;
              } else if (!regex.hasMatch(value)) {
                return locale.sorryPleaseEnterAValidPassword;
              }
              return null;
            }),
        OurTextFormField(
            label: locale.confirmPassword,
            icon: Icons.lock_outline_rounded,
            textInputAction: TextInputAction.done,
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            maxLength: 40,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return locale.sorryPleaseReEnterYourPassword;
              }

              if (password != value.trim()) {
                return locale.sorryPasswordDoesNotMatch;
                //'Sorry, Password does not match, please re enter your password correctly.';
              }

              return null;
            }),
      ],
    );
  }
}
