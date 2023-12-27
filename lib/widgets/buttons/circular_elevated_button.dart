import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class CircularElevatedButton extends StatelessWidget {
  const CircularElevatedButton({
    Key? key,
    required this.onPressed,
    this.gradient = blueButtonGradient,
    this.gradientForDark = orangeButtonGradient,
    this.icon,
    this.size = 50,
  }) : super(key: key);

  final Function()? onPressed;
  final Gradient? gradient;
  final Gradient? gradientForDark;
  final IconData? icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: themeState.thememode == ThemeMode.light ? gradient : gradientForDark,
            shape: BoxShape.circle,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: size,
              ),
            ),
          ),
        ),
      );
    });
  }
}
