import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class OurText extends StatelessWidget {
  const OurText(
    this.data, {
    super.key,
    this.color = ourNavey,
    this.darkColor = ourWhite,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.fontFamily = "Arial",
  });
  final String data;
  final Color color;
  final Color darkColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Text(
        data,
        style: TextStyle(
          color: themeState.thememode == ThemeMode.light ? color : darkColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      );
    });
  }
}
