import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/authentication/email_verification/email_verification.dart';
import 'package:jbus_app/screens/authentication/signup/cubit/signup_cubit.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/buttons/sign_in_button_s_u_s.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/buttons/sign_up_button_s_u_s.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/email_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/first_name_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/last_name_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/mobile_number_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_text_fields.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_verification_field.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) =>
          SignupCubit(apiService: sl(), authService: sl(), prefs: sl()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupOTPSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent to your email'),
              ),
            );
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmailVerificationScreen(
                      firstName: FirstNameTextField.firstNameController.text,
                      lastName: LastNameTextField.lastNameController.text,
                      email: EmailTextFieldForSignUp.emailController.text,
                      phoneNumber: MobileNumberTextField
                              .phoneNumberController.text.isEmpty
                          ? null
                          : MobileNumberTextField.phoneNumberController.text,
                      password:
                          PasswordTextFieldForSignUp.passwordController.text,
                    )));
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      title: JbusAppBarTitle(),
                      //const AppBarTitleLogo(),
                      // Text(
                      //   AppLocalizations.of(context)!.signUp,
                      // ),
                      floating: false,
                      pinned: false,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (context, index) => Padding(
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
                                      EmailTextFieldForSignUp(),
                                      MobileNumberTextField(),
                                      PasswordTextFieldForSignUp(),
                                      PasswordVerificationTextField()
                                    ],
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 8,
                                // ),

                                SignUpButtonSUS(
                                  firstNameControllerText: FirstNameTextField
                                      .firstNameController.text,
                                  lastNameControllerText:
                                      LastNameTextField.lastNameController.text,
                                  emailControllerText: EmailTextFieldForSignUp
                                      .emailController.text,
                                  phoneNumberControllerText:
                                      MobileNumberTextField
                                          .phoneNumberController.text,
                                  passwordControllerText:
                                      PasswordTextFieldForSignUp
                                          .passwordController.text,
                                  formKey: formKey,
                                  onPressed: () {
                                    context.read<SignupCubit>().sendOTP(
                                        EmailTextFieldForSignUp
                                            .emailController.text);
                                  },
                                  isLoading: state is SignupLoading,
                                ),

                                const SignInButtonSUS(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
