import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SigninScreen'),
      ),
      body: const Center(
        child: Text('SigninScreen'),
      ),
    );
  }
}
