import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    this.first = false,
  }) : super(key: key);

  final bool first;

  @override
  Widget build(BuildContext context) {
    final TextEditingController digitController = TextEditingController();

    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }

                if (value.isEmpty && first == false) {
                  FocusScope.of(context).previousFocus();
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              showCursor: false,
              maxLength: 1,
              keyboardType: TextInputType.number,

              autocorrect: false,
              enableSuggestions: false,
              // validator: (value) {
              //   return null;
              // },
              autofocus: first == true ? true : false,
              controller: digitController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeState.thememode == ThemeMode.light
                    ? ourBlack
                    : ourWhite,
              ),
              decoration: InputDecoration(
                counterText: ' ',
                focusColor: themeState.thememode == ThemeMode.light
                    ? ourBlue
                    : ourOrange,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: themeState.thememode == ThemeMode.light
                        ? ourBlue
                        : ourOrange,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
