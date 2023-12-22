import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/authentication/signup/bloc/signup_bloc.dart';

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
          //textAlignVertical: TextAlignVertical.center,

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
          decoration: InputDecoration(
              suffix: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: ourNavey,
                      ),
                      color: ourNavey,
                      onPressed: () {
                        final signupBloc = BlocProvider.of<SignupBloc>(context);

                        if (signupBloc.state.icon ==
                            Icons.visibility_off_outlined) {
                          signupBloc.add(SwitchToVisibilityOnEvent());
                        } else {
                          signupBloc.add(SwitchToVisibilityOffEvent());
                        }
                      })
                  : null,
              // suffixIcon: Icon(

              focusColor: ourBlue,
              errorStyle: const TextStyle(height: 1),
              counterText: counterText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: ourBlue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: ourBlue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: ourDarkBlue,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(color: ourDarkBlue),
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: ourNavey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                      color: ourNavey,
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
