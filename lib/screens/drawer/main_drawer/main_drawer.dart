import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).drawer),
      ),
      body: Center(
        child: Text(S.of(context).drawer),
      ),
    );
  }
}
