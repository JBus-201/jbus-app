import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/buttons/sign_up_button.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/email_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/first_name_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/last_name_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/mobile_number_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_text_fields.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).signUp,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: const Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: FirstNameTextField(),
                        ),
                        Expanded(
                          child: LastNameTextField(),
                        ),
                      ],
                    ),
                    
                    EmailTextField(),
                    MobileNumberTextField(),
                    PasswordTextFields(),
                  ],
                ),
              ),
              SignUpButton(
                firstNameControllerText:
                    FirstNameTextField.firstNameController.text,
                lastNameControllerText:
                    LastNameTextField.lastNameController.text,
                emailControllerText: EmailTextField.emailController.text,
                phoneNumberControllerText:
                    MobileNumberTextField.phoneNumberController.text,
                passwordControllerText:
                    PasswordTextFields.passwordController.text,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
