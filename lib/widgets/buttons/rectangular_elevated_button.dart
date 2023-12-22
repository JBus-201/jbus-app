import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';

class RectangularElevatedButton extends StatelessWidget {
  const RectangularElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.maxFinite,
    this.gradient = blueButtonGradient,
    this.padding = 4,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final double height;
  final double width;
  final Gradient? gradient;
  final double padding;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
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
          ),
        ),
      ),
    );
  }
}
