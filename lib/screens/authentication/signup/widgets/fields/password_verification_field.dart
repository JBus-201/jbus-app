import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_text_fields.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class PasswordVerificationTextField extends StatelessWidget {
  const PasswordVerificationTextField({super.key});

    static final TextEditingController confirmPasswordController =
      TextEditingController();

      @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = localeInstance();


    return BlocProvider(
      create: (context) => SignupBloc(),
      child: 
        
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return  OurTextFormField(
                  label: locale.confirmPassword,
                  icon: Icons.lock_outline_rounded,
                  suffixIcon: state.icon,
                  textInputAction: TextInputAction.done,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  obscureText: state.obscureText,
                  autocorrect: false,
                  maxLength: 40,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return locale.sorryPleaseReEnterYourPassword;
                    }

                    if (PasswordTextField.password != value.trim()) {
                      return locale.sorryPasswordDoesNotMatch;
                      //'Sorry, Password does not match, please re enter your password correctly.';
                    }

                    return null;
                  });

            }
            ),
            );


}}