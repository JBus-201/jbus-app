import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';

class CircularElevatedButton extends StatelessWidget {
  const CircularElevatedButton({
    Key? key,
    required this.onPressed,
    this.gradient = blueButtonGradient,
    this.icon,
    this.size = 50,
  }) : super(key: key);

  final Function()? onPressed;
  final Gradient? gradient;
  final IconData? icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
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
  }
}
