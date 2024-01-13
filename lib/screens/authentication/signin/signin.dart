import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_cubit.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/services/service_locator.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(apiService: sl(), authService: sl()),
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.signIn),
            ),
            body: Container(
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.email,
                  ),
                  onChanged: (value) {
                    context.read<SigninCubit>().emailChanged(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                  ),
                  onChanged: (value) {
                    context.read<SigninCubit>().passwordChanged(value);
                  },
                ),
                ElevatedButton(
                  onPressed: state is! SigninLoading
                      ? () {
                          context.read<SigninCubit>().submit();
                        }
                      : null,
                  child: Text(AppLocalizations.of(context)!.signIn),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
