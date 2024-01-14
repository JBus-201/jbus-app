import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/buttons/sign_up_button_s_i_s.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/buttons/sign_in_button_s_i_s.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/email_text_field.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/password_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/email_text_field.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_text_fields.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: JbusAppBarTitle(),
                automaticallyImplyLeading: false,

                //const AppBarTitleLogo(),
                //     Text(
                //   AppLocalizations.of(context)!.signIn,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                            key: formKey,
                            child: const Column(
                              children: [
                                EmailTextFieldForSignIn(),
                                PasswordTextFieldForSignIn(),
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   height: 8,
                          // ),

                          SignInButtonSIS(
                            emailControllerText:
                                EmailTextFieldForSignUp.emailController.text,
                            passwordControllerText: PasswordTextFieldForSignUp
                                .passwordController.text,
                            formKey: formKey,
                          ),

                          const SignUpButtonSIS(),
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
  }
}
