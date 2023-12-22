import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
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
    // this.leftPadding = 4,
    // this.topPadding = 12,
    // this.rightPadding = 4,
    // this.bottomPadding = 12,
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

  // final double leftPadding;
  // final double topPadding;
  // final double rightPadding;
  // final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 12,
          bottom: 12,
          // left: leftPadding,
          // top: topPadding,
          // right: rightPadding,
          // bottom: bottomPadding,
        ),
        child: SizedBox(
          height: 75,
          child: TextFormField(
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
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                        color: themeState.thememode == ThemeMode.light
                            ? ourNavey
                            : ourYellow,
                        fontSize: 16,
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
