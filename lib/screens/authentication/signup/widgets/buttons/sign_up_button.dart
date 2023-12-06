import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.firstNameControllerText,
    required this.lastNameControllerText,
    required this.emailControllerText,
    this.phoneNumberControllerText,
    required this.passwordControllerText,
    this.validator,
    required this.formKey,
  });

  final String firstNameControllerText;
  final String lastNameControllerText;
  final String emailControllerText;
  final String? phoneNumberControllerText;
  final String passwordControllerText;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
      text: S.of(context).signUp,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmailVerificationScreen(
                      firstName: firstNameControllerText,
                      lastName: lastNameControllerText,
                      email: emailControllerText,
                      phoneNumber: phoneNumberControllerText,
                      password: passwordControllerText,
                    )),
          );
        }
      },
      width: double.maxFinite,
    );
  }
}
