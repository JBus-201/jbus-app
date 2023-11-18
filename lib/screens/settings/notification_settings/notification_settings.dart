import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationSettingsScreen'),
      ),
      body: const Center(
        child: Text('NotificationSettingsScreen'),
      ),
    );
  }
}
