import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/icons/our_icon.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

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

    this.fontColor = ourWhite,
    this.icon = Icons.error_outline,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,

  });

  final String text;
  final Function()? onPressed;
  final double height;
  final double width;
  final Gradient? gradient;
  final Gradient? gradientForDark;
  final double padding;

  final Color fontColor;
  final double fontSize;
  final IconData icon;
  final FontWeight fontWeight;


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
              child: icon == Icons.error_outline
                  ? OurText(
                      text,
                      color: fontColor,
                      fontSize: fontSize,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OurText(
                          '$text ',
                          fontSize: fontSize,
                          color: fontColor,
                          fontWeight: fontWeight,
                        ),
                        OurIcon(icon),
                      ],
                    )),

        ),
      );
    });
  }
}
