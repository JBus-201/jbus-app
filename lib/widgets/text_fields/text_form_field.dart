import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/authentication/signup/bloc/signup_bloc.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class OurTextFormField extends StatelessWidget {
  const OurTextFormField({
    super.key,
    required this.label,
    required this.validator,
    this.obscureText = false,
    required this.autocorrect,
    required this.enableSuggestions,
    required this.keyboardType,
    required this.maxLength,
    required this.controller,
    this.counterText = '',
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.showCursor = true,
    this.inputFormatters,
    this.autofocus = false,
    this.focusNode,
    this.icon,
    this.suffixIcon,
    this.leftPadding = 4,
    this.topPadding = 8,
    this.rightPadding = 4,
    this.bottomPadding = 8,
    this.sizedBoxHeight = 85,
    this.labelFontSize = 16,
    this.hintText = '',
  });

  final String label;
  final bool? obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextEditingController? controller;
  final String? counterText;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final bool showCursor;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;
  final IconData? icon;
  final IconData? suffixIcon;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;
  final double sizedBoxHeight;
  final double labelFontSize;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          top: topPadding,
          right: rightPadding,
          bottom: bottomPadding,
        ),
        child: SizedBox(
          //height: 85,
          height: sizedBoxHeight,
          child: TextFormField(
            //initialValue:initialValue,
            
            validator: validator,
            focusNode: focusNode,
            autofocus: autofocus,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            textAlign: textAlign,
            textInputAction: textInputAction,
            maxLength: maxLength,
            keyboardType: keyboardType,
            obscureText: obscureText!,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            showCursor: showCursor,
            controller: controller,
            cursorColor:
                themeState.thememode == ThemeMode.light ? ourBlue : ourOrange,
            style: TextStyle(
              color:
                  themeState.thememode == ThemeMode.light ? ourBlack : ourWhite,
            ),
            decoration: InputDecoration(
              hintText: hintText,

                // isDense: true,
                // contentPadding: const EdgeInsets.fromLTRB(15, 50, 50, 0),

                //suffixIcon: Icon(suffixIcon),
                suffix: suffixIcon != null
                    ? IconButton(
                        //iconSize: 200,
                        icon: Icon(
                          suffixIcon,
                          //size: 30,
                          color: ourNavey,
                        ),
                        color: ourNavey,
                        onPressed: () {
                          final signupBloc =
                              BlocProvider.of<SignupBloc>(context);

                          if (signupBloc.state.icon ==
                              Icons.visibility_off_outlined) {
                            signupBloc.add(SwitchToVisibilityOnEvent());
                          } else {
                            signupBloc.add(SwitchToVisibilityOffEvent());
                          }
                        })
                    : null,
                focusColor: themeState.thememode == ThemeMode.light
                    ? ourBlue
                    : ourOrange,
                errorStyle: const TextStyle(height: 1),
                counterText: counterText,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: themeState.thememode == ThemeMode.light
                        ? ourBlue
                        : ourOrange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: themeState.thememode == ThemeMode.light
                        ? ourBlue
                        : ourOrange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: themeState.thememode == ThemeMode.light
                        ? ourDarkBlue
                        : ourOrange,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                      color: themeState.thememode == ThemeMode.light
                          ? ourDarkBlue
                          : ourOrange),
                ),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: themeState.thememode == ThemeMode.light
                          ? ourNavey
                          : ourOrange,
                    ),
                     SizedBox(
                      width: MediaQuery.of(context).size.height * 0.009389,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                        color: themeState.thememode == ThemeMode.light
                            ? ourNavey
                            : ourYellow,
                        fontSize: labelFontSize,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
