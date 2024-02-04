import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class CircularElevatedButton extends StatelessWidget {
  const CircularElevatedButton({
    super.key,
    required this.onPressed,
    this.gradient = blueButtonGradient,
    this.gradientForDark = orangeButtonGradient,
    this.icon,
    this.iconColor = ourWhite,
    this.size = 50,
  });

  final Function()? onPressed;
  final Gradient? gradient;
  final Gradient? gradientForDark;
  final IconData? icon;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00704225),
        child: Container(
          decoration: BoxDecoration(
            gradient: themeState.thememode == ThemeMode.light
                ? gradient
                : gradientForDark,
            shape: BoxShape.circle,
          ),

          //color: Colors.white,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00469484),
              child: Icon(
                icon,
                size: size,
                color: iconColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
