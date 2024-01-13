import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signin/signin.dart';
import 'package:jbus_app/widgets/buttons/text_button.dart';

class SignInButtonSUS extends StatelessWidget {
  const SignInButtonSUS({super.key});
  @override
  Widget build(BuildContext context) {
    return OurTextButton(
      text: "already have an account? SignIn",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SigninScreen(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
            ),
          ),
        );
      },
    );
  }
}
