import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/authentication/signin/cubit/signin_cubit.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/buttons/sign_up_button_s_i_s.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/buttons/sign_in_button_s_i_s.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/email_text_field_for_sign_in.dart';
import 'package:jbus_app/screens/authentication/signin/widgets/fields/password_text_field_for_sign_in.dart';
import 'package:jbus_app/services/service_locator.dart';
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
                floating: false,
                pinned: false,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => Padding(
                    padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.014084),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                            key: formKey,
                            child: const Column(
                              children: [
                                EmailTextFieldSI(),
                                PasswordTextFieldSI(),
                              ],
                            ),
                          ),
                          BlocProvider(
                            create: (context) => SigninCubit(
                              apiService: sl(),
                              authService: sl(),
                              prefs: sl(),
                            ),
                            child: SignInButtonSIS(
                              formKey: formKey,
                            ),
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