import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButtonSUS extends StatelessWidget {
  const SignUpButtonSUS({
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
    final AppLocalizations locale = localeInstance();
    return RectangularElevatedButton(
      text: locale.signUp,
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
