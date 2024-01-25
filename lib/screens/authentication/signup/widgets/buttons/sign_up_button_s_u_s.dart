import 'package:flutter/material.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButtonSUS extends StatelessWidget {
  const SignUpButtonSUS({
    super.key,
    // required this.firstNameControllerText,
    // required this.lastNameControllerText,
    // //required this.emailControllerText,
    // this.phoneNumberControllerText,
    // required this.passwordControllerText,
    this.validator,
    required this.formKey,
    required this.onPressed,
    required this.isLoading,
  });

  // final String firstNameControllerText;
  // final String lastNameControllerText;
  //final String emailControllerText;
  // final String? phoneNumberControllerText;
  // final String passwordControllerText;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
      text: AppLocalizations.of(context)!.signUp,
      onPressed: isLoading
          ? null
          : () {
              if (formKey.currentState!.validate()) {
                onPressed();
              }
            },
      width: double.maxFinite,
    );
  }
}
