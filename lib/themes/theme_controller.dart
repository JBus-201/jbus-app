import 'package:flutter/material.dart';

abstract class AppTheme {
  // Common theme properties
  Color getMainColor();
  Color getSecondaryColor();
  Color getThirdColor();
  Color getPointFColor();
  Color getPointSColor();
  Color getWhiteColor();
  Color getDarkGrayColor();
  LinearGradient getGoldGradient();

  // Abstract method for theme creation
  ThemeData createTheme();
}
