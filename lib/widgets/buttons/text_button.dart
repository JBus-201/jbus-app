import 'package:flutter/material.dart';

class OurTextButton extends StatelessWidget {
  const OurTextButton({super.key, this.onPressed, this.text = ""});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
