import 'package:flutter/material.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainDrawerScreen'),
      ),
      body: Center(
        child: Text('MainDrawerScreen'),
      ),
    );
  }
}
