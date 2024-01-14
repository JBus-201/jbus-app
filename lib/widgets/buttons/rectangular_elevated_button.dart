import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class RectangularElevatedButton extends StatelessWidget {
  const RectangularElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.maxFinite,
    this.gradient = blueButtonGradient,
    this.gradientForDark = orangeButtonGradient,
    this.padding = 4,
    this.textColor = ourWhite,
  });

  final String text;
  final Function()? onPressed;
  final double height;
  final double width;
  final Gradient? gradient;
  final Gradient? gradientForDark;
  final double padding;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            gradient: themeState.thememode == ThemeMode.light
                ? gradient
                : gradientForDark,
            borderRadius: BorderRadius.circular(22),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(width, height),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      );
    });
  }
}
