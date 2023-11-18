import 'package:flutter/material.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguageSettingsScreen'),
      ),
      body: const Center(
        child: Text('LanguageSettingsScreen'),
      ),
    );
  }
}
