import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/general_blocs/password_bloc/bloc/password_bloc.dart';
import 'package:jbus_app/screens/authentication/signup/widgets/fields/password_text_fields.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final passwordBloc = BlocProvider.of<PasswordBloc>(context);
              passwordBloc.add(UpdatePasswordEvent(PasswordTextField.password!));
            },
            child: const OurText('Lok an on pressed')),
      ),
    );
  }
}
