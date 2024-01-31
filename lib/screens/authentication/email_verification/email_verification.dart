import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:jbus_app/screens/authentication/email_verification/cubit/email_verify_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/text_fields/otp_text_field.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({
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
      child: BlocProvider(
        create: (context) => EmailVerifyCubit(
          apiService: sl(),
          authService: sl(),
          prefs: sl(),
        ),
        child: BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
          listener: (context, state) {
            if (state is EmailVerifySuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            return Scaffold(
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
                            Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  // textDirection: TextDirection.ltr,
                                  children: [
                                    OtpTextField(
                                        first: true,
                                        digitController: otp1Controller),
                                    OtpTextField(
                                        digitController: otp2Controller),
                                    OtpTextField(
                                        digitController: otp3Controller),
                                    OtpTextField(
                                        digitController: otp4Controller),
                                  ],
                                ),
                              ),
                            ),
                            RectangularElevatedButton(
                                text: AppLocalizations.of(context)!.verify,
                                onPressed: () {
                                  context.read<EmailVerifyCubit>().signUp(
                                        RegisterRequest(
                                          name: '${firstName!} ${lastName!}',
                                          email: email!,
                                          phoneNumber: phoneNumber,
                                          password: password!,
                                        ),
                                        int.parse(
                                            '${otp1Controller.text}${otp2Controller.text}${otp3Controller.text}${otp4Controller.text}'),
                                      );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
