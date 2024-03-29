import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    this.first = false,
    required this.digitController,
  });

  final bool first;
  final TextEditingController digitController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Expanded(
        child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009389),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.11737089,
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
