import 'package:flutter/material.dart';

///  use the following line in the onPress or tap 
///   Provider.of<ThemeModel>(context, listen: false).toggleThemeMode();

class ThemeModel extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void toggleThemeMode() {
    switch (_currentThemeMode) {
      case ThemeMode.system:
        _currentThemeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _currentThemeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        _currentThemeMode = ThemeMode.system;
        break;
    }

    notifyListeners();
  }
}
