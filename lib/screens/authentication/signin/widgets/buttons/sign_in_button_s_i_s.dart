import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/general_blocs/email_bloc/bloc/email_bloc.dart';
import 'package:jbus_app/general_blocs/password_bloc/bloc/password_bloc.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_cubit.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/email_text_field_for_sign_in.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/password_text_field_for_sign_in.dart';
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInButtonSIS extends StatelessWidget {
  const SignInButtonSIS({
    super.key,
    // required this.emailController,
    // required this.passwordController,
    this.validator,
    required this.formKey,
  });

  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        if (state is SigninLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ourNavey,
            ),
          );
        }
        return BlocBuilder<PasswordBloc, PasswordState>(
          builder: (context, passwordState) {
            return BlocBuilder<EmailBloc, EmailState>(
              builder: (context, emailState) {
                return RectangularElevatedButton(
                  text: AppLocalizations.of(context)!.signIn,
                  onPressed: () async {
                    if (formKey.currentState!.validate() || true) {
                     
                      final fcmToken =
                          await FirebaseMessaging.instance.getToken();
                      final credential = LoginRequest(
                        email: EmailTextFieldSI.emailController.text,
               
                        password: PasswordTextFieldSI.passwordController.text,
                      
                        fcmToken: fcmToken,
                     
                     
                      );

                      if (context.mounted) {
                        context.read<SigninCubit>().login(credential);
                      }
                    }
                  },
                  width: double.maxFinite,
                );
              },
            );
          },
        );
      },
    );
  }
}
