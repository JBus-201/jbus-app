import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/text_fields/otp_text_field.dart';

class MobileNumberVerificationScreen extends StatelessWidget {
  MobileNumberVerificationScreen({
    super.key,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  final TextEditingController otp1Controller = TextEditingController();
  final TextEditingController otp2Controller = TextEditingController();
  final TextEditingController otp3Controller = TextEditingController();
  final TextEditingController otp4Controller = TextEditingController();

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
          title: Text(AppLocalizations.of(context)!.mobileNumber),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .pleaseEnterTheCodeSentToTheMobileNumberBelow,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            //textDirection: TextDirection.ltr,
                            children: [
                              OtpTextField(
                                  first: true, digitController: otp1Controller),
                              OtpTextField(digitController: otp2Controller),
                              OtpTextField(digitController: otp3Controller),
                              OtpTextField(digitController: otp4Controller),
                            ],
                          ),
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
