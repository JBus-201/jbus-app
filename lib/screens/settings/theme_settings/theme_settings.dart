import 'package:flutter/material.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeSettingsScreen'),
      ),
      body: const Center(
        child: Text('ThemeSettingsScreen'),
      ),
    );
  }
}
