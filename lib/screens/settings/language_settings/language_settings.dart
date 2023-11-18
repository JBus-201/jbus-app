import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).language),
      ),
      body:  Center(
        child: Text(S.of(context).language),
      ),
    );
  }
}
