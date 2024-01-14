import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class PasswordTextFieldForSignUp extends StatelessWidget {
  const PasswordTextFieldForSignUp({super.key});

  static final TextEditingController passwordController =
      TextEditingController();
  // static final TextEditingController confirmPasswordController =
  //     TextEditingController();
  static String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return OurTextFormField(
            label: AppLocalizations.of(context)!.password,
            icon: Icons.lock_outline_rounded,
            suffixIcon: state.icon,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.obscureText,
            autocorrect: false,
            enableSuggestions: false,
            bottomPadding: 24,
            sizedBoxHeight: 65,
            maxLength: 40,
            validator: (value) {
              password = value;

              final RegExp regex = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.sorryPleaseEnterAPassword;
              } else if (!regex.hasMatch(value)) {
                return AppLocalizations.of(context)!
                    .sorryPleaseEnterAValidPassword;
              }
              return null;
            },
          );
        },
      ),
      // BlocBuilder<SignupBloc, SignupState>(
      //   builder: (context, state) {
      // return OurTextFormField(
      //     label: AppLocalizations.of(context)!.confirmPassword,
      //     icon: Icons.lock_outline_rounded,
      //     suffixIcon: state.icon,
      //     textInputAction: TextInputAction.done,
      //     controller: confirmPasswordController,
      //     keyboardType: TextInputType.visiblePassword,
      //     enableSuggestions: false,
      //     obscureText: state.obscureText,
      //     autocorrect: false,
      //     maxLength: 40,
      //     validator: (value) {
      //       if (value == null || value.isEmpty) {
      //         return AppLocalizations.of(context)!.sorryPleaseReEnterYourPassword;
      //       }

      //       if (password != value.trim()) {
      //         return AppLocalizations.of(context)!.sorryPasswordDoesNotMatch;
      //         //'Sorry, Password does not match, please re enter your password correctly.';
      //       }

      //       return null;
      //     });
      //   },
      // ),
    );
  }
}
