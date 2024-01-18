import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/screens/trip/bloc/pickup_bloc.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class IsPickUpButton extends StatelessWidget {
  const IsPickUpButton({
    super.key,
    required this.onPressed,
    this.height = 50,
    this.width = double.maxFinite,
    this.gradientPick = blueButtonGradient,
    this.gradientDrop = orangeButtonGradient,
    this.padding = 4,
    this.textColor = ourWhite,
    this.fontSize = 14,
  });

  final Function()? onPressed;
  final double height;
  final double width;
  final Gradient? gradientPick;
  final Gradient? gradientDrop;
  final double padding;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return BlocBuilder<PickupBloc, PickupState>(builder: (context, pickState) {
        return Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            gradient: pickState.isPickup
                ? gradientPick
                : gradientDrop,
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
              pickState.text,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
        ),
      );
    });});
  }
}
