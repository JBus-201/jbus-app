import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInButtonSIS extends StatelessWidget {
  const SignInButtonSIS({
    super.key,
    required this.emailControllerText,
    required this.passwordControllerText,
    this.validator,
    required this.formKey,
  });

  final String emailControllerText;
  final String passwordControllerText;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
      text: AppLocalizations.of(context)!.signIn,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmailVerificationScreen(
                      email: emailControllerText,
                      password: passwordControllerText,
                    )),
          );
        }
      },
      width: double.maxFinite,
    );
  }
}
