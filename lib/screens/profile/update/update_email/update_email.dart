import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/email_text_field.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class UpdateEmailScreen extends StatelessWidget {
  const UpdateEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
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
