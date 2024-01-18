import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_cubit.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInButtonSIS extends StatelessWidget {
  const SignInButtonSIS({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.validator,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SigninLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RectangularElevatedButton(
          text: AppLocalizations.of(context)!.signIn,
          onPressed: () {
            if (formKey.currentState!.validate() || true) {
              final credential = LoginRequest(
                email: emailController.text,
                password: passwordController.text,
              );
              context.read<SigninCubit>().login(credential);
            }
          },
          width: double.maxFinite,
        );
      },
    );
  }
}
