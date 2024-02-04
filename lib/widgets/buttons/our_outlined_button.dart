import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class OurOutlinedButton extends StatelessWidget {
  const OurOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderColor = ourNavey,
    this.textColor = ourNavey,
    this.height = 50,
    this.width = double.maxFinite,
    this.backgroundColor = ourWhite,
  });

  final void Function()? onPressed;
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00469484),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: MediaQuery.of(context).size.height * 0.00234742, color: borderColor),
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          backgroundColor: backgroundColor,
        ),
        child: OurText(
          text,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
