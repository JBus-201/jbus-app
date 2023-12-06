import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/widgets/fields/text_form_field.dart';

class PasswordTextFields extends StatelessWidget {
  const PasswordTextFields({super.key});

  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? password;

    return Column(
      children: [
        OurTextFormField(
            label: S.of(context).password,
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
                return S.of(context).sorryPleaseEnterAPassword;
              } else if (!regex.hasMatch(value)) {
                return S.of(context).sorryPleaseEnterAValidPassword;
              }
              return null;
            }),
        OurTextFormField(
            label: S.of(context).confirmPassword,
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
                return S.of(context).sorryPleaseReEnterYourPassword;
              }

              if (password != value.trim()) {
                return S.of(context).sorryPasswordDoesNotMatch;
                //'Sorry, Password does not match, please re enter your password correctly.';
              }

              return null;
            }),
      ],
    );
  }
}
