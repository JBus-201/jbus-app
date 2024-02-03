import 'package:flutter/material.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class UpdateMobileNumberScreen extends StatelessWidget {
  const UpdateMobileNumberScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: const Center(
        child: Text('UpdateMobileNumberScreen'),
      ),
    );
  }
}
