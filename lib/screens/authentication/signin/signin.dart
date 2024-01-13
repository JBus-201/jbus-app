import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_cubit.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_state.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/services/service_locator.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(apiService: sl(), authService: sl(), prefs: sl()),
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          if (state is SigninSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashbourd()));
          }
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
                  controller: emailController,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                  ),
                  controller: passwordController,
                ),
                ElevatedButton(
                  onPressed: state is! SigninLoading
                      ? () {
                          final credentials = LoginRequest(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          context.read<SigninCubit>().login(credentials);
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
