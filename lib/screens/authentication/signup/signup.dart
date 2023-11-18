import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signUp),
      ),
      body:  Center(
        child: Text(S.of(context).signUp),
      ),
    );
  }
}
