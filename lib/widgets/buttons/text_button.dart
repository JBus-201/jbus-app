import 'package:flutter/material.dart';

class OurTextButton extends StatelessWidget {
  const OurTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.fontSize = 18});

  final Function()? onPressed;
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
