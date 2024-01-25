import 'package:flutter/material.dart';
import 'package:jbus_app/general_blocs/email_bloc/bloc/email_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/email_text_field.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class UpdateEmailScreen extends StatelessWidget {
  const UpdateEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const OurText('Update your email'),
            EmailTextField(),
          ],
        ),
      ),
    );
  }
}
