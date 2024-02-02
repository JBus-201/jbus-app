import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/general_blocs/email_bloc/bloc/email_bloc.dart';
import 'package:jbus_app/general_blocs/mobile_number_bloc/bloc/mobile_number_bloc.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/general_blocs/password_bloc/bloc/password_bloc.dart';
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
      create: (context) => SignupCubit(apiService: sl()),
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
                    // firstName: FirstNameTextField.firstNameController.text,
                    // lastName: LastNameTextField.lastNameController.text,
                    //email: EmailTextFieldForSignUp.emailController.text,
                    // phoneNumber: MobileNumberTextField
                    //         .phoneNumberController.text.isEmpty
                    //     ? null
                    //     : MobileNumberTextField.phoneNumberController.text,
                    // password:
                    //     PasswordTextFieldForSignUp.passwordController.text,
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
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
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
                                      PasswordTextField(),
                                      PasswordVerificationTextField()
                                    ],
                                  ),
                                ),
                                BlocBuilder<EmailBloc, EmailState>(
                                  builder: (context, state) {
                                    return SignUpButtonSUS(
                                      // firstNameControllerText:
                                      //     FirstNameTextField
                                      //         .firstNameController.text,
                                      // lastNameControllerText: LastNameTextField
                                      //     .lastNameController.text,
                                      // // emailControllerText:
                                      // // EmailTextFieldForSignUp
                                      // //     .emailController.text,
                                      // phoneNumberControllerText:
                                      //     MobileNumberTextField
                                      //         .phoneNumberController.text,
                                      // passwordControllerText:
                                      //     PasswordTextFieldForSignUp
                                      //         .passwordController.text,
                                      formKey: formKey,
                                      onPressed: () {
                                        final emailBloc =
                                            BlocProvider.of<EmailBloc>(context);
                                        emailBloc.add(UpdateEmailEvent(
                                            EmailTextField.email!));

                                        final firstnameBloc =
                                            BlocProvider.of<NameBloc>(context);
                                        firstnameBloc.add(
                                          UpdateNameEvent(
                                            firstName:
                                                FirstNameTextField.firstName!,
                                            lastName: '',
                                          ),
                                        );

                                        final lastnameBloc =
                                            BlocProvider.of<NameBloc>(context);
                                        lastnameBloc.add(
                                          UpdateNameEvent(
                                            firstName: '',
                                            lastName:
                                                LastNameTextField.lastName!,
                                          ),
                                        );

                                        final mobileNumberBloc =
                                            BlocProvider.of<MobileNumberBloc>(
                                                context);
                                        mobileNumberBloc.add(
                                            UpdateMobileNumberEvent(
                                                MobileNumberTextField
                                                    .mobileNumber!));

                                        final passwordBloc =
                                            BlocProvider.of<PasswordBloc>(
                                                context);
                                        passwordBloc.add(UpdatePasswordEvent(
                                            PasswordTextField.password!));

                                        context.read<SignupCubit>().sendOTP(
                                              EmailTextField.email!,

                                              //state.email,
                                            );
                                      },
                                      isLoading: state is SignupLoading,
                                    );
                                  },
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
