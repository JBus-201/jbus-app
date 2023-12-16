import 'package:flutter/material.dart';

abstract class AppTheme {
  // Common theme properties
  Color getMainBlue();
  Color getMainOrange();

  // Abstract method for theme creation
  ThemeData createTheme();
}
