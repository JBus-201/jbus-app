import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';

class OurTextButton extends StatelessWidget {
  const OurTextButton({Key? key, this.onPressed, this.text = ""})
      : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: ourNavey),
      ),
    );
  }
}
