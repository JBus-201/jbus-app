import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/text_fields/otp_text_field.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({
    Key? key,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
  }) : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (MediaQuery.of(context).viewInsets.bottom != 0) {
          FocusManager.instance.primaryFocus?.previousFocus();
          FocusManager.instance.primaryFocus?.previousFocus();
          FocusManager.instance.primaryFocus?.previousFocus();
          FocusManager.instance.primaryFocus?.previousFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.email),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .pleaseEnterTheCodeSentToTheEmailBelow,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(26.0),
                        child: Row(
                          children: [
                            OtpTextField(first: true),
                            OtpTextField(),
                            OtpTextField(),
                            OtpTextField(),
                          ],
                        ),
                      ),
                      RectangularElevatedButton(
                          text: AppLocalizations.of(context)!.verify,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsScreen()),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
