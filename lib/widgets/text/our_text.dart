import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';

class OurText extends StatelessWidget {
  const OurText(
    this.data, {
    super.key,
    this.color = ourNavey,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.fontFamily = "Arial",
  });
  final String data;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
