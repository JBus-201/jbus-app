import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class PasswordTextFieldSI extends StatelessWidget {
  const PasswordTextFieldSI({super.key});

  static final TextEditingController passwordController =
      TextEditingController();
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
            bottomPadding: MediaQuery.of(context).size.height * 0.02816,
            sizedBoxHeight: MediaQuery.of(context).size.height * 0.07629,
            maxLength: 40,
            validator: (value) {
              final RegExp regex = RegExp(r'.{8,20}');

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
    );
  }
}
